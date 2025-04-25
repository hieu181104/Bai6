;-- 2:
INSERT INTO [dbo].[SV] ([masv], [hodem],[ten],  [ns], [lop], [sdt])
VALUES ('225480106019', N'Nguy?n Trung', N'Hi?u', '2004-11-18',  'K58KTP', '0328125479');

;-- 3:
select *
from SV
where ns = '2004-11-18' and masv <> '225480106019'; 

;-- 4:
select *
from SV
where DAY (ns) = '18' and MONTH (ns) = '11';

;--5:
select *
from SV
where MONTH (ns) = '11' and YEAR (ns) = '2004';

;--6:
select *
from SV
where ten = N'Hi?u';

;--7:
select *
from SV
where hodem = N'Nguy?n Trung';

;--8:
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

;--9:
SELECT *
FROM SV
WHERE lop like '%KMT%'
ORDER BY ten COLLATE Vietnamese_CI_AS, hodem COLLATE Vietnamese_CI_AS;

;--10:
SELECT *
FROM SV
WHERE lop LIKE '%KMT%'
  AND hodem COLLATE Vietnamese_CI_AI LIKE '%thi%';
