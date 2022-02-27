-- ���̺� ����
CREATE TABLE User_Info(
    user_ID VARCHAR2(20) PRIMARY KEY,
    user_PW VARCHAR2(20) NOT NULL,
    user_Nickname VARCHAR2(20) DEFAULT 'ȸ��',
    user_Birth INT,
    user_gender INT,
    user_City VARCHAR2(20),
    user_Email VARCHAR2(20),
    user_Phone varchar2(30),
    user_level INT DEFAULT 1,
    user_profile VARCHAR2(50)
);

CREATE TABLE Restaurant_Info (
    rest_NO INT PRIMARY KEY,
    rest_Name VARCHAR2(50) NOT NULL,
    rest_Price VARCHAR2(50) NOT NULL,
    rest_Address VARCHAR2(100) NOT NULL,
    rest_Phone varchar2(30),
    rest_Scope INT,
    rest_City VARCHAR2 (20),
    rest_Social VARCHAR2(50),
    rest_fileName varchar(50),
    rest_Theme varchar(20),
    rest_View INT DEFAULT 1,
    rest_OpenDate DATE NOT NULL
);

CREATE TABLE LikeRest_Info (
    like_NO INT PRIMARY KEY,
    user_ID VARCHAR2(20),
    rest_NO INT,
    CONSTRAINT FK_likeID FOREIGN KEY (user_ID)
    REFERENCES User_Info (user_ID)
    ON DELETE CASCADE
);

CREATE TABLE Review_Info (
    review_NO INT PRIMARY KEY,
    user_ID VARCHAR(20) NOT NULL,
    review_Scope INT NOT NULL,
    review_Text VARCHAR(200) NOT NULL,
    rest_NO INT NOT NULL,
    review_Date DATE DEFAULT SYSDATE,
    CONSTRAINT FK_reviewID FOREIGN KEY (user_ID)
    REFERENCES User_Info (user_ID)
    ON DELETE CASCADE,
    CONSTRAINT FK_reviewRest FOREIGN KEY (rest_NO)
    REFERENCES Restaurant_Info (rest_NO)
    ON DELETE CASCADE
);

CREATE TABLE ReviewIMG_Info (
    img_FileNO INT PRIMARY KEY,
    img_FileName VARCHAR2(50),
    review_NO INT,
    fileType varchar2 (50),
    rest_NO INT,
    CONSTRAINT FK_imgReview FOREIGN KEY (review_NO)
    REFERENCES Review_Info (review_NO)
    ON DELETE CASCADE
);

CREATE TABLE Tag_Info (
    tag_NO INT PRIMARY KEY,
    tag_Name VARCHAR(20)
);

CREATE TABLE Rest_Tag (
    rest_NO INT,
    tag_NO INT,
    CONSTRAINT FK_tag_restNO FOREIGN KEY (rest_NO)
    REFERENCES Restaurant_Info (rest_NO)
    ON DELETE CASCADE,
    CONSTRAINT FK_tag_tagNO FOREIGN KEY (tag_NO)
    REFERENCES Tag_Info (tag_NO)
    ON DELETE CASCADE
);


-- ������ ����
CREATE SEQUENCE like_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
CREATE SEQUENCE reviewIMG_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
CREATE SEQUENCE tag_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;


-- �� ���� (���� �߿�)
create view review_img as
select review_no, listagg(img_filename, '/') within group(order by img_filename) as images from reviewimg_info group by review_no;

CREATE view review_content_img as
select review.REVIEW_NO,
review.USER_ID,
review.REVIEW_SCOPE,
review.REVIEW_TEXT,
review.REST_NO,
review.review_date,
review_img.IMAGES from review_info review left outer join review_img on review.review_no = review_img.review_no;

create view profile_review as
select
user_info.USER_ID as user_ID,
user_info.USER_NICKNAME as user_Nickname,
user_info.USER_LEVEL as user_Level,
user_info.USER_PROFILE as user_Profile,
review_content_img.REVIEW_NO as review_No,
review_content_img.REVIEW_SCOPE as review_Scope,
review_content_img.REVIEW_TEXT as review_Text,
review_content_img.REST_NO as rest_NO,
review_content_img.REVIEW_DATE as review_Date,
review_content_img.IMAGES as images from user_info right outer join review_content_img on user_info.user_id = review_content_img.user_id;


-- insert: user_info
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0001', 'a0001', '�׽�Ʈ�̸�1', '1991', 1, '������', 'a0001@gmail.com', '01000000000', 1, 'pizza.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0002', 'a0002', '�׽�Ʈ�̸�2', '1992', 2, '������', 'a0002@gmail.com', '02000000000', 2, 'pasta.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0003', 'a0003', '�׽�Ʈ�̸�3', '1993', 1, '���ֽ�', 'a0003@gmail.com', '03000000000', 1, 'sushi.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0004', 'a0004', '�׽�Ʈ�̸�4', '1994', 2, '���ֽ�', 'a0004@gmail.com', '04000000000', 2, 'pasta.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0005', 'a0005', '�׽�Ʈ�̸�5', '1995', 1, '���ǵ���', 'a0005@gmail.com', '05000000000', 1,'sushi.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0006', 'a0006', '�׽�Ʈ�̸�6', '1996', 2, '���ֽ�', 'a0006@gmail.com', '06000000000', 2, 'sushi2.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0007', 'a0007', '�׽�Ʈ�̸�7', '1997', 1, '������', 'a0007@gmail.com', '07000000000', 2, 'burger.jpg');


-- insert: restaurant_info
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate ,rest_City)
                      values(1,'han.jpg', '�ѹ̿�', '10������', '���� ������ ������� 319 �ѹ̿�', '02-1234-5678', '1', '�ν�Ÿ�׷�','K-Traditional',1, sysdate, '������');
                      
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                      values(2,'kang.jpg', '�����ѿ������Ĵ�', '10������', '���� ������ �Ｚ�� 546 1�� 101ȣ', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate, '������');
                      
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                     values(3,'kill.jpg', '���', '10������', '���� ������ �������129�� 10 ��������', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate, '������');     
                     
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(4,'lee.jpg', '������', '10������', '���� ������ �е���2�� 45', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate, '������');
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                    values(5,'sam.jpg', '����������', '10������', '���� ������ �������114�� 8', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate, '������');
                    
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                 values(6, 'hwa.jpg' , 'ȭ����갣 ', '10������', '���� ������ �������19�� 17', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate, '������');
   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(7,'hwakill.jpg', 'ȭ��־�', '10������', '���� ������ �������106�� 12 ȭ��־�', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate, '������');  
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(8,'da.jpg', '�ٸ���', '10������', '���� ������ �������100�� 13 2�� �ٸ���', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate, '������');
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(9,'ryu.jpg', '������', '10������', '���� ������ �е���25�� 11 ���÷��̽� 2��', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate,'������');
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(10,'inn.jpg', '��û����', '10������', '���� ������ ������� 421 ��õ���� 3��', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate,'������' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(11,'3ch.jpg', '3��������ġŲ', '3������', '��� ���ֽ� ���̵�', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate,'���ֽ�');
                 

insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(12,'cham.jpg', '��ġ����', '3������', '��� ���ֽ� ���̵�', '02-1234-5678', '1', '�ν�Ÿ�׷�','Fish',1, sysdate,'���ֽ�');
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(13,'cham2.jpg', '����Ƚ����', '3������', '��� ���ֽ� ���̵�', '02-1234-5678', '1', '�ν�Ÿ�׷�','Fish',1, sysdate,'���ֽ�');
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(14,'cham3.jpg', '�ʹ�����', '3������', '��� ���ֽ� ���̵�', '02-1234-5678', '1', '�ν�Ÿ�׷�','Fish',1, sysdate,'���ֽ�');
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(15,'yeon.jpg', '���', '3������', '��� ���ֽ� ���̵�', '02-1234-5678', '1', '�ν�Ÿ�׷�','Fish',1, sysdate,'���ֽ�');                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(16,'chick2.jpg', '�ߵ���', '10������', '���� ������ ������� 11 ', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate,'������' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(17,'chang.jpg', '���ư��', '10������', '���� ������ ������� 4', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate,'������' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(18,'chang3.jpg', '�������', '10������', '���� ������ ������� 21', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meat',1, sysdate,'������' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(19,'ok.jpg', '�ѿ��н�', '10������', '��� ���ֽ� ���̵�', '02-1234-5678', '1', '�ν�Ÿ�׷�','Meal',1, sysdate,'���ֽ�' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(20,'C1.jpg', '��Ÿ����', '10������', '��õ�� ��籸 ���絿', '02-1234-5678', '1', '�ν�Ÿ�׷�','COFFEE',1, sysdate,'��籸' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(21,'C2.jpg', 'ī�亣��', '10������', '��õ�� ��籸 ���絿', '02-1234-5678', '1', '�ν�Ÿ�׷�','COFFEE',1, sysdate,'��籸' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(22,'C3.jpg', '�轺', '10������', '��õ�� ��籸 ���絿', '02-1234-5678', '1', '�ν�Ÿ�׷�','COFFEE',1, sysdate,'��籸' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(23,'C4.jpg', '����ٹ�', '10������', '��õ�� ��籸 ���絿', '02-1234-5678', '1', '�ν�Ÿ�׷�','COFFEE',1, sysdate,'��籸' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(24,'C5.jpg', '����', '10������', '��õ�� ��籸 ���絿', '02-1234-5678', '1', '�ν�Ÿ�׷�','COFFEE',1, sysdate,'��籸' );


-- insert: review_info
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0001', 5, '�׽�Ʈ ����1', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 4, '�׽�Ʈ ����2', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0003', 3, '�׽�Ʈ ����3', 3, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0004', 2, '�׽�Ʈ ����4', 4, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0001', 1, '�׽�Ʈ ����5', 5, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 2, '�׽�Ʈ ����6', 6, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0003', 3, '�׽�Ʈ ����7', 7, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0004', 4, '�׽�Ʈ ����8', 8, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0005', 5, '�׽�Ʈ ����9', 9, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0006', 5, '�׽�Ʈ ����10', 10, sysdate);   



-- insert: reviewimg_info
insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'han.jpg', 1,'main_image', 1);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'kang.jpg', 2,'main_image', 2);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'kill.jpg', 3,'main_image', 3);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO,fileType, rest_NO)
values (reviewimg_seq.nextval, 'lee.jpg',4,'main_image', 4);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'sam.jpg',5,'main_image', 5);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'hwa.jpg',6,'main_image', 6);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'hwakill.jpg',7,'main_image', 7);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'da.jpg', 8,'main_image', 8);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'ryu.jpg', 9,'main_image', 9);
 
insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'inn.jpg', 10,'main_image', 10);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, '3ch.jpg', 11,'main_image',11);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'cham.jpg', 12,'main_image', 12);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'cham2.jpg', 13,'main_image', 13);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'cham3.jpg', 14,'main_image', 14);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'yeon.jpg', 15,'main_image', 15);


-- commit
commit;


-- !! ����Ʈ !!
SELECT * FROM user_info;
SELECT * FROM restaurant_info;
SELECT * FROM likerest_info;
SELECT * FROM review_info;
SELECT * FROM reviewimg_info;
SELECT * FROM tag_info;
SELECT * FROM rest_tag;

select * from review_img;
select * from  review_content_img;
select * from profile_review;
-- !! ����Ʈ !!


--!! ����Դϴ� !!
DROP TABLE rest_tag;
DROP TABLE tag_info;
DROP TABLE reviewimg_info;
DROP TABLE review_info;
DROP TABLE likerest_info;
DROP TABLE restaurant_info;
DROP TABLE user_info;
-- !!����Դϴ� !!
drop sequence reviewIMG_seq;
drop sequence like_seq;
drop sequence review_seq;
drop sequence tag_seq;
-- !!����Դϴ� !!
drop view review_img;
drop view review_content_img;
drop view profile_review;
-- !! ����Դϴ� !!
