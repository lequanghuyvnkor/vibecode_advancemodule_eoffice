# Session Progress Log — VinaSciTech E-office · Advance Module

## Trạng thái hiện tại

**Cập nhật lần cuối:** [YYYY-MM-DD HH:MM]
**Session ID:** [tuỳ chọn]
**Feature đang active:** feat-001 - Project Setup & Verification Baseline

## Tình trạng

### Đã xong

- [x] Khởi tạo harness (AGENTS.md, feature_list.json, init.sh, progress.md, session-handoff.md)
- [x] Đối chiếu harness với `docs/SRS-advance-module.md` (v1.0) — resolve mâu thuẫn Trip state machine, cập nhật feature_list theo đúng 10 System Feature (SF-1 → SF-10)

### Đang làm

- [ ] [Việc đang làm]
  - Chi tiết: [mô tả cụ thể]
  - Vướng mắc: [nếu có]

### Sắp làm

1. Chạy `./init.sh`, xác nhận baseline sạch
2. **Trước khi code feat-002 (SF-1 Trip):** audit codebase CSS/component thực tế xem token `await/settled/pendingclose` đã được dùng cho Trip chưa — nếu có, cần kế hoạch migrate, không refactor mù

## Vướng mắc / Rủi ro

- [ ] **[Đã biết — cần theo dõi]** SRS tự mâu thuẫn Trip state machine giữa SF-1 và SF-6/SF-7 → đã chốt dùng SF-1 (xem `AGENTS.md` mục 3). Nếu team dev có ý kiến khác, cần đồng bộ lại trước khi code sâu.
- [ ] **[Rủi ro kỹ thuật]** Tài liệu cũ nói token `await/settled/pendingclose` đã có trong CSS codebase thật — nếu đúng, đổi sang model SF-1 (chỉ còn `end`) có thể phá UI/component đã build. Cần audit trước feat-002.
- [ ] **[Lỗ hổng nghiệp vụ — SRS chưa định nghĩa]** Luồng tài xế Dispute/Từ chối quyết toán (Issues List C-005) — chưa có flow, không tự code khi gặp trong feat-008.
- [ ] **[Lỗ hổng nghiệp vụ — SRS chưa định nghĩa]** Giám đốc Reopen Settlement đã `closed` → Trip status lúc đó xử lý ra sao — SRS không nói rõ. Cần hỏi Leo/PM trước khi code phần Reopen trong feat-007.
- [ ] **[Assumption A1 trong SRS]** Toàn bộ module này giả định Trip lifecycle đã ổn định sẵn trong Logistics Engine trước khi triển khai. Nếu Logistics Engine chưa xong, feat-002 trở đi bị block.

## Quyết định đã chốt

- **Trip state machine dùng theo SF-1**: 8 token (`draft, pendingdriver, ready, progress, end, closed, declined, canceled`), không có `await/settled/pendingclose/reopened` ở cấp Trip.
  - Bối cảnh: SRS mâu thuẫn giữa SF-1 (đơn giản hoá) và SF-6/SF-7 (dùng token cũ). PM đã xác nhận chọn SF-1.
  - Phương án khác đã cân nhắc: giữ theo SF-6/SF-7 (token cũ) — không chọn vì SF-1 là định nghĩa chính thức của Trip Management, có lý do thiết kế rõ ràng hơn.
- **Settlement giữ state machine riêng** (`draft → await → settled → closed → reopened`) — không đổi, vì đây là entity khác với Trip, không mâu thuẫn với quyết định trên.
- **"Tài xế OK quyết toán" là field/flag trên Trip, không phải Trip status** (vd `driver_confirmed_at`) — để tránh phải thêm status `pendingclose` cho Trip.

## File đã sửa trong phiên này

- `AGENTS.md` — viết lại theo SRS, thêm mục 3 (resolve Trip state machine)
- `feature_list.json` — viết lại 11 feature theo SF-1 → SF-10
- `docs/SRS-advance-module.md` — thêm mới, là nguồn sự thật chính
- `docs/module-tam-ung-hoan-ung.md` — đánh dấu superseded, giữ tham khảo lịch sử
- `README.md` — cập nhật cấu trúc

## Bằng chứng hoàn thành

- [ ] Test pass: `[lệnh và kết quả]`
- [ ] Type-check sạch: `[lệnh và kết quả]`
- [ ] Manual verification: `[đã test cái gì]`

## Ghi chú cho phiên sau

Đọc `AGENTS.md` mục 3 TRƯỚC KHI đụng vào bất kỳ code nào liên quan Trip status. Đây là điểm dễ sai nhất trong toàn bộ module vì bản thân SRS gốc cũng từng mâu thuẫn — đừng tin theo trực giác từ đọc lướt SF-6/SF-7, luôn quay lại mục 3 của AGENTS.md để lấy bản đã resolve.
