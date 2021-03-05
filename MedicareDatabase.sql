 create database mediwave; 
  USE mediwave;
  
--Doctor table
CREATE TABLE doctor(d_id INT(10) PRIMARY KEY,dfname VARCHAR(10),
dlname VARCHAR(10),doj DATE,qualification VARCHAR(20),
dmobileno VARCHAR(12),specialist VARCHAR(20),
experience INT(10),demailid VARCHAR(20),
consultationfee INT(4));
--1
INSERT INTO doctor VALUES(
 100,"prathina","reddy","2000-08-11","MBBS",
 987654321,"ortho",3,
 "prathina1@gmail.com",200);
 --2
 INSERT INTO doctor VALUES(
 101,"harshitha","goud","2011-06-21","phd",
 987653210,"oncology",10,
 "harshitha@gmail.com",500);
 --3
 INSERT INTO doctor VALUES(
 102,"indu","sheshi","2018-08-20","MBBS",
 987534321,"cardiologist",3,
 "indu@gmail.com",1000);
 --4
 INSERT INTO doctor VALUES(
 103,"guido","retchie","2008-06-20","FRCS",
 933334321,"Endocrinologist",15,
 "guido@gmail.com",800);
 --5
INSERT INTO doctor VALUES(
 104,"munna","chary","2009-03-22","BMBS",
 922334321,"Gynaecology",12,
 "munna@gmail.com",800);
  
SELECT * FROM doctor;

--patients table
CREATE TABLE patients(P_id INT(5) Auto_increment, pfname VARCHAR(10),plname VARCHAR(10),
age INT(3),disease VARCHAR(20),city VARCHAR(20),gender varchar(10),
 pmobileno VARCHAR(12),d_id INT(10),pemailid VARCHAR(20),
 reports VARCHAR(20),
    PRIMARY KEY(P_id),
	 FOREIGN KEY(d_id)
	 REFERENCES doctor(d_id));
 --1
INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("janavi","sayani",45,"Arthritis","hyderabad","female",
 "987650321",100,"janavi@gmail.com","NA");
 
 --2
 INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("pranitha","steve",25,"hypothyroidism","indiranagar","female",
 "987656661",102,"pranitha@gmail.com","mild");
 --3)
 INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("raja","rani",78,"cancer","tokyo","male",
 "987655561",101,"raja@gmail.com","NA");
 
 --4)
 INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("guido","rossum",45,"pericardial","cairo","male",
 "987644451",102,"guido@gmail.com","NA");
 --5)
 INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("swetha","mamidi",38,"Endometriosis","hyderabad","female",
 "987655551",104,"swetha@gmail.com","severe");
 --6)
 INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("sravya","naroju",35,"humanpapillomavirus","chennai","female",
 "9876666321",101,"sravya@gmail.com","NA");
 --7)
 INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("yamini","kandivilli",45,"carpalsyndrome","bengaluru","female",
 "9876655321",100,"yamini@gmail.com","NA");
 --8)
 INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("devansh","gogikar",25,"arrhythmia","mumbai","male",
 "9676666321",102,"devansh@gmail.com","recovered");
 --9)
 INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("sravani","maram",40,"goiter","hyderabad","female",
 "9666666321",103,"sravani@gmail.com","mild");
 --10)

INSERT INTO patients(pfname,plname,age,disease,city,gender,pmobileno,d_id,pemailid,reports)
 VALUES("jyotika","surya",55,"hormonedisorders","mumbai","female",
 "9876666551",104,"jyotika@gmail.com","severe");
 SELECT * FROM patients;

--Tests table
CREATE TABLE Tests(testname VARCHAR(20) PRIMARY key,testfee INT(4));
INSERT INTO Tests VALUES("CTscan",1400);
INSERT INTO Tests VALUES("MRIscan",1500);
INSERT INTO Tests VALUES("xray",500);
INSERT INTO Tests VALUES("PETscan",2000);
INSERT INTO Tests VALUES("Bloodtest",1000);

SELECT * FROM tests;

--Bills table
CREATE table Bills(b_id INT(4) auto_increment ,P_id INT(4),appointmentfee int(10),NoofDays INT(10),testname VARCHAR(25),Scanfee INT(10),
   PRIMARY KEY(b_id),
	 FOREIGN KEY(P_id)
	 REFERENCES patients(P_id),
	 FOREIGN KEY(testname)
	 REFERENCES tests(testname));
	 
SELECT *FROM Bills;
	 
INSERT INTO Bills(P_id,appointmentfee,NoofDays,testname,Scanfee) VALUES(1,200,4,"xray",500);
INSERT INTO Bills(P_id,appointmentfee,NoofDays,testname,Scanfee) VALUES(3,500,3,"Bloodtest",1000);
INSERT INTO Bills(P_id,appointmentfee,NoofDays,testname,Scanfee)  VALUES(5,800,5,"MRIscan",1500);
INSERT INTO Bills(P_id,appointmentfee,NoofDays,testname,Scanfee)  VALUES(7,200,4,"CTscan",1400);
INSERT INTO Bills(P_id,appointmentfee,NoofDays,testname,Scanfee)  VALUES(10,800,3,"PETscan",2000);
SELECT *FROM Bills;	 
select P_id,appointmentfee,NoofDays,Scanfee,(NoofDays*appointmentfee)+Scanfee as Totalbill from Bills where P_id =3;
  

 --staff table
    
CREATE TABLE staff(s_id INT PRIMARY key,sfname VARCHAR(20),
slname VARCHAR(20),semail_id VARCHAR(20),
smobileno VARCHAR(15));
SELECT *FROM staff;	 
INSERT INTO staff VALUES(50,"prathina","nagula","prathina20@gmail.com",
"987654320");
INSERT INTO staff VALUES(55,"steve","jobs","steve@gmail.com",
"987354333");
SELECT *FROM staff;	 

--admin table


CREATE TABLE admin(aid INT(10) PRIMARY key,afname VARCHAR(20),
alname VARCHAR(20),aemail_id VARCHAR(20),
amobileno VARCHAR(15));

 INSERT INTO admin VALUES(1,"sai","guda","sai@gmail.com",
"987654320");
INSERT INTO admin VALUES(2,"Ram","Bura","Ram@gmail.com",
"987354333");

SELECT *FROM admin;

SELECT *FROM doctor;
SELECT *FROM patients;
SELECT *FROM Bills;
SELECT *FROM Tests;

SELECT *FROM staff;
