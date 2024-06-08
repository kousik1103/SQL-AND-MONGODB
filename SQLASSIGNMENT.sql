use org1;
CREATE TABLE Worker (
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,FIRST_NAME CHAR(25),LAST_NAME CHAR(25),SALARY INT,JOINING_DATE DATETIME,
DEPARTMENT CHAR(25));
INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, 
DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '14-02-20 09:00:00', 'HR'),(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
CREATE TABLE Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);
INSERT INTO Bonus 
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');
CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker(WORKER_ID)
 ON DELETE CASCADE
);
INSERT INTO Title 
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');
/*QS1*/
Select FIRST_NAME AS WORKER_NAME FROM Worker;
/*QS2*/
Select upper(FIRST_NAME) from Worker; 
/*QS3*/
Select distinct(DEPARTMENT) FROM Worker;
/*qs4*/
Select left(FIRST_NAME,3) FROM Worker;
/*qs5*/
SELECT Locate("a","Amitabh") as position from Worker;
/*QS6*/
Select RTRIM(FIRST_NAME) FROM Worker;
/*7*/
SELECT Ltrim(DEPARTMENT) FROM Worker;
/*8*/
SELECT DISTINCT(DEPARTMENT),LENGTH(DEPARTMENT) FROM Worker;
/*9*/
Select REPLACE(FIRST_NAME,'a','A') from Worker;
/*10*/
Select concat(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME FROM Worker;
/*11*/
SELECT * FROM Worker order by FIRST_NAME;
/*12*/
SELECT * FROM Worker order by FIRST_NAME ASC, Department DESC;
/*13*/
SELECT * FROM Worker where FIRST_NAME="Vipul" OR FIRST_NAME="Satish";
/*14*/
SELECT * FROM Worker where FIRST_NAME!="Vipul" OR FIRST_NAME!="Satish";
/*15*/
SELECT * FROM Worker where DEPARTMENT="Admin";
/*16*/
Select * from Worker where FIRST_NAME like "%a%";
/*17*/
Select * from Worker where FIRST_NAME like"%a";
/*19*/
Select * from Worker where Salary>100000 and Salary<500000;
/*18*/
Select * from Worker where FIRST_NAME like "%_____h";
/*20*/
Select * FROM Worker where JOINING_DATE > 2014-02-01 AND JOINING_DATE<2014-03-01;
/*21*/
Select count(FIRST_NAME) FROM Worker where DEPARTMENT="Admin";
/*22*/
Select FIRST_NAME from Worker where Salary>=50000 and Salary<=100000;
/*23*/
SELECT COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT order by Count(Department) desc;
/*24*/
SELECT * FROM WORKER JOIN Title ON WORKER.WORKER_ID = Title.WORKER_REF_ID WHERE Title.WORKER_TITLE = 'MANAGER';
/*25*/
SELECT DEPARTMENT,SALARY,COUNT(*) FROM Worker group by DEPARTMENT,SALARY having count(*)>1;
/*29 AND 38*/
Select Worker.* from Worker INNER join Bonus on Worker.WORKER_ID=Bonus.WORKER_REF_ID; 
/*31*/
SELECT now();
/*30*/
Select Worker.* from Worker left join Bonus on Worker.WORKER_ID=Bonus.WORKER_REF_ID WHERE Bonus.WORKER_REF_ID IS NULL; 
/*32*/
SELECT * FROM Worker limit 10;
/*33* AND *34* AND *48*/
SELECT SALARY FROM Worker order by SALARY LIMIT 4,1;
/*35*/
SELECT SALARY,GROUP_CONCAT(FIRST_NAME) From Worker group by SALARY HAVING COUNT(*)>1;
/*36*/
SELECT DISTINCT(SALARY) FROM WORKER ORDER BY SALARY DESC LIMIT 1,1;
/*40*/
Select DEPARTMENT FROM Worker GROUP BY DEPARTMENT having count(*)<5;
/*41*/
SELECT DEPARTMENT,COUNT(*) FROM Worker group by DEPARTMENT;
/*42*/
SELECT * FROM Worker order by WORKER_ID DESC LIMIT 1;
/*43*/
SELECT * FROM WORKER LIMIT 1;
/*44*/
SELECT * FROM Worker order by WORKER_ID DESC LIMIT 5;
/*45*/
SELECT FIRST_NAME,SALARY FROM Worker WHERE (DEPARTMENT,SALARY) IN (SELECT DEPARTMENT,MAX(SALARY) FROM Worker GROUP BY DEPARTMENT);
/*46*/
SELECT DISTINCT(SALARY) FROM Worker order by SALARY DESC LIMIT 3;
/*47*/
SELECT DISTINCT(SALARY) FROM Worker order by SALARY LIMIT 3;
/*49*/
SELECT DEPARTMENT,SUM(SALARY) FROM Worker Group by DEPARTMENT;
/*50*/
SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 1; 

















