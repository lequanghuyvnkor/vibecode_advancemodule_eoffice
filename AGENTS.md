# AGENTS.md — VinaSciTech E-office Logistics

Đây là bộ khung (harness) làm việc bắt buộc cho mọi coding agent (Claude Code, Codex, Cursor...) trên repo **VinaSciTech E-office** — phần mềm B2B SaaS quản lý vận hành logistics (Next.js/React, ngôn ngữ app & tài liệu bằng tiếng Việt).

Mục tiêu của file này: giúp agent bắt đầu đúng, không đi lệch phạm vi, tự kiểm chứng trước khi báo "xong", và bàn giao được cho phiên làm việc kế tiếp.

---

## 1. Startup Workflow — bắt buộc trước khi viết code

1. **Xác nhận thư mục làm việc**: chạy `pwd`
2. **Đọc toàn bộ file này**
3. **Đọc tài liệu nghiệp vụ** trong `docs/` — đặc biệt các file spec module (vd: "Hoàn ứng & Tạm ứng — Hướng dẫn cho AI"). Đây là nguồn sự thật về nghiệp vụ, KHÔNG được tự suy diễn khi tài liệu đã quy định rõ.
4. **Chạy `./init.sh`** để xác nhận môi trường build/lint/test sạch
5. **Đọc `feature_list.json`** để biết feature nào đang active
6. **Xem lịch sử gần nhất**: `git log --oneline -5`

> Nếu baseline verification đang lỗi → sửa lỗi đó trước, tuyệt đối không thêm scope mới lên trên nền đang hỏng.

---

## 2. Nguyên tắc làm việc

- **Một feature tại một thời điểm** — lấy đúng 1 feature `not-started` hoặc `in-progress` từ `feature_list.json`, không tự ý làm song song nhiều feature
- **Không tự nhận "done"** nếu chưa chạy verification thật (lint / type-check / test / build)
- **Cập nhật artifact trước khi kết thúc phiên**: `progress.md` và `feature_list.json`
- **Không sửa file ngoài phạm vi** feature đang làm
- **Giữ trạng thái sạch** — phiên sau phải chạy `./init.sh` chạy được ngay, không cần dọn dẹp thủ công

---

## 3. Ràng buộc nghiệp vụ bắt buộc — KHÔNG ĐƯỢC VI PHẠM

> Trích từ tài liệu spec "Hoàn ứng & Tạm ứng — Hướng dẫn cho AI". Nếu code liên quan đến module tài chính chuyến (Advance/Settlement/Expense/Driver Balance), agent phải tuân thủ nghiêm:

- **Trip là trung tâm**: mọi `AdvanceRequest` phải gắn `trip_id` hợp lệ, trip status phải ≥ `ready`. Không tạo tạm ứng tự do không gắn chuyến.
- **Finance Engine kiểm soát tiền**: chỉ Kế toán mới có quyền `verified` / `rejected` / `need-info` trên `ExpenseItem`. Không thiết kế cho phép Logistics Engine tự xác nhận chi phí.
- **Chuỗi phụ thuộc tuần tự bắt buộc**:
  `ready → duyệt → disbursed → progress → await → verify expense → settled → driver balance posted → pendingclose → closed`
- **Không hard-delete dữ liệu tài chính** — chỉ void / reverse / cancel / adjust / reopen, và mọi thay đổi phải có `AuditLog`.
- **Dùng đúng status token từ CSS thực tế**, KHÔNG dùng tên hiển thị:
  Trip: `draft, pendingdriver, ready, progress, await, settled, pendingclose, closed, canceled, declined, reopened`
  AdvanceRequest: `draft, pending, approved, disbursed, rejected`
  ExpenseItem: `submitted, verified, need-info, rejected`
  Settlement: `draft, await, settled, closed, reopened`
- **GPS bắt buộc khi tài xế bấm "End chuyến"** — không cho end nếu GPS tắt.
- **QLVH chỉ được Close chuyến khi trip đang ở `pendingclose`** (tức tài xế đã xác nhận quyết toán).
- **Settlement đã `closed` → chỉ Giám đốc mới được Reopen.**

Nếu spec module khác (đơn hàng, CRM, tracking...) mâu thuẫn với các quy tắc trên, dừng lại và hỏi PM — không tự quyết định.

---

## 4. Artifact bắt buộc trong repo

- `feature_list.json` — nguồn sự thật duy nhất về trạng thái feature
- `progress.md` — log liên tục qua các phiên làm việc
- `init.sh` — verification chuẩn, chạy được ngay từ checkout sạch
- `session-handoff.md` — bàn giao chi tiết cho phiên dài / nhiều agent

---

## 5. Định nghĩa "Done"

Một feature chỉ được đánh dấu `done` khi TẤT CẢ đều đúng:

- [ ] Hành vi đúng như đặc tả nghiệp vụ (đối chiếu đúng file spec module liên quan trong `docs/`)
- [ ] Verification đã chạy thật: lint / type-check / test / build — không giả định là pass
- [ ] Có bằng chứng cụ thể ghi trong `feature_list.json` (field `evidence`) hoặc `progress.md`
- [ ] Repo vẫn khởi động lại được từ đầu bằng `./init.sh`

---

## 6. Verification Commands

```bash
npm run lint
npm run type-check   # hoặc: npm run typecheck / npx tsc --noEmit
npm test
npm run build
```

> Nếu `package.json` chưa có đủ 4 script trên, việc đầu tiên cần làm (thuộc `feat-001`) là bổ sung chúng — không được coi verification là "đã chạy" nếu script không tồn tại.

---

## 7. Escalation — khi nào phải dừng lại hỏi người, không tự quyết

- **Quyết định kiến trúc lớn** (đổi state management, đổi cấu trúc thư mục, thêm dependency lớn) → hỏi PM, không tự quyết
- **Yêu cầu nghiệp vụ chưa rõ hoặc thiếu trong `docs/`** → hỏi PM, không tự suy đoán rule tài chính
- **Test fail lặp lại nhiều lần trên cùng 1 lỗi** → ghi vào `progress.md`, gắn cờ cần người review, không tiếp tục vá mù
- **Không chắc phạm vi feature** → đọc lại `feature_list.json`, mục `description` và `dependencies` trước khi hỏi
