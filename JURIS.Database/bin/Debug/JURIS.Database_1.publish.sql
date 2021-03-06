/*
Deployment script for JURIS-APP

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "JURIS-APP"
:setvar DefaultFilePrefix "JURIS-APP"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating Table [dbo].[Appointment]...';


GO
CREATE TABLE [dbo].[Appointment] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [CaseId]         INT            NOT NULL,
    [UserProfileId]  INT            NULL,
    [LawyerId]       INT            NULL,
    [Description]    NVARCHAR (MAX) NULL,
    [ScheduleDate]   DATETIME       NULL,
    [Status]         BIT            NOT NULL,
    [RescheduleDate] DATETIME       NULL,
    [CreatedBy]      NVARCHAR (MAX) NULL,
    [CreatedAt]      DATETIME       NULL,
    [UpdateAt]       DATETIME       NULL,
    [UpdatedBy]      NVARCHAR (MAX) NULL,
    [Date]           DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[Case]...';


GO
CREATE TABLE [dbo].[Case] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [UserProfileId]   INT            NOT NULL,
    [LawyerProfileId] INT            NULL,
    [Status]          INT            NOT NULL,
    [OpenedAt]        DATETIME       NULL,
    [ClosedAt]        DATETIME       NULL,
    [Detail]          NVARCHAR (MAX) NULL,
    [Category]        NVARCHAR (MAX) NULL,
    [CreatedBy]       NVARCHAR (MAX) NULL,
    [CreatedAt]       DATETIME       NULL,
    [Date]            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[CaseLog]...';


GO
CREATE TABLE [dbo].[CaseLog] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [CaseId]            INT            NOT NULL,
    [DocumentUploadUrl] NVARCHAR (MAX) NULL,
    [ImageUploadUrl]    NVARCHAR (MAX) NULL,
    [AppointmentId]     INT            NULL,
    [CreatedBy]         NVARCHAR (MAX) NULL,
    [CreatedAt]         DATETIME       NULL,
    [UpdatedBy]         NVARCHAR (MAX) NULL,
    [UpdatedAt]         DATETIME       NULL,
    [Date]              DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[Chat]...';


GO
CREATE TABLE [dbo].[Chat] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [SenderUserId]      NVARCHAR (128) NULL,
    [Message]           NVARCHAR (MAX) NULL,
    [SenderName]        NVARCHAR (MAX) NULL,
    [SenderImageUrl]    NVARCHAR (MAX) NULL,
    [ReceipentImageUrl] NVARCHAR (MAX) NULL,
    [Link]              NVARCHAR (MAX) NULL,
    [IsLink]            BIT            NOT NULL,
    [ReceiverName]      NVARCHAR (MAX) NULL,
    [ReceipentUserId]   NVARCHAR (128) NULL,
    [IsRead]            BIT            NOT NULL,
    [CreatedBy]         NVARCHAR (MAX) NULL,
    [CreatedAt]         DATETIME       NULL,
    [UpdatedBy]         NVARCHAR (MAX) NULL,
    [UpdatedAt]         DATETIME       NULL,
    [Date]              DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[LawyerProfile]...';


GO
CREATE TABLE [dbo].[LawyerProfile] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [FullName]        NVARCHAR (MAX) NULL,
    [CNIC]            NVARCHAR (MAX) NULL,
    [Email]           NVARCHAR (MAX) NULL,
    [Contact]         NVARCHAR (MAX) NULL,
    [ProfileImageUrl] NVARCHAR (MAX) NULL,
    [Password]        NVARCHAR (MAX) NULL,
    [IsNotified]      BIT            NOT NULL,
    [Qualification]   NVARCHAR (MAX) NULL,
    [Category]        NVARCHAR (MAX) NULL,
    [City]            NVARCHAR (MAX) NULL,
    [TimeSlot]        NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Table [dbo].[UserProfile]...';


GO
CREATE TABLE [dbo].[UserProfile] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [FullName]        NVARCHAR (MAX) NULL,
    [CNIC]            NVARCHAR (MAX) NULL,
    [Email]           NVARCHAR (MAX) NULL,
    [Contact]         NVARCHAR (MAX) NULL,
    [Address]         NVARCHAR (MAX) NULL,
    [Password]        NVARCHAR (MAX) NULL,
    [ProfileImageUrl] NVARCHAR (MAX) NULL,
    [IsNotified]      BIT            NOT NULL,
    [Qualification]   NVARCHAR (MAX) NULL,
    [Category]        NVARCHAR (MAX) NULL,
    [City]            NVARCHAR (MAX) NULL,
    [TimeSlot]        NVARCHAR (MAX) NULL,
    [Type]            INT            NOT NULL,
    [CreatedAt]       DATETIME       NULL,
    [Date]            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Appointment]...';


GO
ALTER TABLE [dbo].[Appointment]
    ADD DEFAULT (0) FOR [Status];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Case]...';


GO
ALTER TABLE [dbo].[Case]
    ADD DEFAULT (0) FOR [Status];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Chat]...';


GO
ALTER TABLE [dbo].[Chat]
    ADD DEFAULT (0) FOR [IsLink];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Chat]...';


GO
ALTER TABLE [dbo].[Chat]
    ADD DEFAULT (0) FOR [IsRead];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[LawyerProfile]...';


GO
ALTER TABLE [dbo].[LawyerProfile]
    ADD DEFAULT (0) FOR [IsNotified];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserProfile]...';


GO
ALTER TABLE [dbo].[UserProfile]
    ADD DEFAULT (0) FOR [IsNotified];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[UserProfile]...';


GO
ALTER TABLE [dbo].[UserProfile]
    ADD DEFAULT (0) FOR [Type];


GO
PRINT N'Creating Foreign Key [dbo].[FK_Appointment_Case]...';


GO
ALTER TABLE [dbo].[Appointment] WITH NOCHECK
    ADD CONSTRAINT [FK_Appointment_Case] FOREIGN KEY ([CaseId]) REFERENCES [dbo].[Case] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Cases_UserProfile]...';


GO
ALTER TABLE [dbo].[Case] WITH NOCHECK
    ADD CONSTRAINT [FK_Cases_UserProfile] FOREIGN KEY ([UserProfileId]) REFERENCES [dbo].[UserProfile] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_CaseLog_Case]...';


GO
ALTER TABLE [dbo].[CaseLog] WITH NOCHECK
    ADD CONSTRAINT [FK_CaseLog_Case] FOREIGN KEY ([CaseId]) REFERENCES [dbo].[Case] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_CaseLog_Appointment]...';


GO
ALTER TABLE [dbo].[CaseLog] WITH NOCHECK
    ADD CONSTRAINT [FK_CaseLog_Appointment] FOREIGN KEY ([AppointmentId]) REFERENCES [dbo].[Appointment] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserMessage_Receiver]...';


GO
ALTER TABLE [dbo].[Chat] WITH NOCHECK
    ADD CONSTRAINT [FK_UserMessage_Receiver] FOREIGN KEY ([ReceipentUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_UserMessage_Sender]...';


GO
ALTER TABLE [dbo].[Chat] WITH NOCHECK
    ADD CONSTRAINT [FK_UserMessage_Sender] FOREIGN KEY ([SenderUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Appointment] WITH CHECK CHECK CONSTRAINT [FK_Appointment_Case];

ALTER TABLE [dbo].[Case] WITH CHECK CHECK CONSTRAINT [FK_Cases_UserProfile];

ALTER TABLE [dbo].[CaseLog] WITH CHECK CHECK CONSTRAINT [FK_CaseLog_Case];

ALTER TABLE [dbo].[CaseLog] WITH CHECK CHECK CONSTRAINT [FK_CaseLog_Appointment];

ALTER TABLE [dbo].[Chat] WITH CHECK CHECK CONSTRAINT [FK_UserMessage_Receiver];

ALTER TABLE [dbo].[Chat] WITH CHECK CHECK CONSTRAINT [FK_UserMessage_Sender];


GO
PRINT N'Update complete.';


GO
