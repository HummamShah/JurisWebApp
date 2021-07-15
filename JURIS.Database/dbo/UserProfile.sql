CREATE TABLE [dbo].[UserProfile]
(
	[Id] INT NOT NULL PRIMARY KEY Identity(1,1),
	[FullName] nvarchar(max),
	[CNIC] nvarchar(max),
	[Email] nvarchar(max),
	[Contact] nvarchar(max),
	[Address] nvarchar(max),
	[Password] nvarchar(max),
	[ProfileImageUrl] nvarchar(max),
	[IsNotified] bit not null default(0),
	[Qualification] nvarchar(max),
	[Category] nvarchar(max),
	[City] nvarchar(max),
	[TimeSlot] nvarchar(max),
	[Type] int not null default(0),
	[CreatedAt] datetime,
	[Date] datetime,
)
