# <p align="center">Bài tập 6 - Nguyễn Trung Hiếu - K225480106019 - K58KTP </p>
# Chủ đề: Câu lệnh Select
Yêu cầu bài tập: 
Cho file sv_tnut.sql (1.6MB)
1. Hãy nêu các bước để import được dữ liệu trong sv_tnut.sql vào sql server của em
2. dữ liệu đầu vào là tên của sv; sđt; ngày, tháng, năm sinh của sinh viên (của sv đang làm bài tập này)
3. nhập sql để tìm xem có những sv nào trùng hoàn toàn ngày/tháng/năm với em?
4. nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
5. nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
6. nhập sql để tìm xem có những sv nào trùng tên với em?
7. nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
8. nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
9. BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH.
10. HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)
DEADLINE: 23H59:59 NGÀY 25/4/2025
Ghi chú: Giải thích tại sao lại có SQL như vậy.
# <p align= "center"> Bài làm </p>
## 1: Hãy nêu các bước để import được dữ liệu trong sv_tnut.sql vào sql sever của em
Download file sv_tnut.sql về máy. Khởi động SSMS, tạo một database mới tên Bai6, sau đó mở file sv_tnut.sql vừa tải rồi execute file để thêm dữ liệu vào database Bai6:
![image](https://github.com/user-attachments/assets/e37e5538-bc78-4186-975e-ac0aa7143d8f)
![image](https://github.com/user-attachments/assets/b20e5b6e-192b-442c-ac49-0c7a34d50abf)
Sau khi chạy file sv_tnut.sql ta được bảng dữ liệu:
![image](https://github.com/user-attachments/assets/8ffb0eff-bcee-42d4-a1d0-08ec3ca65e81)
## 2: Dữ liệu đầu vào là tên của sv; sđt; ngày, tháng, năm sinh của sinh viên (của sv đang làm bài tập này)
Sử dụng lệnh insert để thêm một trường dữ liệu về thông tin của em:
### chú ý: mặc dù mã sv của em là K225480106019 nhưng vì trong database đã tồn tại mã sv này nên em chỉ chèn với nội dung "225480106019" vào trường masv:
```sql
INSERT INTO [dbo].[SV] ([masv], [hodem],[ten],  [ns], [lop], [sdt])
VALUES ('225480106019', N'Nguyễn Trung', N'Hiếu', '2004-11-18',  'K58KTP', '0328125479');
```
![image](https://github.com/user-attachments/assets/91ab817b-fa21-4f6c-98ac-f3fb824d53f9)
## 3: Nhập sql để tìm xem có những sv nào trùng hoàn toàn ngày/tháng/năm với em?
```sql
select *
from SV
where ns = '2004-11-18' and masv <> '225480106019';
```
![image](https://github.com/user-attachments/assets/643b6cc2-930e-4a25-aac1-7dfa4b3a18f2)
## 4: Nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
Để tìm những sv trùng ngày và tháng sinh, em sử dụng hàm DAY và MONTH:
```sql
select *
from SV
where DAY (ns) = '18' and MONTH (ns) = '11';
```
![image](https://github.com/user-attachments/assets/106cff5b-4533-436b-b894-7047f639fc7a)
## 5: Nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
Để tìm những sinh viên trùng tháng và năm sinh , em sử dụng hàm MONTH và YEAR:
```sql
select *
from SV
where MONTH (ns) = '11' and YEAR (ns) = '2004';
```
![image](https://github.com/user-attachments/assets/ce9e430a-bf24-439d-a69f-cd3fe80b5d3b)
## 6: Nhập sql để tìm xem có những sv nào trùng tên với em?
```sql
select *
from SV
where ten = N'Hiếu';
```
![image](https://github.com/user-attachments/assets/a7c8dee0-5bfb-4f67-9f75-efd74c88555e)
## 7: Nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
```sql
select *
from SV
where hodem = N'Nguyễn Trung';
```
![image](https://github.com/user-attachments/assets/5eb34708-d9c8-49a0-8fd4-f0f0ff7707ee)
## 8: Nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
Để tìm số điện thoại của những sinh viên chỉ khác 1 số so với sdt của em, em sử dụng Hàm SUBSTRING(sdt, n, 1) lấy từng ký tự thứ n trong số điện thoại. So sánh từng ký tự với số của em là'0328125479'. Nếu tổng các ký tự khác nhau đúng bằng 1 thì đó là số chỉ sai đúng 1 số.
```sql
DECLARE @MyPhone nvarchar(26) = '0328125479';
SELECT *
FROM SV
WHERE LEN(sdt) = 10
  AND (
    (CASE WHEN SUBSTRING(sdt, 1, 1) <> SUBSTRING(@MyPhone, 1, 1) THEN 1 ELSE 0 END) +
    (CASE WHEN SUBSTRING(sdt, 2, 1) <> SUBSTRING(@MyPhone, 2, 1) THEN 1 ELSE 0 END) +
    (CASE WHEN SUBSTRING(sdt, 3, 1) <> SUBSTRING(@MyPhone, 3, 1) THEN 1 ELSE 0 END) +
    (CASE WHEN SUBSTRING(sdt, 4, 1) <> SUBSTRING(@MyPhone, 4, 1) THEN 1 ELSE 0 END) +
    (CASE WHEN SUBSTRING(sdt, 5, 1) <> SUBSTRING(@MyPhone, 5, 1) THEN 1 ELSE 0 END) +
    (CASE WHEN SUBSTRING(sdt, 6, 1) <> SUBSTRING(@MyPhone, 6, 1) THEN 1 ELSE 0 END) +
    (CASE WHEN SUBSTRING(sdt, 7, 1) <> SUBSTRING(@MyPhone, 7, 1) THEN 1 ELSE 0 END) +
    (CASE WHEN SUBSTRING(sdt, 8, 1) <> SUBSTRING(@MyPhone, 8, 1) THEN 1 ELSE 0 END) +
    (CASE WHEN SUBSTRING(sdt, 9, 1) <> SUBSTRING(@MyPhone, 9, 1) THEN 1 ELSE 0 END) +
	(CASE WHEN SUBSTRING(sdt, 10, 1) <> SUBSTRING(@MyPhone, 10, 1) THEN 1 ELSE 0 END)
  ) = 1;
```
![image](https://github.com/user-attachments/assets/81a9e2e3-4180-4ce8-a6d4-e48bb7eeb1ca)
### Kết quả cho thấy không có sinh viên nào có sdt chỉ khác 1 số so với sdt của em.
## 9: BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH.
```sql
SELECT *
FROM SV
WHERE lop like '%KMT%'
ORDER BY ten COLLATE Vietnamese_CI_AS, hodem COLLATE Vietnamese_CI_AS;
```
### Giải thích:
Lấy tất cả các cột thuộc bảng SV với điều kiện lọc:
- WHERE lop like '%KMT%' : Chỉ lấy những sinh viên có lop chứa chuỗi 'KMT'
- ORDER BY ten COLLATE Vietnamese_CI_AS, hodem COLLATE Vietnamese_CI_AS : Sắp xếp kết quả theo tên, rồi đến hodem. Trong đó có tùy chọn sắp xếp tên tiếng Việt có phân biệt dấu (ví dụ: A Ă Â B C...)
![image](https://github.com/user-attachments/assets/f5e9ff65-2885-42cb-b680-9a81263b6b3a)
## 10: HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)
### Ý tưởng của em: dùng "Thị" để xác định sinh viên nữ khi bảng SV không có trường giới tính
Trong tiếng Việt, "Thị" là một phần họ đệm rất đặc trưng cho giới tính nữ. Vậy nên: Nếu trong họ đệm (tức cột hodem) có chứa chữ "Thị", thì gần như chắc chắn đó là sinh viên nữ. Đối với em, dùng "Thị" trong hodem để xác định sinh viên nữ là một cách khá thông minh, gọn gàng, hợp ngữ cảnh văn hoá Việt.
```sql
SELECT *
FROM SV
WHERE lop LIKE '%KMT%'
  AND hodem COLLATE Vietnamese_CI_AI LIKE '%thi%';
```
![image](https://github.com/user-attachments/assets/020bc46d-19f0-49fa-b847-b2245a64b919)
# <p align = "center"> HẾT </p>
