

# **Software Requirements Specification**

# **for**

# **\<E-Office \- Advances Module\>**

**Version 1.0 approved**

**Prepared by \<Leo\>**

**\<VinaSciTech\>**

**\<date created: July 7th, 2026\>**

**Table of Contents**

**[1\. Introduction	1](#introduction)**

[Purpose	1](#purpose)

[Document Conventions	1](#heading=)

[Intended Audience and Reading Suggestions	1](#heading=)

[Project Scope	1](#heading=)

[References	2](#heading=)

[**2\. Overall Description	2**](#heading=)

[Product Perspective	2](#product-perspective)

[Product Features	3](#heading=)

[User Classes and Characteristics	4](#heading=)

[Operating Environment	4](#heading=)

[Design and Implementation Constraints	5](#heading=)

[User Documentation	6](#heading=)

[Assumptions and Dependencies	6](#heading=)

[**3\. System Features	7**](#heading=)

[**3\. System Features	8**](#3.-system-features)

[SF-1 — Trip Management	8](#sf-1-—-trip-management)

[3.1.1 Mô tả và ưu tiên	8](#3.1.1-mô-tả-và-ưu-tiên)

[3.1.2 State Machine	8](#3.1.2-state-machine)

[3.1.3 Stimulus / Response Sequences	9](#3.1.3-stimulus-/-response-sequences)

[3.1.4 Functional Requirements	9](#3.1.4-functional-requirements)

[SF-2 — Advance Request	10](#sf-2-—-advance-request)

[3.2.1 Mô tả và ưu tiên	10](#3.2.1-mô-tả-và-ưu-tiên)

[3.2.2 State Machine	10](#3.2.2-state-machine)

[3.2.3 Stimulus / Response Sequences	11](#3.2.3-stimulus-/-response-sequences)

[3.2.4 Functional Requirements	11](#3.2.4-functional-requirements)

[SF-3 — Approval & Disbursement	12](#sf-3-—-approval-&-disbursement)

[3.3.1 Mô tả và ưu tiên	12](#3.3.1-mô-tả-và-ưu-tiên)

[3.3.2 State Machine	12](#3.3.2-state-machine)

[3.3.3 Stimulus / Response Sequences	12](#3.3.3-stimulus-/-response-sequences)

[3.3.4 Functional Requirements	13](#3.3.4-functional-requirements)

[SF-4 — Expense Capture	14](#sf-4-—-expense-capture)

[3.4.1 Mô tả và ưu tiên	14](#3.4.1-mô-tả-và-ưu-tiên)

[3.4.2 State Machine	14](#3.4.2-state-machine)

[3.4.3 Stimulus / Response Sequences	14](#3.4.3-stimulus-/-response-sequences)

[3.4.4 Functional Requirements	15](#3.4.4-functional-requirements)

[SF-5 — Expense Verification	15](#sf-5-—-expense-verification)

[3.5.1 Mô tả và ưu tiên	15](#3.5.1-mô-tả-và-ưu-tiên)

[3.5.2 State Machine	16](#3.5.2-state-machine)

[3.5.3 Stimulus / Response Sequences	16](#3.5.3-stimulus-/-response-sequences)

[3.5.4 Functional Requirements	17](#3.5.4-functional-requirements)

[SF-6 — Settlement Calculation	17](#sf-6-—-settlement-calculation)

[3.6.1 Mô tả và ưu tiên	17](#3.6.1-mô-tả-và-ưu-tiên)

[3.6.2 State Machine	18](#3.6.2-state-machine)

[3.6.3 Công thức tính	18](#3.6.3-công-thức-tính)

[3.6.4 Stimulus / Response Sequences	18](#3.6.4-stimulus-/-response-sequences)

[3.6.5 Functional Requirements	19](#3.6.5-functional-requirements)

[SF-7 — Driver Settlement Confirmation & Trip Closing	19](#sf-7-—-driver-settlement-confirmation-&-trip-closing)

[3.7.1 Mô tả và ưu tiên	19](#3.7.1-mô-tả-và-ưu-tiên)

[3.7.2 State Machine	20](#3.7.2-state-machine)

[3.7.3 Stimulus / Response Sequences	20](#3.7.3-stimulus-/-response-sequences)

[3.7.4 Functional Requirements	21](#3.7.4-functional-requirements)

[SF-8 — Driver Balance	21](#sf-8-—-driver-balance)

[3.8.1 Mô tả và ưu tiên	21](#3.8.1-mô-tả-và-ưu-tiên)

[3.8.2 State Machine	22](#3.8.2-state-machine)

[3.8.3 Stimulus / Response Sequences	22](#3.8.3-stimulus-/-response-sequences)

[3.8.4 Functional Requirements	22](#3.8.4-functional-requirements)

[SF-9 — Notification & SLA Alert	23](#sf-9-—-notification-&-sla-alert)

[3.9.1 Mô tả và ưu tiên	23](#3.9.1-mô-tả-và-ưu-tiên)

[3.9.2 State Machine	23](#3.9.2-state-machine)

[3.9.3 Danh sách trigger notification đầy đủ	23](#3.9.3-danh-sách-trigger-notification-đầy-đủ)

[3.9.4 Stimulus / Response Sequences	24](#3.9.4-stimulus-/-response-sequences)

[3.9.5 Functional Requirements	24](#3.9.5-functional-requirements)

[SF-10 — Dashboard, Reporting & Export	25](#sf-10-—-dashboard,-reporting-&-export)

[3.10.1 Mô tả và ưu tiên	25](#3.10.1-mô-tả-và-ưu-tiên)

[3.10.2 State Machine	25](#3.10.2-state-machine)

[3.10.3 Dashboard theo role	25](#3.10.3-dashboard-theo-role)

[3.10.4 Stimulus / Response Sequences	26](#3.10.4-stimulus-/-response-sequences)

[3.10.5 Functional Requirements	26](#3.10.5-functional-requirements)

[**4\. External Interface Requirements	27**](#external-interface-requirements)

[User Interfaces	27](#user-interfaces)

[Hardware Interfaces	27](#heading=)

[Software Interfaces	28](#heading=)

[Communications Interfaces	28](#heading=)

[**5\. Other Nonfunctional Requirements	28**](#heading=)

[Performance Requirements	28](#performance-requirements)

[Safety Requirements	28](#heading=)

[Security Requirements	28](#heading=)

[Software Quality Attributes	29](#heading=)

[**6\. Other Requirements	29**](#heading=)

**Revision History**

| Name | Date | Reason For Changes | Version |
| :---- | :---- | :---- | :---- |
|  |  |  |  |
|  |  |  |  |

1. # **Introduction** {#introduction}

## **Purpose**  {#purpose}

Đây là một MVP hoàn thiện Module Hoàn ứng & Tạm ứng nằm trong Sản phẩm E-Office dành cho ngành logistics của VinaScitech. Mục đích chính của Module Hoàn ứng & Tạm ứng là theo dõi quy trình Hoàn ứng & Tạm ứng giữa 4 vai trò chính: Giám đốc, Quản lý vận hành, Kế toán, Tài xế.

Module này sẽ bao gồm 4 màn hình chính của Giám đốc, Quản lý vận hành, Kế toán, Tài xế.   
Module này sẽ bao gồm 5 sub-module, bao gồm: Trip, Advances, Expenses, Settlements, Platform. 

*\<Identify the product whose software requirements are specified in this document, including the revision or release number. Describe the scope of the product that is covered by this SRS, particularly if this SRS describes only part of the system or a single subsystem.\>*

## **Document Conventions**

- Cách gọi 4 Role chính ngắn gọn: Quản lý Vận hành (OM); Tài xế (DRV); Giám đốc; Kế toán (ACC)  
- Toàn bộ các trạng thái của các Flow của dự án sẽ để Tiếng Anh  
- Mã màn hình dùng format S-\[Role\]-\[Number\]: Ví dụ S-OM-1 cho màn hình 1 của quản lý vận hành  
- Mã của các Tính năng hệ thống (System Features) là SF-X (X là số thứ tự của tính năng)  
- Mã yêu cầu dùng format \[Role\]-REQ-\[Number\], ví dụ DRV-REQ-004

*\<Describe any standards or typographical conventions that were followed when writing this SRS, such as fonts or highlighting that have special significance. For example, state whether priorities  for higher-level requirements are assumed to be inherited by detailed requirements, or whether every requirement statement is to have its own priority.\>*

## **Intended Audience and Reading Suggestions**

Đây là tài liệu dành cho team Dev và Design. 

*\<Describe the different types of reader that the document is intended for, such as developers, project managers, marketing staff, users, testers, and documentation writers. Describe what the rest of this SRS contains and how it is organized. Suggest a sequence for reading the document, beginning with the overview sections and proceeding through the sections that are most pertinent to each reader type.\>*

## **Project Scope**

Phạm vi của MVP Module Hoàn ứng tạm ứng:

- Chỉ duy trì 4 Role duy nhất: Quản lý Vận hành, Tài xế, Kế toán, Giám đốc. Trong dự án tiếp theo khi cần hoàn thiện toàn bộ Module Hoàn ứng tạm ứng, ta có thể sẽ phải thêm các vị trí khác như kiểm soát nội bộ; chia nhỏ Role Kế toán thành Kế toán thanh toán và Kế toán đối soát; Trưởng đội Tài xế, Giám sát Vận hành, vv  
- Các trang chính của Màn hình của Tài xế:  
- Các trang chính của Màn hình của Kế toán  
- Các trang chính của Màn hình của Quản lý Vận hành  
- Các trang chính của Màn hình của Giám đốc  
- MVP này chỉ bao gồm 5 sub-module chính: Trip, Advance, Expense, Settlement, Platform


*\<Provide a short description of the software being specified and its purpose, including relevant benefits, objectives, and goals. Relate the software to corporate goals or business strategies. If a separate vision and scope document is available, refer to it rather than duplicating its contents here. An SRS that specifies the next release of an evolving product should contain its own scope statement as a subset of the long-term strategic product vision.\>*

## **References**

*\<List any other documents or Web addresses to which this SRS refers. These may include user interface style guides, contracts, standards, system requirements specifications, use case documents, or a vision and scope document. Provide enough information so that the reader could access a copy of each reference, including title, author, version number, date, and source or location.\>*

2. # **Overall Description**

## **Product Perspective** {#product-perspective}

Sản phẩm MVP version 4 Role này sau này sẽ phát triển lên thành đầy đủ các Role (Làm Multi-level permission và RBAC(Bản 9 Role)) hoặc tinh chỉnh dựa trên nhu cầu riêng của các Khách hàng. Module này sẽ nằm trong Financial Accounting \+ Management Accounting của Diagram tổng thể của E-Office (Tham khảo Figure 9-1: Sách Integrated ERP).

\<Miêu tả đối với Giám đốc và Kế toán\>: 

1) Tạm ứng / Advance

→ Financial Accounting: tiền ra, quỹ/ngân hàng, khoản phải thu nội bộ từ tài xế/nhân viên  
→ Management Accounting: khoản ứng này dự kiến phục vụ trip nào, route nào, xe nào, khách hàng nào

2) Chi phí / Expenses

→ Financial Accounting: ghi nhận chi phí, chứng từ, hóa đơn, tiền mặt/ngân hàng  
→ Management Accounting: phân bổ chi phí vào trip, xe, route, cost center, customer, shipment

3) Hoàn ứng / Settlement

→ Financial Accounting: clear khoản tạm ứng, thu lại tiền dư hoặc chi bổ sung  
→ Management Accounting: khóa chi phí thực tế để tính hiệu quả chuyến, tài xế, xe, tuyến, khách hàng 

\<Miêu tả đối với Team phát triển hệ thống \- VinaSciTech\>: 

## **Product Features**

|  Sub-module |  Chức năng chính  |  Người dùng chính |  Ưu tiên MVP |
| ----- | ----- | ----- | ----- |
| SF-1 Trip Management | Quản lý vòng đời chuyến xe (draft → closed); tạo chuyến 1 trang gộp; gán tài xế/xe; theo dõi trạng thái realtime. Entity gốc mà mọi giao dịch tài chính phải gắn vào | QLVH, Tài xế | HIGH |
| SF-2 Advance Request | Tạo yêu cầu tạm ứng gắn chuyến — 2 loại có label phân biệt: Tạm ứng chuyến (trước khi chạy) và Tạm ứng phát sinh (trong khi chạy). Không có tạm ứng tự do | QLVH (tạo), Tài xế (yêu cầu phát sinh) | HIGH |
| SF-3 Approval & Disbursement | Phê duyệt theo ngưỡng: ≤ 1.3× standard → Kế toán duyệt; vượt ngưỡng → Giám đốc duyệt. Kế toán ghi nhận giải ngân thực tế sau khi approved | Kế toán, Giám đốc | HIGH |
| SF-4 Expense Capture | Tài xế ghi chi phí phát sinh kèm ảnh chứng từ, GPS, timestamp. Offline-first — ghi local khi mất mạng, tự sync khi có kết nối | Tài xế | HIGH |
| SF-5 Expense Verification | Kế toán đối soát từng khoản chi: verified / need-info / rejected. Chỉ khoản verified mới tính vào Settlement. Quyền độc quyền của Finance Engine | Kế toán | HIGH |
| SF-6 Settlement Calculation | Tính quyết toán chuyến: `Variance = Total Advance − Total Verified Expense`. Trả về REFUND / ADDITIONAL / BALANCED. Kế toán confirm để chính thức hoá | Kế toán | HIGH |
| SF-7 Driver Confirmation & Trip Closing | Luồng đóng chuyến 3 bên bắt buộc theo thứ tự: Tài xế OK quyết toán → QLVH Close chuyến. GPS bắt buộc khi End. QLVH không thể close nếu tài xế chưa xác nhận | Tài xế (xác nhận), QLVH (đóng) | HIGH |
| SF-8 Driver Balance | Tự động ghi công nợ tài xế vào sổ ledger sau khi Settlement confirmed. Kế toán dùng để cấn trừ lương hoặc thanh toán bù kỳ sau | Kế toán, Giám đốc | HIGH |
| SF-9 Notification & SLA Alert | Gửi đúng thông báo đến đúng người tại đúng thời điểm trong toàn bộ vòng đời chuyến. Tự động tạo SLA Alert khi chuyến treo ở await quá 72h | Tất cả 4 role (nhận) | HIGH |
| SF-10 Dashboard, Reporting & Export | Visibility tổng thể theo role: QLVH theo dõi chuyến, Kế toán xem hàng đợi đối soát và công nợ, Giám đốc xem KPI và tổng tạm ứng đang treo. Export CSV/PDF cho MISA/Fast | QLVH, Kế toán, Giám đốc | MED |

## **User Classes and Characteristics**

| Vai trò | Mô tả | Quyền trong Module này |
| ----- | ----- | ----- |
| Quản lý Vận hành | Điều phối chuyến, thường xuyên kiểm tra app | \- Tạo chuyến, Theo dõi toàn bộ chuyến, Kết thúc chuyến \- Tạo tạm ứng đầu chuyến \- Tạo tạm ứng phát sinh (?) |
| Kế toán | Kiểm soát tài chính, Xuất báo cáo, Kiểm tra chứng từ\` | \- Kiểm tra, Từ chối chứng từ \- Duyệt Tạm ứng đầu chuyến \- Duyệt Tạm ứng phát sinh |
| Giám đốc | Giám sát Dashboard, Phê duyệt các luồng đặc biệt | \- Duyệt Tạm ứng vượt ngưỡng) \- Reopen chuyến đã closed để can thiệp vào việc thay đổi một số tác vụ đặc biệt \- Đối soát và Điều tra rò rỉ chi phí |
| Tài xế | Hiện trường, sử dụng App Mobile để cập nhật các thông tin cần thiết cho chuyến xe | \- Đồng ý/Từ chối chuyến xe \- Ghi chi phí và Chụp Bill \- Yêu cầu Tạm ứng Phát sinh \- Thực hiện bước kết thúc chuyến và duyệt Quyết toán |

## **Operating Environment**

*\<Describe the environment in which the software will operate, including the hardware platform, operating system and versions, and any other software components or applications with which it must peacefully coexist.\>*

- Front End:  
- Back End:  
- Database:  
- App Tài xế:  
- App Quản lý Vận hành & Kế toán:  
- App Giám đốc:  
- GPS:

## **Design and Implementation Constraints**

*\<Describe any items or issues that will limit the options available to the developers. These might include: corporate or regulatory policies; hardware limitations (timing requirements, memory requirements); interfaces to other applications; specific technologies, tools, and databases to be used; parallel operations; language requirements; communications protocols; security considerations; design conventions or programming standards (for example, if the customer’s organization will be responsible for maintaining the delivered software).\>*

| Loại ràng buộc | Mô tả |
| ----- | ----- |
| Trip Status | \- Draft: Khi Quản lý Vận hành tạo một đơn Tạo chuyến mới \- Pending\_Driver: Trong khi chờ Tài xế xác nhận/từ chối chuyến mới \- Ready: Khi tài xế xác nhận chuyến mới và đang đợi giải ngân  \- In\_Progress: Khi xe đang chạy \- End: Khi tài xế kết thúc chuyến và bắt đầu quá trình đóng chuyến của ba bên (Lệnh chuyển về cho Kế toán để kiểm định chi phí, giấy tờ, sau đó tiến hành hoàn ứng theo quy định giữa kế toán và tài xế, tài xế xác nhận tiến đã nhân/chuyển từ/cho kế toán. Sau đó Quản lý Vận hành End chuyến \- Closed: Quản lý vận hành đóng chuyến \- Còn luồng ngoại lệ với lúc Giám đốc mở lại thì status là gì? |
| AdvanceRequest Status |  |
| Expense Status |  |
| Settlement Status |  |
| Trip-centric | Mọi AdvanceRequest và Settlement phải gắn trip\_id hợp lệ, status ≥ ready |
|  |  |
| Ràng buộc của Hệ thống Tài chính Doanh nghiệp | Chỉ Kế toán mới có quyền verified/rejected/need-info expense (Sẽ làm việc lại sau khi có đầy đủ các Status trên thì mới có thể đưa ra quyệt định các quyền verified/… của Kế toán hay Giám đốc khi nào được diễn ra |
| Không hard-delete | Dữ liệu tài chính chỉ được void/reverse/cancel/adjust theo đúng quyền. Ở đây lấy ví dụ các Status của Settlement |
| Audit trail bắt buộc | Mọi thay đổi status tài chính phải có AuditLog (who, when, what) |
| Ngưỡng duyệt | AdvReq ≤ standard\_advance × 1.3 → Kế toán; \> 1.3 → Giám đốc |
| GPS bắt buộc khi End | Tài xế không thể End chuyến nếu GPS tắt — hệ thống từ chối action |
| 3-party closing | QLVH chỉ Close được sau khi tài xế OK (status từ End → Closed) |

## **User Documentation**

*\<List the user documentation components (such as user manuals, on-line help, and tutorials) that will be delivered along with the software. Identify any known user documentation delivery formats or standards.\>*

## **Assumptions and Dependencies**

1.  **Assumptions (Giả định)** — điều chưa được xác nhận chắc chắn nhưng đang được coi là đúng khi viết SRS này. Nếu giả định sai → yêu cầu phải viết lại. 

| \# | Giả định | Rủi ro nếu sai |
| ----- | ----- | ----- |
| A1 | Trip lifecycle (draft → closed) đã được xây dựng và hoạt động ổn định trong Logistics Engine trước khi module này được triển khai | Finance Engine không có entity gốc để gắn vào — toàn bộ module bị block |
| A2 | Mỗi route đã có `standard_advance_amount` được cấu hình sẵn trong hệ thống | Form tạo chuyến không tự điền được dự toán; ngưỡng 1.3× không tính được |
| A3 | Ngưỡng phê duyệt là `standard_advance × 1.3` — áp dụng đồng nhất toàn hệ thống, không phân biệt theo route hay khách hàng | Nếu doanh nghiệp muốn ngưỡng khác nhau theo tuyến → cần thêm config layer, scope thay đổi |
| A4 | Thiết bị của tài xế hỗ trợ GPS và tài xế đồng ý cấp quyền location cho app | Không thể thực thi R9 — End chuyến bị block hoàn toàn; cần design fallback |
| A5 | Tài xế có smartphone với kết nối mạng đủ để sync dữ liệu trong ngày, dù không liên tục | Nếu tài xế chạy tuyến xa, mất mạng nhiều ngày → local queue tích lũy lớn, cần kiểm tra giới hạn |
| A6 | Mỗi doanh nghiệp khách hàng B2B đã có phân công rõ role: ai là Kế toán, ai là Giám đốc phê duyệt | Nếu doanh nghiệp nhỏ 1 người kiêm nhiều role → cần xem lại logic routing phê duyệt |
| A7 | Dữ liệu tài chính trong module này không cần tích hợp real-time với phần mềm kế toán (MISA/Fast) ở giai đoạn MVP — export định kỳ là đủ | Nếu khách hàng yêu cầu sync real-time ngay từ đầu → tăng scope đáng kể |

   2. **Dependencies (Phụ thuộc)** — những thành phần bên ngoài mà module này *cần có sẵn* để hoạt động đúng. 

| \# | Phụ thuộc vào | Loại | Mức độ | Ghi chú |
| ----- | ----- | ----- | ----- | ----- |
| D1 | **Logistics Engine — Trip & Route** | Internal module | Bắt buộc | AdvanceRequest không thể tạo nếu không có trip\_id và route.standard\_advance\_amount |
| D2 | **Authentication & Authorization system** | Internal | Bắt buộc | Toàn bộ phân quyền 4 role dựa trên auth layer; Finance Engine không tự quản lý identity |
| D3 | **Push Notification infrastructure** | Internal service | Bắt buộc | Các trigger notification trong module này đều phụ thuộc vào service này; nếu trễ \>30s trải nghiệm người dùng bị ảnh hưởng nghiêm trọng. (Hiện tại chưa làm rõ Plan Notification của App) |
| D4 | **GPS API (thiết bị tài xế)** | Device hardware | Bắt buộc | End chuyến không thể hoàn thành nếu GPS không trả về tọa độ hợp lệ |
| D5 | **AuditLog service** | Internal | Bắt buộc | Mọi thay đổi status tài chính đều ghi vào đây; nếu service này fail → transaction phải rollback (Chưa thấy Team nói gì về vụ Roll Back) |
| D6 | **VETC / ePass** | External API hoặc CSV | Optional | Auto-map phí BOT vào ExpenseItem; MVP có thể nhập tay (Để sau làm) |
| D7 | **Bank API** | External | Optional / Post-MVP | Ghi nhận chuyển khoản giải ngân; MVP chấp nhận ghi tay |
| D8 | **MISA / Fast Accounting** | External | Post-MVP | Export bút toán; MVP dùng CSV export thủ công |

3. # **System Features**

Phần này khá dài — tôi sẽ viết đầy đủ cả 10 feature, mỗi feature đủ 4 mục theo template.

---

# **3\. System Features** {#3.-system-features}

---

## **SF-1 — Trip Management**  {#sf-1-—-trip-management}

### **3.1.1 Mô tả và ưu tiên** {#3.1.1-mô-tả-và-ưu-tiên}

Trip là entity trung tâm của toàn hệ thống. Mọi giao dịch tài chính — tạm ứng, chi phí, quyết toán — đều phải gắn với một trip\_id hợp lệ. SF-1 quản lý toàn bộ vòng đời chuyến xe từ khi QLVH tạo đến khi đóng hoàn toàn, bao gồm phân công tài xế/xe và theo dõi trạng thái realtime.

**Ưu tiên: HIGH**

### **3.1.2 State Machine** {#3.1.2-state-machine}

draft → pendingdriver → ready → progress → end → closed  
                ↓                           ↓  
           declined               canceled

| Transition | Trigger | Actor |
| ----- | ----- | ----- |
| `draft` → `pendingdriver` | QLVH tạo chuyến cho tài xế | QLVH |
| `pendingdriver` → `ready` | Tài xế accept chuyến | Tài xế |
| `pendingdriver` → `declined` | Tài xế từ chối \+ lý do bắt buộc | Tài xế |
| `ready` → `progress` | Tài xế bấm Bắt đầu chạy | Tài xế |
| `progress` → `canceled` | QLVH hủy chuyến đang chạy | QLVH |
| `progress` → `end` | Tài xế End chuyến \+ GPS bắt buộc | Tài xế |
| `end` → `closed` | QLVH Close chuyến sau khi hoàn tất quyết toán | QLVH |

**Lưu ý:** Toàn bộ luồng tài chính sau khi tài xế End — bao gồm Expense Verification (SF-5), Settlement Calculation (SF-6), và Driver Confirmation (SF-7) — diễn ra khi Trip đang ở status `end`. Trip chỉ chuyển sang `closed` sau khi tất cả các bước tài chính hoàn tất.

### **3.1.3 Stimulus / Response Sequences** {#3.1.3-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| QLVH điền form tạo chuyến (tuyến, ngày đi/về, hàng hoá, tài xế, xe, dự toán) | Trip tạo ở status `draft`; standard\_advance\_amount tự điền từ route |
| QLVH nhập amount vượt standard × 1.3 | Badge cảnh báo "Cần Giám đốc duyệt" hiện ngay trên form trước khi submit |
| QLVH submit chuyến cho tài xế | Trip: `draft` → `pendingdriver`; push notification đến tài xế; AdvanceRequest tự động tạo và submit song song |
| Tài xế accept chuyến | Trip: `pendingdriver` → `ready`; QLVH nhận thông báo xác nhận |
| Tài xế từ chối \+ nhập lý do | Trip: `pendingdriver` → `declined`; QLVH nhận thông báo kèm lý do |
| QLVH tạo chuyến mới | Trip: khởi tạo một chuyến mới ở trạng thái `draft` |
| Tài xế bấm Bắt đầu chạy | Trip: `ready` → `progress` |
| QLVH hủy chuyến đang chạy | Trip: `progress` → `canceled`; trigger Reversal flow (chưa có) nếu đã có Disbursement (thanh toán cho Tài xế) |
| Tài xế bấm End chuyến | Hệ thống lấy GPS ngay lập tức; hiện "Đã lưu vị trí: \[địa chỉ\] ✓"; Trip: `progress` → `end` |
| GPS tắt khi Tài xế bấm End | Hệ thống block action; hiện cảnh báo yêu cầu bật GPS; không cho End |
| Kế toán, Tài xế hoàn tất luồng quyết toán (SF-5, SF-6, SF-7) | Trip vẫn ở `end` trong suốt quá trình; QLVH nhận thông báo khi đủ điều kiện close |
| QLVH bấm Close chuyến | Trip: `end` → `closed`; toàn bộ record tài chính bị lock |

### **3.1.4 Functional Requirements** {#3.1.4-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-TM-001 | Form tạo chuyến là 1 trang duy nhất, gộp: tuyến (dropdown \+ nút Tạo quãng đường mới), ngày đi/về, thông tin hàng hoá (1 text field), chọn tài xế/xe, dự toán chi phí | HIGH |
| REQ-TM-002 | Dự toán chi phí tự điền từ route.standard\_advance\_amount; cho phép override thủ công | HIGH |
| REQ-TM-003 | Nếu dự toán \> standard\_advance × 1.3 → hiện badge cảnh báo "Cần Giám đốc duyệt" ngay trên form, trước khi submit | HIGH |
| REQ-TM-004 | Khi QLVH submit chuyến, AdvanceRequest được tự động tạo và đẩy vào luồng duyệt song song SF-2 | HIGH |
| REQ-TM-005 | Tài xế bắt buộc nhập lý do khi từ chối chuyến; không cho submit nếu để trống | HIGH |
| REQ-TM-006 | End chuyến bắt buộc GPS — hệ thống lấy tọa độ ngay lập tức và hiện "Đã lưu vị trí: \[địa chỉ\] ✓"; block action nếu GPS tắt | HIGH |
| REQ-TM-007 | Trip ở status `end` là trạng thái chờ hoàn tất tài chính — Expense Verification, Settlement, và Driver Confirmation đều diễn ra tại đây | HIGH |
| REQ-TM-008 | Nút Close chuyến ở App QLVH chỉ enabled sau khi toàn bộ luồng SF-5, SF-6, SF-7 hoàn tất; disabled nếu còn bước tài chính chưa xong | HIGH |
| REQ-TM-009 | Trip bị `canceled` sau khi Advance Request đã `disbursed` → bắt buộc trigger Reversal flow; không thể cancel mà không xử lý tạm ứng đang treo | HIGH |
| REQ-TM-010 | Mọi transition status của Trip phải ghi AuditLog (user\_id, timestamp, old\_status, new\_status, gps nếu có) | HIGH |
| REQ-TM-011 | QLVH xem được timeline trạng thái chuyến realtime trên Dispatch Dashboard | HIGH |

## **SF-2 — Advance Request** {#sf-2-—-advance-request}

### **3.2.1 Mô tả và ưu tiên** {#3.2.1-mô-tả-và-ưu-tiên}

Quản lý yêu cầu tạm ứng gắn với chuyến. Có 2 loại với label UI phân biệt bắt buộc: **Tạm ứng chuyến** (tạo trước khi chạy, do QLVH tạo) và **Tạm ứng phát sinh** (tạo trong khi chạy, do tài xế yêu cầu). Cả 2 loại đều tính vào Total Advance khi Settlement.

**Ưu tiên: HIGH**

### **3.2.2 State Machine** {#3.2.2-state-machine}

draft → pending → approved → disbursed  
               ↘ rejected  
     approved → canceled  (chỉ trước khi disbursed)  
     disbursed → \[Reversal required\]

| Transition | Trigger | Actor |
| ----- | ----- | ----- |
| draft → pending | QLVH / Tài xế submit request | QLVH hoặc Tài xế |
| pending → approved | Kế toán hoặc Giám đốc approve | Kế toán / Giám đốc |
| pending → rejected | Kế toán hoặc Giám đốc reject | Kế toán / Giám đốc |
| approved → disbursed | Kế toán ghi Disbursement | Kế toán |
| approved → canceled | QLVH cancel trước khi giải ngân | QLVH |
| disbursed → \[reversal\] | Chuyến bị hủy sau khi đã giải ngân | Hệ thống / Kế toán |

### **3.2.3 Stimulus / Response Sequences** {#3.2.3-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| QLVH tạo chuyến với dự toán | AdvanceRequest tự động tạo, type \= "Tạm ứng chuyến", status \= `draft` |
| QLVH submit chuyến | AdvanceRequest: `draft` → `pending`; routing đến Kế toán hoặc Giám đốc theo ngưỡng |
| Tài xế yêu cầu tạm ứng phát sinh (khi trip \= `progress`) | AdvanceRequest mới tạo, type \= "Tạm ứng phát sinh", status \= `draft` → `pending` |
| AdvanceRequest bị rejected | Thông báo QLVH kèm lý do; QLVH có thể tạo request mới |
| QLVH cancel AdvanceRequest đã approved (trước khi disburse) | AdvanceRequest: `approved` → `canceled`; AuditLog ghi nhận |
| Chuyến bị hủy sau khi AdvanceRequest đã `disbursed` | Hệ thống trigger Reversal flow; không cho hủy chuyến nếu chưa xử lý |

### **3.2.4 Functional Requirements** {#3.2.4-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-ADV-001 | Mọi AdvanceRequest phải có trip\_id hợp lệ; không cho phép tạo tạm ứng không gắn chuyến | HIGH |
| REQ-ADV-002 | Tạm ứng chuyến chỉ tạo được khi trip status ≥ `ready`; Tạm ứng phát sinh chỉ tạo được khi trip status \= `progress` | HIGH |
| REQ-ADV-003 | Label "Tạm ứng chuyến" và "Tạm ứng phát sinh" hiển thị xuyên suốt trong App Tài xế, App Kế toán, và màn hình Settlement | HIGH |
| REQ-ADV-004 | AdvanceRequest đã `approved` không được sửa trực tiếp — phải cancel và tạo mới | HIGH |
| REQ-ADV-005 | Cả 2 loại tạm ứng đều được tính vào Total Advance trong công thức Settlement | HIGH |
| REQ-ADV-006 | Mọi thay đổi status phải ghi AuditLog (user\_id, timestamp, old\_status, new\_status, reason nếu rejected/canceled) | HIGH |
| REQ-ADV-007 | Khi chuyến bị hủy sau khi đã `disbursed` → bắt buộc trigger Reversal flow trước khi cho phép hủy chuyến | HIGH |

---

## **SF-3 — Approval & Disbursement** {#sf-3-—-approval-&-disbursement}

### **3.3.1 Mô tả và ưu tiên** {#3.3.1-mô-tả-và-ưu-tiên}

Kiểm soát luồng phê duyệt 2 nhánh dựa trên ngưỡng và ghi nhận tiền thực chi. Đây là điểm phân tách trách nhiệm giữa Kế toán và Giám đốc. Chỉ sau khi Kế toán ghi Disbursement, tài xế mới thực sự nhận được tiền.

**Ưu tiên: HIGH**

### **3.3.2 State Machine** {#3.3.2-state-machine}

SF-3 sử dụng tiếp state machine của AdvanceRequest (SF-2). Không có entity state machine riêng. Disbursement là record độc lập được tạo ra tại bước `approved` → `disbursed`.

AdvanceRequest: approved → disbursed  
                    ↓ (trigger tạo)  
             Disbursement record  
                    ↓  
             CashMovement record

### **3.3.3 Stimulus / Response Sequences** {#3.3.3-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| AdvanceRequest pending đến Kế toán (ngưỡng thường) | App Kế toán hiện request trong queue phê duyệt |
| AdvanceRequest pending đến Giám đốc (vượt ngưỡng) | App Giám đốc hiện push notification và request trong danh sách chờ duyệt |
| Kế toán approve | AdvanceRequest: `pending` → `approved`; Kế toán thấy nút Ghi Disbursement |
| Kế toán ghi Disbursement (ngày chi, số tiền, phương thức) | AdvanceRequest: `approved` → `disbursed`; Disbursement record tạo; CashMovement ghi nhận; push notification tài xế |
| Giám đốc approve (vượt ngưỡng) | AdvanceRequest: `pending` → `approved`; push notification Kế toán để tiến hành giải ngân |
| Kế toán reject \+ lý do | AdvanceRequest: `pending` → `rejected`; push notification QLVH kèm lý do |
| Giám đốc reject \+ lý do bắt buộc | AdvanceRequest: `pending` → `rejected`; push notification QLVH kèm lý do của GĐ |

### **3.3.4 Functional Requirements** {#3.3.4-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-APR-001 | Hệ thống tự động routing: amount ≤ standard\_advance × 1.3 → Kế toán; amount \> 1.3× → Giám đốc; không cần QLVH chọn thủ công | HIGH |
| REQ-APR-002 | Kế toán và Giám đốc bắt buộc nhập lý do khi Reject; không cho submit nếu để trống | HIGH |
| REQ-APR-003 | Chỉ Kế toán mới có quyền ghi Disbursement sau khi AdvanceRequest đã `approved` — Giám đốc không ghi trực tiếp | HIGH |
| REQ-APR-004 | Disbursement record phải ghi đủ: ngày chi thực tế, số tiền, phương thức (tiền mặt / chuyển khoản), người chi (user\_id) | HIGH |
| REQ-APR-005 | Tài xế nhận push notification "Đã giải ngân \[X đồng\] — \[Tạm ứng chuyến / Tạm ứng phát sinh\]" ngay sau khi Disbursement được ghi | HIGH |
| REQ-APR-006 | CashMovement record được tạo tự động cho mỗi Disbursement, phục vụ kế toán tổng hợp | HIGH |
| REQ-APR-007 | Giám đốc xem được toàn bộ lịch sử approve/reject của mình theo chuyến | MED |
| REQ-APR-008 | \[Post-MVP\] Kế toán import VETC/ePass CSV → auto-map phí BOT vào ExpenseItem tương ứng với chuyến | LOW |

## **SF-4 — Expense Capture** {#sf-4-—-expense-capture}

### **3.4.1 Mô tả và ưu tiên** {#3.4.1-mô-tả-và-ưu-tiên}

Tài xế ghi nhận chi phí phát sinh trong chuyến tại hiện trường. App hoạt động offline-first — tài xế có thể ghi khi mất mạng, dữ liệu tự sync khi có kết nối. SF-4 chỉ là điểm đầu vào dữ liệu; việc xác nhận tính hợp lệ thuộc hoàn toàn về SF-5.

**Ưu tiên: HIGH**

### **3.4.2 State Machine** {#3.4.2-state-machine}

\[local\_draft\] → submitted → \[chuyển sang SF-5 xử lý\]  
     ↑  
(offline, chưa sync)

Offline sync logic:  
  Tài xế tạo expense offline  
    → app tạo local\_uuid  
    → lưu: amount, type, receipt, timestamp, GPS  
    → sync\_status \= Pending  
    → khi có mạng: gửi lên server \+ kiểm tra idempotency\_key  
    → sync\_status \= Synced

---

### **3.4.3 Stimulus / Response Sequences** {#3.4.3-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| Tài xế chọn loại chi phí và nhập số tiền (khi có mạng) | ExpenseItem tạo trực tiếp trên server, status \= `submitted` |
| Tài xế ghi chi phí khi mất mạng | ExpenseItem lưu local với local\_uuid và sync\_status \= Pending; app hiện badge "Chờ đồng bộ" |
| Mạng kết nối lại | App tự động sync toàn bộ expense pending; kiểm tra idempotency\_key để tránh ghi trùng; sync\_status → Synced |
| Tài xế chụp ảnh bill | Ảnh gắn vào ExpenseItem kèm timestamp và GPS tại thời điểm chụp |
| Tài xế submit expense không có ảnh bill | Hệ thống tự động tạo flag "Missing Receipt Exception"; Kế toán thấy cảnh báo khi verify |
| Tài xế yêu cầu tạm ứng phát sinh từ màn hình ghi chi phí | Chuyển sang SF-2 tạo AdvanceRequest mới type \= Tạm ứng phát sinh |

---

### **3.4.4 Functional Requirements** {#3.4.4-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-EXP-001 | App Tài xế hoạt động offline-first: ghi expense local khi mất mạng, tự sync khi có kết nối; dữ liệu không bị mất khi tắt app | HIGH |
| REQ-EXP-002 | Mỗi ExpenseItem phải có idempotency\_key (dựa trên local\_uuid) để server chống ghi trùng khi sync nhiều lần | HIGH |
| REQ-EXP-003 | Các loại chi phí hỗ trợ: Xăng dầu, BOT/Phí cầu đường, Ăn uống, Bốc xếp, Sửa chữa/phát sinh, Khác | HIGH |
| REQ-EXP-004 | Mỗi ExpenseItem ghi kèm: loại chi, số tiền, timestamp, GPS (nếu có), ảnh chứng từ (nếu có), trip\_id | HIGH |
| REQ-EXP-005 | Expense không có ảnh chứng từ → hệ thống tự động tạo flag "Missing Receipt Exception"; hiện cảnh báo cho Kế toán khi verify | HIGH |
| REQ-EXP-006 | App hiện badge đếm số expense đang chờ sync (sync\_status \= Pending) để tài xế biết dữ liệu chưa lên server | MED |
| REQ-EXP-007 | Tài xế chỉ tạo và nộp ExpenseItem — không có quyền tự verified hoặc thay đổi status sau khi submitted | HIGH |

---

## **SF-5 — Expense Verification** {#sf-5-—-expense-verification}

### **3.5.1 Mô tả và ưu tiên** {#3.5.1-mô-tả-và-ưu-tiên}

Kế toán xác minh từng khoản chi do tài xế nộp. Đây là bước bắt buộc trước khi tính Settlement — chỉ khoản đã `verified` mới được tính vào Total Valid Expense. SF-5 là quyền độc quyền của Finance Engine: không role nào khác được phép thay đổi status ExpenseItem.

**Ưu tiên: HIGH**

---

### **3.5.2 State Machine** {#3.5.2-state-machine}

submitted → verified → \[tính vào Settlement\]  
          ↘ need-info → resubmitted → verified  
                                    ↘ rejected  
          ↘ rejected

| Transition | Trigger | Actor |
| ----- | ----- | ----- |
| submitted → verified | Kế toán xác nhận hợp lệ | Kế toán |
| submitted → need-info | Kế toán yêu cầu bổ sung \+ lý do bắt buộc | Kế toán |
| submitted → rejected | Kế toán từ chối \+ lý do bắt buộc | Kế toán |
| need-info → resubmitted | Tài xế bổ sung thông tin và gửi lại | Tài xế |
| resubmitted → verified | Kế toán xác nhận lần 2 | Kế toán |
| resubmitted → rejected | Kế toán từ chối sau khi xem xét lại | Kế toán |

---

### **3.5.3 Stimulus / Response Sequences** {#3.5.3-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| Trip chuyển sang `await` (tài xế End) | Hệ thống tạo notification cho Kế toán: "Chuyến X cần đối soát"; đẩy vào Expense Verification Queue |
| Kế toán mở màn hình Verification Queue | Danh sách expense cần xác minh, sắp xếp theo trip; hiện flag Missing Receipt nếu có |
| Kế toán mark Verified | ExpenseItem → `verified`; tính vào Settlement khi Kế toán calculate |
| Kế toán mark Need Info \+ nhập lý do | ExpenseItem → `need-info`; push notification tài xế kèm lý do cụ thể |
| Tài xế bổ sung ảnh/thông tin và gửi lại | ExpenseItem → `resubmitted`; Kế toán thấy trong queue lần 2 |
| Kế toán mark Rejected \+ nhập lý do | ExpenseItem → `rejected`; không tính vào Settlement; push notification tài xế |
| Tất cả expense đã ở trạng thái cuối | Hệ thống unlock nút "Tính Settlement" cho Kế toán |
| Còn expense chưa resolved (need-info chưa resubmit) | Nút Tính Settlement bị disabled; hiện số expense còn đang chờ |

---

### **3.5.4 Functional Requirements** {#3.5.4-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-VER-001 | Chỉ Kế toán (Finance Engine) có quyền verified / need-info / rejected; QLVH và Tài xế không có quyền thay đổi status ExpenseItem | HIGH |
| REQ-VER-002 | Kế toán bắt buộc nhập lý do khi mark Need Info hoặc Rejected; không cho submit nếu để trống | HIGH |
| REQ-VER-003 | Settlement chỉ unlock sau khi tất cả expense đã ở trạng thái cuối (verified / rejected); không còn expense nào ở need-info chưa resubmit | HIGH |
| REQ-VER-004 | Tài xế nhận push notification ngay khi expense bị need-info kèm lý do rõ ràng và link vào expense cụ thể | HIGH |
| REQ-VER-005 | Kế toán có màn hình Expense Verification Queue: danh sách trip đang `await`, lọc theo ngày/tài xế/tuyến; flag rõ expense có Missing Receipt | HIGH |
| REQ-VER-006 | Kế toán xem được ảnh chứng từ, GPS, timestamp gốc của từng ExpenseItem ngay trong màn hình verify | HIGH |
| REQ-VER-007 | Expense bị rejected vẫn hiển thị trong Settlement summary với nhãn "Không được tính" để tài xế hiểu rõ lý do chênh lệch | HIGH |

---

## **SF-6 — Settlement Calculation** {#sf-6-—-settlement-calculation}

### **3.6.1 Mô tả và ưu tiên** {#3.6.1-mô-tả-và-ưu-tiên}

Kế toán tính quyết toán chuyến sau khi tất cả expense đã được xử lý. Kết quả Settlement là căn cứ chính thức để xác định tài xế còn nợ hay được nhận thêm tiền. Sau khi Confirm, Settlement bị lock và không thể sửa nếu không có Giám đốc Reopen.

**Ưu tiên: HIGH**

---

### **3.6.2 State Machine** {#3.6.2-state-machine}

draft → await (reviewing) → settled (confirmed) → closed  
                          ↘ \[cần điều chỉnh\] → await  
closed → reopened  (chỉ Giám đốc)

| Transition | Trigger | Actor |
| ----- | ----- | ----- |
| draft → await | Kế toán bấm Tính Settlement | Kế toán |
| await → settled | Kế toán Confirm Settlement | Kế toán |
| await → await | Kế toán phát hiện cần điều chỉnh, quay lại verify expense | Kế toán |
| settled → closed | Sau khi Trip \= `closed` (tự động) | Hệ thống |
| closed → reopened | Giám đốc Reopen | Giám đốc |

---

### **3.6.3 Công thức tính** {#3.6.3-công-thức-tính}

Total Advance       \= SUM(disbursement.amount WHERE trip\_id \= X)  
Total Valid Expense \= SUM(expense.amount WHERE trip\_id \= X AND status \= 'verified')  
Variance            \= Total Advance − Total Valid Expense

Variance \> 0  → REFUND\_REQUIRED    (tài xế dư tiền, phải hoàn lại)  
Variance \< 0  → ADDITIONAL\_PAYMENT (công ty chi bù, phải trả thêm)  
Variance \= 0  → BALANCED           (cân bằng)

---

### **3.6.4 Stimulus / Response Sequences** {#3.6.4-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| Kế toán bấm Tính Settlement (sau khi tất cả expense resolved) | Hệ thống tính Total Advance, Total Valid Expense, Variance; tạo Settlement record ở `draft` → `await` |
| Kế toán xem kết quả tính | Màn hình hiện: danh sách disbursement, danh sách verified expense, variance, kết luận REFUND/ADDITIONAL/BALANCED |
| Kế toán phát hiện cần điều chỉnh (quay lại verify thêm) | Settlement về `await`; Kế toán verify thêm expense; tính lại |
| Kế toán Confirm Settlement | Settlement: `await` → `settled`; Trip: `await` → `settled`; lock Settlement; push notification tài xế kết quả quyết toán |
| Giám đốc Reopen Settlement đã `closed` | Settlement: `closed` → `reopened`; AuditLog ghi nhận; Kế toán có thể điều chỉnh |

---

### **3.6.5 Functional Requirements** {#3.6.5-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-SET-001 | Nút Tính Settlement chỉ enabled khi tất cả expense đã ở trạng thái cuối; disabled nếu còn expense chưa resolved | HIGH |
| REQ-SET-002 | Công thức Variance bắt buộc: Total Advance − Total Valid Expense; hiển thị rõ 3 trường: total advance, total valid expense, variance | HIGH |
| REQ-SET-003 | Kết quả Settlement hiện kết luận rõ ràng: REFUND\_REQUIRED / ADDITIONAL\_PAYMENT / BALANCED kèm số tiền cụ thể | HIGH |
| REQ-SET-004 | Sau khi Confirm, Settlement bị lock — không thể sửa nếu không có Giám đốc Reopen | HIGH |
| REQ-SET-005 | Chỉ Giám đốc mới có quyền Reopen Settlement đã `closed`; không có bypass mechanism | HIGH |
| REQ-SET-006 | Mọi thao tác trên Settlement (calculate, confirm, reopen) phải ghi AuditLog đầy đủ | HIGH |
| REQ-SET-007 | Settlement summary phải nhất quán giữa màn hình Kế toán và màn hình Tài xế — cùng số liệu, cùng thời điểm | HIGH |

---

## **SF-7 — Driver Settlement Confirmation & Trip Closing** {#sf-7-—-driver-settlement-confirmation-&-trip-closing}

### **3.7.1 Mô tả và ưu tiên** {#3.7.1-mô-tả-và-ưu-tiên}

Luồng đóng chuyến 3 bên bắt buộc theo thứ tự nghiêm ngặt: Kế toán confirm Settlement → Tài xế xác nhận kết quả → QLVH đóng chuyến. Không bước nào có thể bỏ qua hoặc đảo thứ tự. Đây là bước cuối cùng của vòng đời chuyến.

**Ưu tiên: HIGH**

---

### **3.7.2 State Machine** {#3.7.2-state-machine}

Trip: settled → pendingclose → closed  
         ↑            ↑  
  (Kế toán      (Tài xế OK)  
  confirm  
  Settlement)

Flow đầy đủ 3 bên:

Kế toán Confirm Settlement  
    → Trip: await → settled  
    → Push notification Tài xế

Tài xế xem kết quả & bấm OK  
    → Trip: settled → pendingclose  
    → Push notification QLVH

QLVH bấm Close chuyến  
    → Trip: pendingclose → closed  
    → Settlement: settled → closed  
    → DriverBalance entry được finalize

---

### **3.7.3 Stimulus / Response Sequences** {#3.7.3-stimulus-/-response-sequences}

| Bước | Hành động người dùng | Response hệ thống |
| ----- | ----- | ----- |
| 1 | Kế toán Confirm Settlement | Trip: `await` → `settled`; push notification tài xế kèm kết quả quyết toán |
| 2 | Tài xế mở notification, xem màn hình quyết toán | Hiện: tổng tạm ứng / tổng chi hợp lệ / chênh lệch / kết luận REFUND-ADDITIONAL-BALANCED |
| 3 | Tài xế bấm OK xác nhận | Trip: `settled` → `pendingclose`; push notification QLVH "Tài xế đã xác nhận — Chuyến X chờ đóng" |
| 4 | Tài xế bấm Từ chối / Dispute quyết toán | \[Xem Issues List C-005 — chưa có flow xử lý trong MVP\] |
| 5 | QLVH nhận notification, mở Dashboard | Nút "Close chuyến" visible và enabled vì Trip \= `pendingclose` |
| 6 | QLVH bấm Close chuyến | Trip: `pendingclose` → `closed`; Settlement: `settled` → `closed`; DriverBalance finalized |

---

### **3.7.4 Functional Requirements** {#3.7.4-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-CLS-001 | Màn hình kết quả quyết toán Tài xế hiện đủ 4 trường: Tổng tạm ứng / Tổng chi hợp lệ / Chênh lệch / Kết luận (REFUND/ADDITIONAL/BALANCED) | HIGH |
| REQ-CLS-002 | Tài xế phải bấm OK xác nhận trước khi Trip chuyển `pendingclose`; không có auto-confirm sau X giờ ở MVP | HIGH |
| REQ-CLS-003 | Nút Close chuyến ở App QLVH chỉ enabled khi Trip \= `pendingclose`; disabled ở mọi status khác | HIGH |
| REQ-CLS-004 | QLVH không thể close chuyến nếu tài xế chưa bấm OK — không có override mechanism ở MVP | HIGH |
| REQ-CLS-005 | Sau khi Trip `closed`, toàn bộ record tài chính liên quan bị lock — không thể sửa trừ khi Giám đốc Reopen Settlement | HIGH |
| REQ-CLS-006 | Chuyến ở `await` quá 72h chưa có Settlement → tạo SLA Alert cho cả QLVH và Kế toán | HIGH |

---

## **SF-8 — Driver Balance** {#sf-8-—-driver-balance}

### **3.8.1 Mô tả và ưu tiên** {#3.8.1-mô-tả-và-ưu-tiên}

Sau khi Settlement confirmed, hệ thống tự động ghi công nợ tài xế vào sổ ledger liên tục. Đây là nguồn dữ liệu chính thức để Kế toán cấn trừ lương hoặc chi bù các kỳ sau, và để Giám đốc theo dõi tổng cash exposure.

**Ưu tiên: HIGH**

---

### **3.8.2 State Machine** {#3.8.2-state-machine}

open → partially-cleared → cleared  
     ↘ disputed → adjusted → cleared

| Transition | Trigger | Actor |
| ----- | ----- | ----- |
| \[tạo\] → open | Settlement confirmed tự động | Hệ thống |
| open → partially-cleared | Kế toán ghi nhận một phần đã thanh toán | Kế toán |
| open/partially-cleared → cleared | Kế toán xác nhận đã thanh toán đủ | Kế toán |
| open → disputed | Tài xế hoặc Kế toán gắn flag tranh chấp | Kế toán |
| disputed → adjusted | Kế toán điều chỉnh số tiền sau khi xác minh | Kế toán |
| adjusted → cleared | Kế toán xác nhận đã giải quyết xong | Kế toán |

---

### **3.8.3 Stimulus / Response Sequences** {#3.8.3-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| Settlement được Confirm (status \= `settled`) | DriverBalance entry tự động tạo: credit nếu REFUND\_REQUIRED, debit nếu ADDITIONAL\_PAYMENT; status \= `open` |
| Kế toán mở sổ ledger tài xế | Hiện danh sách tất cả entry theo tài xế: chuyến nào, số tiền, direction (phải thu / phải trả), trạng thái |
| Tài xế hoàn tiền dư / Kế toán cấn trừ lương | Kế toán ghi nhận thanh toán; entry: `open` → `partially-cleared` hoặc `cleared` |
| Giám đốc xem tổng cash exposure | Dashboard hiện tổng outstanding balance toàn bộ tài xế |

---

### **3.8.4 Functional Requirements** {#3.8.4-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-BAL-001 | DriverBalance entry chỉ được tạo tự động sau khi Settlement status \= `settled`; không tạo thủ công | HIGH |
| REQ-BAL-002 | Entry ghi rõ direction: credit (tài xế phải hoàn lại) hoặc debit (công ty phải trả thêm) | HIGH |
| REQ-BAL-003 | Sổ ledger liên tục theo tài xế — mỗi Settlement confirmed tạo 1 entry mới, không ghi đè lịch sử | HIGH |
| REQ-BAL-004 | Kế toán ghi nhận thanh toán từng phần hoặc toàn phần; entry chuyển `partially-cleared` hoặc `cleared` | HIGH |
| REQ-BAL-005 | Kế toán export báo cáo công nợ tài xế theo tháng/quý (Excel hoặc PDF) | HIGH |
| REQ-BAL-006 | Giám đốc xem tổng outstanding balance của toàn bộ tài xế (tổng tiền đang treo chưa thanh toán) | MED |

---

## **SF-9 — Notification & SLA Alert** {#sf-9-—-notification-&-sla-alert}

### **3.9.1 Mô tả và ưu tiên** {#3.9.1-mô-tả-và-ưu-tiên}

Đảm bảo đúng người nhận đúng thông báo tại đúng thời điểm — không có bước nào trong vòng đời chuyến cần nhắc nhau qua Zalo hay điện thoại. SF-9 là cross-cutting feature, phụ thuộc vào sự kiện từ cả Logistics Engine và Finance Engine.

**Ưu tiên: HIGH**

---

### **3.9.2 State Machine** {#3.9.2-state-machine}

SF-9 không có state machine riêng. Hoạt động theo mô hình event-driven: lắng nghe domain event từ các engine → gửi notification đến đúng recipient.

---

### **3.9.3 Danh sách trigger notification đầy đủ** {#3.9.3-danh-sách-trigger-notification-đầy-đủ}

| \# | Event trigger | Gửi cho | Nội dung thông báo |
| ----- | ----- | ----- | ----- |
| N-01 | Trip submitted (QLVH gửi chuyến) | Tài xế | "Bạn được phân công chuyến \[mã\] — \[tuyến\] ngày \[ngày đi\]" |
| N-02 | AdvReq pending (ngưỡng thường) | Kế toán | "Yêu cầu tạm ứng \[X đồng\] — Chuyến \[mã\] cần phê duyệt" |
| N-03 | AdvReq pending (vượt ngưỡng) | Giám đốc | "Yêu cầu tạm ứng \[X đồng\] vượt ngưỡng — cần phê duyệt" |
| N-04 | AdvReq disbursed | Tài xế | "Đã giải ngân \[X đồng\] — \[Tạm ứng chuyến / Tạm ứng phát sinh\]" |
| N-05 | AdvReq rejected | QLVH | "Yêu cầu tạm ứng bị từ chối — \[lý do\]" |
| N-06 | Trip ended (tài xế End) | Kế toán | "Chuyến \[mã\] cần đối soát — tài xế đã kết thúc" |
| N-07 | ExpenseItem → need-info | Tài xế | "Kế toán yêu cầu bổ sung chứng từ — \[lý do\] — \[link expense\]" |
| N-08 | Settlement confirmed | Tài xế | "Kết quả quyết toán chuyến \[mã\]: \[REFUND X đồng / NHẬN THÊM X đồng / CÂN BẰNG\]" |
| N-09 | Trip → pendingclose (tài xế OK) | QLVH | "Tài xế đã xác nhận quyết toán — Chuyến \[mã\] chờ đóng" |

---

### **3.9.4 Stimulus / Response Sequences** {#3.9.4-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| Bất kỳ event nào trong bảng N-01 đến N-09 xảy ra | Notification service nhận event → gửi push notification đến đúng recipient trong \< 30 giây |
| Chuyến ở `await` tròn 72h chưa có Settlement confirmed | Hệ thống tạo SLA Alert; gửi notification đồng thời đến QLVH và Kế toán |
| Notification gửi thất bại | Hệ thống retry tối đa 3 lần; nếu vẫn fail → ghi log lỗi để support xử lý thủ công |

---

### **3.9.5 Functional Requirements** {#3.9.5-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-NTF-001 | Toàn bộ 9 notification trigger trong bảng N-01 đến N-09 phải được implement đầy đủ | HIGH |
| REQ-NTF-002 | Notification phải được gửi trong \< 30 giây sau khi trigger event xảy ra | HIGH |
| REQ-NTF-003 | SLA Alert tự động tạo đúng 72h sau khi Trip chuyển sang `await` (±5 phút); gửi đồng thời QLVH và Kế toán | HIGH |
| REQ-NTF-004 | Notification N-07 (need-info) phải kèm link trực tiếp vào expense cụ thể cần bổ sung | HIGH |
| REQ-NTF-005 | Notification N-08 (settlement result) phải hiện số tiền cụ thể và kết luận rõ ràng — không chỉ báo "có kết quả mới" | HIGH |
| REQ-NTF-006 | Notification service retry tối đa 3 lần nếu gửi thất bại; ghi log lỗi nếu vẫn không thành công | MED |

---

## **SF-10 — Dashboard, Reporting & Export** {#sf-10-—-dashboard,-reporting-&-export}

### **3.10.1 Mô tả và ưu tiên** {#3.10.1-mô-tả-và-ưu-tiên}

Cung cấp visibility phù hợp theo từng role — mỗi người thấy đúng phần thông tin họ cần, không hơn không kém. Bao gồm dashboard realtime, báo cáo tổng hợp, và export dữ liệu sang phần mềm kế toán nội bộ.

**Ưu tiên: MED** (dashboard cơ bản HIGH, analytics nâng cao MED)

---

### **3.10.2 State Machine** {#3.10.2-state-machine}

SF-10 không có state machine — là view layer, không tạo hay thay đổi trạng thái entity nào.

---

### **3.10.3 Dashboard theo role** {#3.10.3-dashboard-theo-role}

**App QLVH — Dispatch Dashboard**

| Thông tin hiển thị | Mô tả |
| ----- | ----- |
| Danh sách chuyến theo status | Filter theo: đang chạy / chờ quyết toán / chờ đóng / đã đóng |
| SLA Alert panel | Danh sách chuyến treo \> 72h ở `await` |
| Tổng tạm ứng đang pending | Số request chưa được duyệt |
| Timeline status từng chuyến | Xem lịch sử transition của chuyến cụ thể |

**App Kế toán**

| Thông tin hiển thị | Mô tả |
| ----- | ----- |
| Expense Verification Queue | Danh sách trip đang `await` cần đối soát, sắp xếp theo ngày |
| Advance Request queue | Request đang `pending` chờ duyệt |
| Driver Balance ledger | Công nợ từng tài xế, outstanding balance |
| Báo cáo quyết toán | Tổng hợp theo tháng/quý — tổng tạm ứng, tổng chi, variance |

**App Giám đốc**

| Thông tin hiển thị | Mô tả |
| ----- | ----- |
| Pending approval list | AdvanceRequest vượt ngưỡng đang chờ duyệt |
| Tổng tạm ứng đang treo | Cash đang nằm ngoài chưa quyết toán |
| Công nợ tài xế quá hạn | Driver Balance entry `open` quá N ngày |
| KPI vận hành | Thời gian quyết toán TB / chuyến; tỷ lệ chuyến đủ chứng từ |
| Cảnh báo chi phí bất thường | Chuyến / tài xế có variance vượt định mức |

---

### **3.10.4 Stimulus / Response Sequences** {#3.10.4-stimulus-/-response-sequences}

| Hành động người dùng | Response hệ thống |
| ----- | ----- |
| Kế toán bấm Export báo cáo quyết toán tháng | Hệ thống tổng hợp dữ liệu, xuất file CSV hoặc PDF trong \< 10 giây |
| Giám đốc xem dashboard | Load KPI realtime từ Finance Engine \+ Logistics Engine |
| QLVH click vào chuyến cụ thể | Hiện timeline status đầy đủ và tóm tắt tài chính chuyến đó |
| Kế toán export Driver Balance | File CSV gồm: tên tài xế, chuyến, ngày, số tiền, direction, trạng thái |

---

### **3.10.5 Functional Requirements** {#3.10.5-functional-requirements}

| Mã | Yêu cầu | Ưu tiên |
| ----- | ----- | ----- |
| REQ-RPT-001 | App QLVH: Dispatch Dashboard hiện danh sách chuyến theo status, filter được; SLA Alert panel riêng | HIGH |
| REQ-RPT-002 | App Kế toán: Expense Verification Queue lọc được theo ngày/tài xế/tuyến; hiện rõ flag Missing Receipt | HIGH |
| REQ-RPT-003 | App Kế toán: Driver Balance ledger hiện outstanding balance theo từng tài xế và tổng toàn hệ thống | HIGH |
| REQ-RPT-004 | App Giám đốc: Hiện tổng tạm ứng đang treo và công nợ tài xế quá hạn | MED |
| REQ-RPT-005 | Kế toán export báo cáo quyết toán (CSV/PDF) theo tháng hoặc quý trong \< 10 giây | HIGH |
| REQ-RPT-006 | Kế toán export Driver Balance theo tháng/quý (CSV/PDF) | HIGH |
| REQ-RPT-007 | Format CSV export tương thích với cấu trúc import của MISA hoặc Fast Accounting | MED |
| REQ-RPT-008 | App Giám đốc: KPI bao gồm thời gian quyết toán trung bình / chuyến và tỷ lệ chuyến đủ chứng từ | MED |

4. # **External Interface Requirements** {#external-interface-requirements}

## **User Interfaces** {#user-interfaces}

*\<Describe the logical characteristics of each interface between the software product and the users. This may include sample screen images, any GUI standards or product family style guides that are to be followed, screen layout constraints, standard buttons and functions (e.g., help) that will appear on every screen, keyboard shortcuts, error message display standards, and so on. Define the software components for which a user interface is needed. Details of the user interface design should be documented in a separate user interface specification.\>*

## **Hardware Interfaces**

*\<Describe the logical and physical characteristics of each interface between the software product and the hardware components of the system. This may include the supported device types, the nature of the data and control interactions between the software and the hardware, and communication protocols to be used.\>*

## **Software Interfaces**

*\<Describe the connections between this product and other specific software components (name and version), including databases, operating systems, tools, libraries, and integrated commercial components. Identify the data items or messages coming into the system and going out and describe the purpose of each. Describe the services needed and the nature of communications. Refer to documents that describe detailed application programming interface protocols. Identify data that will be shared across software components. If the data sharing mechanism must be implemented in a specific way (for example, use of a global data area in a multitasking operating system), specify this as an implementation constraint.\>*

## **Communications Interfaces**

*\<Describe the requirements associated with any communications functions required by this product, including e-mail, web browser, network server communications protocols, electronic forms, and so on. Define any pertinent message formatting. Identify any communication standards that will be used, such as FTP or HTTP. Specify any communication security or encryption issues, data transfer rates, and synchronization mechanisms.\>*

5. # **Other Nonfunctional Requirements**

## **Performance Requirements** {#performance-requirements}

*\<If there are performance requirements for the product under various circumstances, state them here and explain their rationale, to help the developers understand the intent and make suitable design choices. Specify the timing relationships for real time systems. Make such requirements as specific as possible. You may need to state performance requirements for individual functional requirements or features.\>*

## **Safety Requirements**

*\<Specify those requirements that are concerned with possible loss, damage, or harm that could result from the use of the product. Define any safeguards or actions that must be taken, as well as actions that must be prevented. Refer to any external policies or regulations that state safety issues that affect the product’s design or use. Define any safety certifications that must be satisfied.\>*

## **Security Requirements**

*\<Specify any requirements regarding security or privacy issues surrounding use of the product or protection of the data used or created by the product. Define any user identity authentication requirements. Refer to any external policies or regulations containing security issues that affect the product. Define any security or privacy certifications that must be satisfied.\>*

## **Software Quality Attributes**

*\<Specify any additional quality characteristics for the product that will be important to either the customers or the developers. Some to consider are: adaptability, availability, correctness, flexibility, interoperability, maintainability, portability, reliability, reusability, robustness, testability, and usability. Write these to be specific, quantitative, and verifiable when possible. At the least, clarify the relative preferences for various attributes, such as ease of use over ease of learning.\>*

6. # **Other Requirements**

*\<Define any other requirements not covered elsewhere in the SRS. This might include database requirements, internationalization requirements, legal requirements, reuse objectives for the project, and so on. Add any new sections that are pertinent to the project.\>*

**Appendix A: Glossary**

*\<Define all the terms necessary to properly interpret the SRS, including acronyms and abbreviations. You may wish to build a separate glossary that spans multiple projects or the entire organization, and just include terms specific to a single project in each SRS.\>*

**Appendix B: Analysis Models**

*\<Optionally, include any pertinent analysis models, such as data flow diagrams, class diagrams, state-transition diagrams, or entity-relationship diagrams*.\>

**Appendix C: Issues List**

*\< This is a dynamic list of the open requirements issues that remain to be resolved, including TBDs, pending decisions, information that is needed, conflicts awaiting resolution, and the like.\>*