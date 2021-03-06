-- Alter the category
ALTER TABLE [Category]
	Add [Colour] nvarchar(50) NULL, [Image] nvarchar(200) NULL
GO

-- Update the Permission table
ALTER TABLE [Permission]
	Add [IsGlobal] bit NULL
GO

-- Set all the isglobals to false
UPDATE [Permission]
SET [IsGlobal] = 0
GO

-- Make sure is global is set to NOT NULL
ALTER TABLE [Permission]
	ALTER COLUMN [IsGlobal] bit NOT NULL
GO

-- Add the new global permission Edit Members
INSERT INTO [Permission] (Id, Name, IsGlobal)
VALUES (NEWID(),'Edit Members', 1);
GO

-- Alter the post content field
ALTER TABLE [Post] 
	ALTER COLUMN [PostContent] [nvarchar](max) NOT NULL
GO

-- Create the new favourite table
CREATE TABLE [dbo].[Favourite](
	[Id] [uniqueidentifier] NOT NULL,
	[MemberId] [uniqueidentifier] NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[TopicId] [uniqueidentifier] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Favourite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO

-- Create the global permission for role table
CREATE TABLE [dbo].[GlobalPermissionForRole](
	[Id] [uniqueidentifier] NOT NULL,
	[Permission_Id] [uniqueidentifier] NOT NULL,
	[MembershipRole_Id] [uniqueidentifier] NOT NULL,
	[IsTicked] [bit] NOT NULL,
 CONSTRAINT [PK_GlobalPermissionForRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO