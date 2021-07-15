CREATE TABLE [dbo].[CaseLog]
(
	[Id] INT NOT NULL PRIMARY KEY Identity(1,1),
	[CaseId] int not null,
	[DocumentUploadUrl] nvarchar(max),
	[ImageUploadUrl] nvarchar(max),
	[AppointmentId] int,
	[CreatedBy] nvarchar(max),
	[CreatedAt] datetime,
	[UpdatedBy] nvarchar(max),
	[UpdatedAt] datetime,
	[Date] datetime, 
    CONSTRAINT [FK_CaseLog_Case] FOREIGN KEY ([CaseId]) REFERENCES [dbo].[Case]([Id]), 
    CONSTRAINT [FK_CaseLog_Appointment] FOREIGN KEY ([AppointmentId]) REFERENCES [dbo].[Appointment]([Id]),
)
