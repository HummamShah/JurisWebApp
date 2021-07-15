CREATE TABLE [dbo].[Case]
(
	[Id] INT NOT NULL PRIMARY KEY Identity(1,1),
	[UserProfileId] int not null,
	[LawyerProfileId] int,
	[Status] int not null default(0),
	[OpenedAt] datetime,
	[ClosedAt] datetime,
	[Detail] nvarchar(max),
	[Category] nvarchar(max),
	[CreatedBy] nvarchar(max),
	[CreatedAt] datetime,
	[Date] datetime, 
    CONSTRAINT [FK_Cases_UserProfile] FOREIGN KEY ([UserProfileId]) REFERENCES [dbo].[UserProfile]([Id]), 
)
