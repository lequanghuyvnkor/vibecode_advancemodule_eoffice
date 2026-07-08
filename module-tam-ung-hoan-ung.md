# Module Instruction — Tạm Ứng & Hoàn Ứng (Advance & Settlement)
## VinaSciTech E-office MVP · Finance Engine
> Phiên bản cập nhật 3: Đồng bộ với codebase thực tế · 4 role · Status tokens từ CSS · Luồng đóng chuyến 3 bên

---

## 1. Phạm vi module này bao gồm

Module này bao gồm toàn bộ vòng đời tài chính gắn với một chuyến xe. Gồm 5 sub-module trong Finance Engine:

| Sub-module | Chức năng chính |
|---|---|
| **Advance Request** | Tạo và kiểm soát yêu cầu tạm ứng gắn với chuyến |
| **Approval & Disbursement** | Phê duyệt theo role và ghi nhận tiền thực chi |
| **Expense Verification** | Kế toán đối soát từng khoản chi — hợp lệ hay ngoại lệ |
| **Settlement** | Đóng vòng tài chính chuyến: tính chênh lệch, xác nhận quyết toán |
| **Driver Balance** | Ghi công nợ tài xế sau khi Settlement được Confirmed |

---

## 2. Nguyên tắc cốt lõi — không được vi phạm

**2.1. Trip là trung tâm**
- Mọi `AdvanceRequest` phải gắn `trip_id` hợp lệ, status chuyến phải là `ready` trở lên
- Không tạo tạm ứng "tự do" không gắn chuyến
- Nếu chuyến bị hủy sau khi đã `disbursed` → bắt buộc có luồng Reversal hoặc chuyển công nợ riêng

**2.2. Finance Engine kiểm soát tiền**
- Logistics Engine tạo và nộp `ExpenseItem`
- Chỉ Kế toán (Finance Engine) mới có quyền `verified` / `rejected` / `need-info`
- Không đề xuất kiến trúc cho phép Logistics Engine tự xác nhận chi phí

**2.3. Chuỗi phụ thuộc tuần tự**
```
[ready] Tạo Advance Request
  → Duyệt (Kế toán hoặc Giám đốc tùy ngưỡng)
    → Disbursed (Kế toán ghi nhận giải ngân)
      → Trip In Progress (tài xế chạy)
        → Trip End (tài xế end + GPS bắt buộc)
          → Kế toán Verify expense
            → Settlement Confirmed
              → Driver Balance Posted
                → Quản lý vận hành Closed chuyến
```

**2.4. Dữ liệu tài chính không hard-delete**
- Chỉ được void / reverse / cancel / adjust / reopen theo đúng quyền
- Mọi thay đổi phải có `AuditLog`

---

## 3. Status system — từ CSS design tokens thực tế

> ⚠️ Các status token này được xác nhận trực tiếp từ codebase CSS của app

### Trip statuses
| CSS Token | Hiển thị | Mô tả |
|---|---|---|
| `draft` | Draft | Vừa tạo, có thể edit tự do |
| `pendingdriver` | Waiting Driver Accept | Đã gửi cho tài xế, chờ phản hồi |
| `ready` | Ready | Tài xế đã Accept |
| `progress` | In Progress | Tài xế đang chạy |
| `await` | Awaiting Settlement | Tài xế đã End, chờ kế toán |
| `settled` | Settled | Kế toán đã confirm settlement |
| `pendingclose` | Pending Close | Tài xế đã OK quyết toán, chờ QLVH đóng |
| `closed` | Closed | Đã đóng hoàn toàn |
| `canceled` | Cancelled | Đã hủy (có lý do) |
| `declined` | Declined | Tài xế từ chối nhận |
| `reopened` | Reopened | Đã mở lại (Giám đốc) |

### Advance Request statuses
| CSS Token | Hiển thị | Mô tả |
|---|---|---|
| `draft` | Draft | Vừa tạo |
| `pending` | Pending Approval | Chờ duyệt |
| `approved` | Approved | Đã duyệt |
| `disbursed` | Disbursed | Đã giải ngân |
| `rejected` | Rejected | Bị từ chối |

### Expense Item statuses
| CSS Token | Hiển thị | Mô tả |
|---|---|---|
| `submitted` | Submitted | Tài xế đã nộp |
| `verified` | Verified | Kế toán đã xác nhận hợp lệ |
| `need-info` | Need Info | Yêu cầu bổ sung |
| `rejected` | Rejected | Bị loại |

### Settlement statuses
| CSS Token | Hiển thị |
|---|---|
| `draft` | Draft |
| `await` | Reviewing |
| `settled` | Confirmed |
| `closed` | Closed |
| `reopened` | Reopened |

---

## 4. State machines đầy đủ

### Trip
```
draft → pendingdriver → ready → progress → await → settled → pendingclose → closed
                  ↓             ↓
              declined       canceled
```

### AdvanceRequest
```
draft → pending → approved → disbursed
               ↘ rejected
     approved → canceled (trước khi disbursed)
     disbursed → [reversal required]
```

### ExpenseItem (Finance Engine)
```
submitted → [under review] → verified → [included in settlement]
                           ↘ need-info → resubmitted → [under review]
                           ↘ rejected
```

### Settlement
```
draft → await (reviewing) → settled (confirmed) → closed
                          ↘ [adjustment required] → await
closed → reopened (Giám đốc only)
```

### Driver Balance Entry
```
open → partially-cleared → cleared
     ↘ disputed → adjusted → cleared
```

---

## 5. Luồng đóng chuyến (Trip Closing Flow) — usecase bắt buộc

```
┌──────────────────┬──────────────────────┬───────────────────────────┐
│   APP TÀI XẾ     │    APP KẾ TOÁN       │  APP QUẢN LÝ VẬN HÀNH    │
├──────────────────┼──────────────────────┼───────────────────────────┤
│ 1. Bấm End       │                      │                           │
│    chuyến        │                      │                           │
│ 2. GPS lưu tức   │                      │                           │
│    thì + xác     │                      │                           │
│    nhận "Đã lưu  │                      │                           │
│    vị trí ✓"     │                      │                           │
│    Trip → await  │                      │                           │
│                  │ 3. Nhận thông báo    │                           │
│                  │    "Chuyến X cần     │                           │
│                  │    đối soát"         │                           │
│                  │ 4. Verify từng       │                           │
│                  │    khoản chi         │                           │
│                  │ 5. Tính Settlement   │                           │
│                  │    (variance)        │                           │
│                  │ 6. Confirm           │                           │
│                  │    Settlement        │                           │
│                  │    Trip → settled    │                           │
│ 7. Nhận kết quả  │                      │                           │
│    quyết toán    │                      │                           │
│    (hoàn/nhận    │                      │                           │
│    thêm/đủ)      │                      │                           │
│ 8. Bấm OK xác    │                      │                           │
│    nhận          │                      │                           │
│    Trip →        │                      │                           │
│    pendingclose  │                      │                           │
│                  │                      │ 9. Nhận thông báo         │
│                  │                      │    "Tài xế đã xác nhận"   │
│                  │                      │ 10. Bấm Close chuyến      │
│                  │                      │     Trip → closed         │
└──────────────────┴──────────────────────┴───────────────────────────┘
```

**Ràng buộc:**
- Bước 2 (GPS): Bắt buộc, không thể skip. Nếu GPS tắt → cảnh báo, yêu cầu bật
- Bước 10 (Close): Chỉ unlock sau khi tài xế OK ở bước 8 (status = `pendingclose`)
- QLVH KHÔNG thể Close nếu tài xế chưa OK

---

## 6. Phân biệt Tạm ứng đầu trip vs Tạm ứng trong trip

| | **Tạm ứng chuyến** (đầu trip) | **Tạm ứng phát sinh** (trong trip) |
|---|---|---|
| **Thời điểm** | Trước khi chạy (status = `ready`) | Trong khi chạy (status = `progress`) |
| **Ai tạo** | QLVH tạo, tài xế thấy kết quả | Tài xế tự yêu cầu |
| **Mục đích** | Dự toán chuẩn cho tuyến | Phát sinh ngoài dự toán |
| **Nhãn UI** | **"Tạm ứng chuyến"** | **"Tạm ứng phát sinh"** |
| **Cả hai** | Tính vào Total Advance trong Settlement | |

---

## 7. Luồng duyệt Advance Request (4 role)

```
QLVH tạo AdvanceRequest → Submit

Hệ thống kiểm tra ngưỡng:
  ├── ≤ standard_advance × 1.3 → Kế toán nhận thông báo
  │     → Approved → Kế toán ghi Disbursement → CashMovement
  │     → Rejected → QLVH nhận thông báo
  └── > standard_advance × 1.3 → Giám đốc nhận thông báo
        → Approved → Kế toán ghi Disbursement → CashMovement
        → Rejected → QLVH nhận thông báo

Tài xế nhận thông báo "Đã giải ngân X đồng"
(có label rõ: tạm ứng chuyến hay tạm ứng phát sinh)
```

---

## 8. Tạo chuyến mới — quy tắc UX (cập nhật)

**Gộp 3 bước thành 1 trang duy nhất:**
- **Tuyến (Route)**: Dropdown chọn tuyến có sẵn + nút `[+ Tạo quãng đường mới]`
- **Ngày đi** / **Ngày về**: date picker (thay cho "thời gian dự kiến")
- **Thông tin hàng hoá**: 1 text field (thay cho form nhiều trường)
- **Chọn tài xế & xe**: search/select
- **Dự toán chi phí**: tự điền theo `route.standard_advance_amount`, cho phép chỉnh. Nếu vượt ngưỡng → badge cảnh báo "Cần Giám đốc duyệt"

**Flow sau khi Submit:**
- Trip tạo ra ở status `draft`
- QLVH review → Submit cho tài xế → Trip chuyển `pendingdriver`
- AdvanceRequest tự động tạo và submit duyệt song song

---

## 9. App Tài xế — các usecase bắt buộc

### Nhận/từ chối chuyến
```
Nhận push notification "Bạn được phân công chuyến [mã]"
→ Xem chi tiết: tuyến, ngày đi/về, hàng hoá, tạm ứng dự kiến
→ [Accept] → Trip: pendingdriver → ready
→ [Từ chối] → bắt buộc nhập lý do → Trip → declined
```

### Trong chuyến
```
→ Bấm "Bắt đầu chạy" → Trip: ready → progress
→ Ghi chi phí (ExpenseItem)
→ Chụp bill / upload chứng từ
→ Yêu cầu tạm ứng thêm (nhãn "Tạm ứng phát sinh")
```

### End chuyến
```
→ Bấm "End chuyến"
→ Hệ thống lấy GPS ngay lập tức
→ Hiển thị "Đã lưu vị trí: [địa chỉ] ✓"
   (Nếu GPS tắt → cảnh báo, không cho End)
→ Trip: progress → await
→ Hiển thị "Đang chờ kế toán xử lý..."
```

### Xác nhận quyết toán
```
→ Nhận thông báo kết quả quyết toán
→ Xem: tổng tạm ứng / tổng chi hợp lệ / chênh lệch
→ [OK xác nhận] → Trip: settled → pendingclose
```

---

## 10. Business rules

| Rule | Mô tả |
|---|---|
| R1 | Tạm ứng phải gắn chuyến hợp lệ (status ≥ `ready`) |
| R2 | AdvanceRequest đã `approved` không sửa trực tiếp — phải cancel và tạo mới |
| R3 | Tạm ứng > `standard_advance × 1.3` → bắt buộc duyệt **Giám đốc** |
| R4 | Expense không có receipt → tự động tạo "Missing Receipt Exception" |
| R5 | Trip ở `await` quá 72h chưa Settlement → tạo SLA Alert |
| R6 | Driver Balance chỉ ghi sau khi Settlement = `settled` (confirmed) |
| R7 | Settlement đã `closed` → chỉ **Giám đốc** mới được Reopen |
| R8 | Chuyến bị hủy sau khi đã `disbursed` → cần luồng Reversal hoặc chuyển nợ |
| R9 | Tài xế bấm End chuyến → GPS bắt buộc, hiện xác nhận "Đã lưu vị trí ✓" |
| R10 | QLVH chỉ Close được khi Trip ở status `pendingclose` (tài xế đã OK) |
| R11 | Tạm ứng đầu trip và trong trip hiển thị label phân biệt trong App Tài xế |
| R12 | Form tạo chuyến mới là 1 trang duy nhất (gộp thông tin + tài xế + dự toán) |

---

## 11. Phân quyền 4 role

| Role | CSS Token | Màu | Quyền trong module này |
|---|---|---|---|
| **Quản lý vận hành** | `--dispatch` | Navy #002d72 | Tạo chuyến; tạo & submit AdvanceRequest; theo dõi; cảnh báo SLA; Close chuyến (sau khi tài xế OK) |
| **Kế toán** | `--acc` | Brown #8b5a00 | Duyệt AdvanceRequest (ngưỡng thường); ghi Disbursement; Verify expense; tạo & confirm Settlement; xem Driver Balance; export |
| **Giám đốc** | `--dir` | Purple #4a1d96 | Duyệt AdvanceRequest vượt ngưỡng; Reopen Settlement đã closed; xem variance & cash exposure tổng thể |
| **Tài xế** | `--driver` | Green #066e52 | Accept/Từ chối nhận chuyến; ghi chi phí; chụp bill; yêu cầu tạm ứng phát sinh; End chuyến + GPS; OK quyết toán |

---

## 12. Công thức Settlement

```
Total Advance       = SUM(disbursement.amount WHERE trip_id = X)
Total Valid Expense = SUM(expense.amount WHERE trip_id = X AND status = 'verified')
Variance            = Total Advance - Total Valid Expense

Variance > 0  → Tài xế dư tiền → REFUND_REQUIRED
Variance < 0  → Công ty chi bù → ADDITIONAL_PAYMENT
Variance = 0  → Cân bằng       → BALANCED
```

---

## 13. API endpoints liên quan

```
# Trip lifecycle
POST   /trips                          ← Tạo chuyến (1 trang)
PATCH  /trips/{id}                     ← Edit khi còn draft
POST   /trips/{id}/submit              ← QLVH gửi cho tài xế
POST   /trips/{id}/accept              ← Tài xế accept
POST   /trips/{id}/decline             ← Tài xế từ chối (body: reason)
POST   /trips/{id}/start               ← Tài xế bắt đầu
POST   /trips/{id}/end                 ← Tài xế end (body: gps_lat, gps_lng)
POST   /trips/{id}/driver-confirm      ← Tài xế OK quyết toán
POST   /trips/{id}/close               ← QLVH đóng chuyến

# Advance
POST   /trips/{id}/advance-requests
POST   /advance-requests/{id}/submit
POST   /advance-requests/{id}/approve
POST   /advance-requests/{id}/reject
POST   /advance-requests/{id}/disburse

# Expense Verification
GET    /finance/expense-verification-queue
POST   /expenses/{id}/verify
POST   /expenses/{id}/need-more-info
POST   /expenses/{id}/reject

# Settlement
POST   /trips/{id}/settlements/calculate
POST   /settlements/{id}/confirm
POST   /settlements/{id}/close
POST   /settlements/{id}/reopen        ← Giám đốc only

# Driver Balance
GET    /drivers/{id}/balance
GET    /finance/driver-balances
```

---

## 14. Thuật ngữ chuẩn

| Code / CSS token | UI Label (tiếng Việt) |
|---|---|
| `advance-request` | Yêu cầu tạm ứng |
| Advance (đầu trip) | Tạm ứng chuyến |
| Advance (trong trip) | Tạm ứng phát sinh |
| `disbursement` | Giải ngân |
| `expense-verification` | Đối soát / xác minh chi phí |
| `settlement` | Quyết toán chuyến |
| `driver-balance` | Công nợ tài xế |
| `variance` | Chênh lệch tạm ứng – chi phí |
| `reversal` | Thu hồi / hoàn trả |
| Trip `await` status | Chờ quyết toán |
| Trip `pendingclose` status | Chờ đóng chuyến |
| Trip `end` action | Kết thúc chuyến (tài xế) |
| Trip `close` action | Đóng chuyến (QLVH) |

---

## 15. Ghi chú về codebase thực tế

**Từ file HTML app (VinaSciTech_E-Office_v2_1.html):**
- App là React SPA, build với Bun bundler
- Design system: custom CSS variables, 4 role colors (`--dispatch`, `--driver`, `--acc`, `--dir`)
- Status tokens đã được xác nhận từ CSS: `draft`, `pendingdriver`, `ready`, `progress`, `await`, `settled`, `pendingclose`, `closed`, `canceled`, `declined`, `reopened`
- App đã có `--status-pendingclose` token → luồng 3 bên (tài xế OK trước khi QLVH close) đã được thiết kế trong hệ thống

**Lưu ý khi viết tài liệu:** Dùng đúng status token từ CSS (không phải từ tài liệu gốc). Ví dụ: `await` (không phải `AwaitingSettlement`), `settled` (không phải `Confirmed`).

---

*Dựa trên: tài liệu "Logistics & Finance Engine — VinaSciTech E-office MVP" + codebase CSS tokens từ VinaSciTech_E-Office_v2_1.html + workflow diagram vst_eoffice_4_app_workflows. Cập nhật lần 3.*