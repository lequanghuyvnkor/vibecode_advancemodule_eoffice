# VinaSciTech E-office — Advance Module (vibecode_advancemodule_eoffice)

Repo triển khai module **Tạm ứng & Hoàn ứng (Advance & Settlement)** của VinaSciTech E-office — phần mềm B2B SaaS quản lý vận hành logistics. Frontend: React/Next.js. Ngôn ngữ app & tài liệu: Tiếng Việt.

## Cấu trúc thư mục

```
.
├── AGENTS.md              ← Luật làm việc bắt buộc cho coding agent — ĐỌC MỤC 3 TRƯỚC (resolve mâu thuẫn Trip state machine)
├── feature_list.json      ← 11 feature: setup + SF-1 → SF-10, khớp SRS
├── progress.md            ← Log tiến độ + rủi ro/vướng mắc đang theo dõi
├── init.sh                ← Verification chuẩn (install + lint + type-check + test + build)
├── session-handoff.md     ← Bàn giao phiên dài / nhiều agent
├── docs/
│   ├── SRS-advance-module.md         ← ⭐ NGUỒN SỰ THẬT CHÍNH — SRS v1.0 (07/07/2026), 10 System Feature SF-1→SF-10
│   ├── module-tam-ung-hoan-ung.md    ← ĐÃ SUPERSEDED, chỉ giữ tham khảo lịch sử
│   └── ui-reference/
│       └── VinaSciTech E-Office_v2.1 (1).html  ← Thiết kế giao diện (UI) mẫu để tham khảo và code lại
└── src/                   ← (chưa tạo — code Next.js/React thực tế)
```

## ⚠️ Lưu ý quan trọng trước khi code

SRS gốc có mâu thuẫn nội bộ về Trip state machine giữa SF-1 và SF-6/SF-7. **Đã chốt dùng theo SF-1** — chi tiết đầy đủ và lý do ở `AGENTS.md` mục 3. Bất kỳ ai (người hoặc agent) đụng vào Trip status đều phải đọc mục đó trước, không suy luận từ SRS gốc trực tiếp vì SRS gốc tự mâu thuẫn.

## Bắt đầu làm việc

1. Đọc `AGENTS.md` toàn bộ — đặc biệt mục 3 và mục 4
2. Đọc `docs/SRS-advance-module.md` phần System Features (mục 3 trong SRS) tương ứng feature đang làm
3. Tham khảo giao diện tại `docs/ui-reference/VinaSciTech E-Office_v2.1 (1).html` để xây dựng giao diện
4. Chạy `./init.sh`
4. Đọc `feature_list.json`, chọn 1 feature `not-started`
5. Trước khi kết thúc phiên: cập nhật `progress.md` + `feature_list.json`, commit rõ ràng

## Phạm vi module (10 System Feature theo SRS)

| SF | Tên | Ưu tiên |
|---|---|---|
| SF-1 | Trip Management | HIGH |
| SF-2 | Advance Request | HIGH |
| SF-3 | Approval & Disbursement | HIGH |
| SF-4 | Expense Capture | HIGH |
| SF-5 | Expense Verification | HIGH |
| SF-6 | Settlement Calculation | HIGH |
| SF-7 | Driver Confirmation & Trip Closing | HIGH |
| SF-8 | Driver Balance | HIGH |
| SF-9 | Notification & SLA Alert | HIGH |
| SF-10 | Dashboard, Reporting & Export | MED |

Chi tiết đầy đủ từng SF (state machine, functional requirements, stimulus/response) xem `docs/SRS-advance-module.md`.

## Vấn đề nghiệp vụ chưa có lời giải (Issues List)

- Tài xế Dispute/Từ chối quyết toán (C-005) — chưa có flow trong MVP
- Giám đốc Reopen Settlement đã `closed` → ảnh hưởng Trip status ra sao — chưa định nghĩa
- Ngưỡng duyệt 1.3× có nên khác nhau theo route/khách hàng không (Assumption A3) — hiện đồng nhất toàn hệ thống
