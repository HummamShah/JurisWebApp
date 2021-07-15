CREATE TABLE [dbo].[Appointment]
(
	[Id] INT NOT NULL PRIMARY KEY Identity(1,1),
	[CaseId] int not null,
	[UserProfileId] int,
	[LawyerId] int,
	[Description] nvarchar(max),
	[ScheduleDate] datetime,
	[Status] bit not null default(0),
	[RescheduleDate] datetime,
	[CreatedBy] nvarchar(max),
	[CreatedAt] datetime,
	[UpdateAt] datetime,
	[UpdatedBy] nvarchar(max),
	[Date] datetime, 
    CONSTRAINT [FK_Appointment_Case] FOREIGN KEY ([CaseId]) REFERENCES [dbo].[Case]([Id]),
)
