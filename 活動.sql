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

	[content] [nvarchar](max) ,
	
	[start_time] [datetime] ,
	[end_time] [datetime] ,
	/*人數*/
	[participant_limit][int] ,
	[Location_Longitude][int],
	[Location_Latitude][int],


	[status_code][int] DEFAULT 0 NOT NULL,
)
/*
insert acticities ([user_id],[title],[preview_image],[content],[start_time],[end_time] [datetime] ,) values()
*/
CREATE TABLE [dbo].[activity_attendees](
/*45646*/
	[activity_id] [int] Foreign key references acticities(id) NOT NULL,
	[user_id] [int] Foreign key references member(user_id) NOT NULL ,
	[status_code] [int] DEFAULT 0 NOT NULL,
	[request_time] [datetime] DEFAULT GETDATE() NOT NULL
	Primary key([activity_id],[user_id])
)

CREATE TABLE [dbo].[activity_review](
	[id] [int] IDENTITY(100000,1) Primary key,
	[activity_id] [int] Foreign key references acticities(id) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[status_code] [int] DEFAULT 0 NOT NULL,
	[request_time] [datetime] DEFAULT GETDATE() NOT NULL
)

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

