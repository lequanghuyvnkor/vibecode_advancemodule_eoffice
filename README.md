# VinaSciTech E-office — Advance Module (vibecode_advancemodule_eoffice)

Repo triển khai module **Tạm ứng & Hoàn ứng (Advance & Settlement)** của VinaSciTech E-office — phần mềm B2B SaaS quản lý vận hành logistics. Frontend: React/Next.js. Ngôn ngữ app & tài liệu: Tiếng Việt.

## Cấu trúc thư mục

```
.
├── AGENTS.md              ← Luật làm việc bắt buộc cho coding agent (Claude Code, Codex...)
├── feature_list.json      ← Nguồn sự thật về trạng thái từng feature
├── progress.md            ← Log tiến độ qua các phiên làm việc
├── init.sh                ← Script verification chuẩn (install + lint + type-check + test + build)
├── session-handoff.md     ← Bàn giao chi tiết cho phiên làm việc dài / nhiều agent
├── docs/
│   └── [VST][EOFFICE][ADVANCE] SRS.md   ← Tài liệu mô tả yêu cầu phần mềm (SRS)
└── src/                   ← (chưa tạo — chứa code Next.js/React thực tế của module)
```

## Bắt đầu làm việc (cho người hoặc coding agent)

1. Đọc `AGENTS.md` — đặc biệt mục 3 "Ràng buộc nghiệp vụ bắt buộc"
2. Đọc `docs/[VST][EOFFICE][ADVANCE] SRS.md` — tài liệu SRS nghiệp vụ gốc
3. Chạy `./init.sh` để xác nhận môi trường sạch
4. Đọc `feature_list.json`, chọn đúng 1 feature `not-started` để làm
5. Trước khi kết thúc phiên: cập nhật `progress.md` + `feature_list.json`, commit rõ ràng

## Phạm vi module (tóm tắt từ docs/)

5 sub-module trong Finance Engine: **Advance Request → Approval & Disbursement → Expense Verification → Settlement → Driver Balance**, gắn với luồng đóng chuyến 3 bên (Tài xế → Kế toán → Quản lý vận hành). Chi tiết đầy đủ xem `docs/[VST][EOFFICE][ADVANCE] SRS.md`.
