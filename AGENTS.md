# AGENTS.md — VinaSciTech E-office · Advance Module

Đây là bộ khung (harness) làm việc bắt buộc cho mọi coding agent (Claude Code, Codex, Cursor...) trên repo **vibecode_advancemodule_eoffice** — module Tạm ứng & Hoàn ứng của E-office Logistics (Next.js/React, ngôn ngữ app & tài liệu bằng tiếng Việt).

**Nguồn sự thật nghiệp vụ duy nhất:** `docs/SRS-advance-module.md` (v1.0, 07/07/2026, tác giả Leo). Không dùng `docs/module-tam-ung-hoan-ung.md` (đã superseded, chỉ giữ tham khảo lịch sử).

---

## 1. Startup Workflow — bắt buộc trước khi viết code

1. **Xác nhận thư mục làm việc**: `pwd`
2. **Đọc toàn bộ file này**
3. **Đọc `docs/SRS-advance-module.md`** — đặc biệt phần System Features (mục 3) tương ứng với feature đang làm. KHÔNG tự suy diễn business rule nếu SRS đã quy định rõ.
4. **Kiểm tra codebase CSS/component thực tế** (xem mục 3 bên dưới — có rủi ro CSS token cũ chưa được dọn) trước khi code theo model Trip mới
5. **Chạy `./init.sh`** để xác nhận môi trường build/lint/test sạch
6. **Đọc `feature_list.json`** để biết feature nào đang active
7. **Xem lịch sử gần nhất**: `git log --oneline -5`

> Nếu baseline verification đang lỗi → sửa lỗi đó trước, không thêm scope mới lên nền đang hỏng.

---

## 2. Nguyên tắc làm việc

- **Một feature tại một thời điểm** — lấy đúng 1 feature từ `feature_list.json`
- **Không tự nhận "done"** nếu chưa chạy verification thật (lint / type-check / test / build)
- **Cập nhật artifact trước khi kết thúc phiên**: `progress.md` và `feature_list.json`
- **Không sửa file ngoài phạm vi** feature đang làm
- **Giữ trạng thái sạch** để phiên sau chạy `./init.sh` ngay được

---

## 3. ⚠️ Model Trip đã CHỐT (resolve mâu thuẫn nội bộ trong SRS)

SRS gốc tự mâu thuẫn giữa SF-1 (3.1.2) và SF-6/SF-7 (3.6-3.7) về status của Trip. **Đã chốt dùng theo SF-1**:

### Trip — state machine chính thức
```
draft → pendingdriver → ready → progress → end → closed
                ↓
           declined
     progress → canceled
```
- Trip CHỈ có 8 token: `draft, pendingdriver, ready, progress, end, closed, declined, canceled`
- **KHÔNG có** `await`, `settled`, `pendingclose`, `reopened` ở cấp Trip — đây là lỗi sót lại từ bản nháp cũ, không dùng.
- Toàn bộ luồng tài chính (Expense Verification SF-5, Settlement SF-6, Driver Confirmation SF-7) diễn ra **trong khi Trip đứng yên ở status `end`**.
- Trip chuyển `end → closed` MỘT LẦN DUY NHẤT, khi QLVH bấm Close — điều kiện: Settlement đã `settled` VÀ tài xế đã xác nhận OK.
- "Tài xế đã OK quyết toán" là một **field/flag riêng trên Trip** (vd `driver_confirmed_at`), **KHÔNG PHẢI** một Trip status transition. Đừng tạo status `pendingclose` cho Trip.

### Settlement — state machine RIÊNG, độc lập với Trip (đây là phần đúng, giữ nguyên từ SF-6 3.6.2)
```
draft → await (reviewing) → settled (confirmed) → closed
                          ↘ [cần điều chỉnh] → await
closed → reopened  (chỉ Giám đốc)
```
- Đây là state machine của **entity Settlement**, không phải Trip. Khi đọc SF-6/SF-7 trong SRS thấy ghi "Trip: await → settled" — đọc thành "**Settlement**: await → settled" (lỗi đánh máy trong SRS gốc).

### ⚠️ Rủi ro cần kiểm tra trước khi code (không tự giả định)
- Tài liệu cũ (`docs/module-tam-ung-hoan-ung.md`) từng nói các token `await/settled/pendingclose` **"được xác nhận trực tiếp từ CSS codebase"**. Nếu FE đã thực sự build UI/component dùng các token này cho Trip rồi → cần audit thực tế trước khi refactor, không phá vỡ UI đang chạy mà không báo PM.
- 2 lỗ hổng SRS tự thừa nhận CHƯA có flow, **không tự bịa ra**, hỏi PM nếu cần code phần này:
  - Tài xế "Dispute/Từ chối" quyết toán (Issues List C-005) — chưa có flow trong MVP
  - Giám đốc Reopen Settlement đã `closed` → Trip status lúc đó xử lý ra sao — SRS chưa định nghĩa

---

## 4. Ràng buộc nghiệp vụ bắt buộc — theo SRS v1.0

**Trip-centric:** mọi AdvanceRequest/Settlement phải gắn `trip_id` hợp lệ. Tạm ứng chuyến cần trip ≥ `ready`; tạm ứng phát sinh cần trip = `progress`.

**Finance Engine độc quyền:** chỉ Kế toán mới `verified`/`need-info`/`rejected` ExpenseItem. Tài xế chỉ tạo và nộp, không tự đổi status (REQ-EXP-007).

**Approval threshold:** amount ≤ `standard_advance × 1.3` → Kế toán duyệt; vượt ngưỡng → Giám đốc duyệt. Routing tự động, QLVH không chọn thủ công.

**Reject/Need-info bắt buộc có lý do** — không cho submit nếu để trống (áp dụng cho AdvanceRequest reject, Expense reject/need-info, Trip decline).

**Disbursement record** phải ghi đủ: ngày chi thực tế, số tiền, phương thức (tiền mặt/chuyển khoản), người chi (`user_id`). Tự động tạo `CashMovement` record kèm theo.

**Expense Capture offline-first (SF-4):**
- Ghi local khi mất mạng, `sync_status: Pending → Synced` khi có mạng lại
- Mỗi ExpenseItem có `idempotency_key` (dựa trên `local_uuid`) để chống ghi trùng khi sync
- Loại chi phí: Xăng dầu, BOT/Phí cầu đường, Ăn uống, Bốc xếp, Sửa chữa/phát sinh, Khác
- Không có ảnh chứng từ → tự động tạo flag "Missing Receipt Exception"

**Expense Verification (SF-5):** state machine `submitted → verified | need-info → resubmitted → verified|rejected | rejected`. Settlement chỉ unlock khi TẤT CẢ expense đã ở trạng thái cuối (verified/rejected), không còn need-info chưa resubmit.

**Settlement (SF-6):** `Variance = Total Advance − Total Valid Expense`. Variance > 0 → REFUND_REQUIRED; < 0 → ADDITIONAL_PAYMENT; = 0 → BALANCED. Sau Confirm → lock, chỉ Giám đốc Reopen được.

**Driver Balance (SF-8):** entry tự động tạo khi Settlement chuyển `settled` (không tạo tay). `credit` nếu REFUND_REQUIRED, `debit` nếu ADDITIONAL_PAYMENT. State: `open → partially-cleared → cleared` hoặc `open → disputed → adjusted → cleared`. Ledger liên tục, không ghi đè lịch sử.

**Không hard-delete dữ liệu tài chính** — chỉ void/reverse/cancel/adjust/reopen, luôn kèm `AuditLog` (user_id, timestamp, old_status, new_status, reason nếu có).

**GPS bắt buộc khi Trip End** — block action, hiện cảnh báo nếu GPS tắt (REQ-TM-006).

**Notification (SF-9):** 9 trigger cố định N-01→N-09 (xem SRS 3.9.3), gửi trong < 30 giây, retry tối đa 3 lần nếu fail. SLA Alert tự động khi chuyến ở `end` chưa có Settlement `settled` quá 72h (±5 phút), gửi đồng thời QLVH + Kế toán.

**Export (SF-10):** CSV/PDF trong < 10 giây; format CSV tương thích cấu trúc import MISA/Fast Accounting.

---

## 5. Artifact bắt buộc

- `feature_list.json` — nguồn sự thật về trạng thái feature (11 feature: setup + SF-1 → SF-10)
- `progress.md` — log liên tục qua các phiên
- `init.sh` — verification chuẩn
- `session-handoff.md` — bàn giao phiên dài

## 6. Định nghĩa "Done"

- [ ] Hành vi đúng đặc tả trong `docs/SRS-advance-module.md` (đúng mục SF-X liên quan, không dùng `docs/module-tam-ung-hoan-ung.md`)
- [ ] Verification đã chạy thật (lint/type-check/test/build)
- [ ] Bằng chứng ghi trong `feature_list.json` (`evidence`) hoặc `progress.md`
- [ ] Repo khởi động lại được từ `./init.sh`
- [ ] Nếu feature đụng Trip status → xác nhận đã dùng đúng 8 token ở mục 3, không lẫn `await/settled/pendingclose` vào Trip

## 7. Verification Commands

```bash
npm run lint
npm run type-check
npm test
npm run build
```

## 8. Escalation

- **Mâu thuẫn SRS phát hiện thêm** → dừng lại, ghi vào `progress.md` mục "Vướng mắc", hỏi PM — không tự chọn 1 bên rồi code luôn
- **Đụng vào C-005 (dispute settlement) hoặc luồng Reopen ảnh hưởng Trip status** → hỏi PM trước, SRS chưa định nghĩa đủ để tự code
- **Nghi ngờ CSS/component cũ đã dùng token `await/settled/pendingclose` cho Trip** → audit trước, báo PM trước khi refactor
- **Kiến trúc lớn / đổi dependency** → hỏi PM
- **Test fail lặp lại** → ghi `progress.md`, gắn cờ review, không vá mù
