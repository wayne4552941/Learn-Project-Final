USE [ProjectTwo]
drop table activity_review;
drop table activity_notification;
drop table activity_attendees
drop table acticities;

GO
CREATE TABLE [dbo].[acticities](
/*45646*/
	[id] [int] IDENTITY(100000,1) Primary key,
	[user_id] [int] Foreign key references member(user_id) NOT NULL,  

	[title] [nvarchar](max) NOT NULL,
	[preview_image] [nvarchar](max),
	[activity_image] [nvarchar](max),
	[content] [nvarchar](max) ,
	
	[start_time] [datetime] ,
	[end_time] [datetime] ,
	/*人數*/
	[number_limit][int] ,
	[place][nvarchar](max),
	[address][nvarchar](max),



	[status_code][int] DEFAULT 0 NOT NULL,
)
/*
insert acticities ([user_id],[title],[preview_image],[content],[start_time],[end_time] [datetime] ,) values()
*/
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20');
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試2',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20')
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試3',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20')
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試4',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20');
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試5',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20')
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試6',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20')
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試7',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20');
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試8',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20')
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit]) 
values('2',N'標題測試9',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20')
insert acticities ([user_id],[title],[content],[start_time],[end_time] ,[number_limit] ,[status_code]) 
values('2',N'標題測試9',N'測試內文測試內文測試內文測試內文測試內文測試內文','2022/09/30 09:00:00','2022/09/30 09:00:00','20','3')

select * from acticities

CREATE TABLE [dbo].[activity_attendees](
/*45646*/
	[activity_id] [int] Foreign key references acticities(id) NOT NULL,
	[user_id] [int] Foreign key references member(user_id) NOT NULL ,
	[status_code] [int] DEFAULT 0 NOT NULL,
	[request_time] [datetime] DEFAULT GETDATE() NOT NULL
	Primary key([activity_id],[user_id])
)
insert [activity_attendees]([activity_id],[user_id]) values(100002,1)
insert [activity_attendees]([activity_id],[user_id],[status_code]) values(100003,1,2)

CREATE TABLE [dbo].[activity_review](
	[id] [int] IDENTITY(100000,1) Primary key,
	[activity_id] [int] Foreign key references acticities(id) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[status_code] [int] DEFAULT 0 NOT NULL,
	[request_time] [datetime] DEFAULT GETDATE() NOT NULL
)

insert [activity_review]([activity_id],[message],[status_code]) values(100003,'test',0);


select * from activity_review
select * from activity_review where [id] in
(select  max(id) as id from [activity_review] as a  group by [activity_id]) and [status_code]=0


CREATE TABLE [dbo].[activity_notification](
/*45646*/
	[id] [int] IDENTITY(100000,1) Primary key,
	[activity_id] [int] Foreign key references acticities(id) NOT NULL,
	[user_id] [int] Foreign key references member(user_id) NOT NULL, 
	[email] [nvarchar](max) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[state][int]NOT NULL,
	[delivery_time] [datetime]  
)

