USE [HIS]
GO

SELECT [id]
      ,[PatId]
      ,[fname]
      ,[lname]
      ,[mname]
      ,[dob]
      ,[mrn]
      ,[ssn]
      ,[address1]
      ,[address2]
      ,[city]
      ,[state]
      ,[zip]
      ,[primary_phone]
      ,[secondary_phone]
      ,[email]
      ,[work_name]
      ,[work_address]
      ,[work_phone]
      ,[primary_insurance]
      ,[groupId]
      ,[memberId]
      ,[insurance_type]
      ,[copay]
      ,[deductible]
      ,[consent_date]
      ,[Contact1_name]
      ,[contact1_phone]
      ,[contact1_rel]
      ,[contact2_name]
      ,[contact2_phone]
      ,[contact2_rel]
      ,[gender]
  FROM [dbo].[Patient]
GO
select distinct zip from Patient
select TOP 1 CONCAT([fname],[mname],[lname]) as fullname ,* from [dbo].[Patient]
ORDER BY LEN(CONCAT([fname],[mname],[lname]))DESC  

SELECT * FROM Patient WHERE [dob] > '01-01-1970'
SELECT * FROM Patient ORDER BY [dob] ASC
SELECT [fname],[lname],[primary_insurance] FROM [dbo].[Patient]
WHERE [primary_insurance] = 'ABC insurance'
SELECT [fname],[lname],[zip] FROM [dbo].[Patient]
WHERE [zip] IN(60192,60193,60173)
SELECT[fname],[mname],[lname],[address1],[address2],[city],[state],[zip] FROM
[dbo].[Patient] WHERE address1 IS NOT NULL AND [city] IS NOT NULL AND state IS NOT NULL AND [zip] IS NOT NULL

SELECT p.[fname],p.[lname],p.[dob],p.[gender],s.Schedule_Date FROM [dbo].[Patient] p INNER JOIN[dbo].[Patient_Schedule] s
ON p.[id]=s.[PatId] ORDER BY s.[Schedule_Date]
SELECT [primary_insurance],COUNT(*) FROM [dbo].[Patient]
GROUP BY [primary_insurance]
SELECT [primary_insurance],COUNT(*) FROM[dbo].[Patient] GROUP BY 
[primary_insurance] HAVING count(*)>3
Select  j.name,AVG([fulltime_pay]) From [dbo].[Staff] s,[dbo].[Job_Lookup] j WHERE s.[job_id]=j.[id]
GROUP BY j.name

SELECT [job_id],AVG([fulltime_pay]) FROM Staff Group By [job_id]

Select  j.name,AVG([fulltime_pay]) From [dbo].[Staff] s,[dbo].[Job_Lookup] j WHERE s.[job_id]=j.[id]
GROUP BY j.name HAVING AVG([fulltime_pay])>135000

SELECT[total],[outstanding] FROM [dbo].[Bill_Detail]
SELECT sum(total) Total_Billed,sum(outstanding) Total_Outstanding From [dbo].[Bill_Detail]

SELECT p.fname,p.lname,pv.[visit_date] from [dbo].[Patient] p,[dbo].[Patient_Visit] pv WHERE p.[id]=pv.[patId] and
MONTH(pv.[visit_date])=1 and
YEAR(pv.[visit_date])=2016
SELECT p.[fname] ,p.[lname],ps.[Schedule_Date] FROM [dbo].[Patient] p,[dbo].[Patient_Schedule] ps
WHERE p.[id]=ps.[PatId] and
DATEDIFF(d,ps.[Schedule_Date],getdate())=0

 SELECT LTRIM(CONCAT(RTRIM (s.prefix),' ',s.fname,' ',s.lname))FROM staff s

 select MAX(LEN(CONCAT(fname,lname))) from patient

 
 SELECT fname,lname from patient  WHERE LEN(CONCAT(fname,lname))=(SELECT MAX(LEN(CONCAT(fname,lname))) from Patient)
 select fname from patient
 Union
 select fname from patient

 select fname from patient
 Union
 select lname from patient
 SELECT fname,lname from patient Where gender='M'
 UNION 
 Select fname,lname from patient Where gender='F'

 SELECT (CONCAT(fname,' ',lname)) AS patientname,dob,(DATEDIFF(yy,[dob],getdate())) AS age from Patient 

 SELECT count(*) As  Registered_patients, SUM(DATEDIFF(yy,[dob],getdate())) 
 AS sum_age, AVG((DATEDIFF(yy,[dob],getdate()))) AS avg_age from Patient

 SELECT[service_desc] ,[total] FROM [dbo].[Bill_Detail]
 UNION 
 SELECT[service_desc] , [total] FROM [dbo].[Bill_Detail]

 SELECT DISTINCT [service_desc] ,[total] FROM [dbo].[Bill_Detail]


 SELECT p.[primary_insurance],(SUM(b.[insurance_pay])) AS TOTALINSURANCE_PAY from [dbo].[Patient] p,[dbo].[Bill_Detail] b
 WHERE p.[id]=b.[bill_id]
 GROUP BY p.[primary_insurance]










 




 






