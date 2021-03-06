USE [Football]
GO
/****** Object:  Table [dbo].[Competition]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competition](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CompetitionTypeID] [int] NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Competition_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Competition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompetitionType]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_CompetitionType_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_CompetitionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fixture]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fixture](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MatchTime] [datetime] NOT NULL,
	[HomeTeamGoals] [int] NOT NULL,
	[AwayTeamGoals] [int] NOT NULL,
	[CompetitionID] [int] NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Fixture_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Fixture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Player]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](15) NOT NULL,
	[Surname] [nvarchar](25) NOT NULL,
	[DOB] [date] NOT NULL,
	[ShirtNumber] [int] NOT NULL,
	[FavouredFoot] [nvarchar](5) NULL,
	[PositionID] [int] NULL,
	[RosterID] [int] NULL,
	[SetPieceID] [int] NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Player_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayerFixture]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerFixture](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NULL,
	[FixtureID] [int] NULL,
	[StartingEleven] [bit] NOT NULL CONSTRAINT [DF_PlayerFixture_StartingEleven]  DEFAULT ((1)),
	[Substitute] [bit] NOT NULL CONSTRAINT [DF_PlayerFixture_Substitute]  DEFAULT ((0)),
 CONSTRAINT [PK_PlayerFixture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Position]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](15) NOT NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Position_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roster]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Manager] [nvarchar](25) NOT NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Roster_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Roster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SetPiece]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetPiece](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Piece] [nvarchar](50) NOT NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_SetPiece_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_SetPiece] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Team]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[RosterID] [int] NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Team_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeamCompetition]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamCompetition](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[Draws] [int] NOT NULL,
	[TeamID] [int] NULL,
	[CompetitionID] [int] NULL,
 CONSTRAINT [PK_TeamCompetition] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeamFixture]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamFixture](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FixtureID] [int] NULL,
	[HomeTeamID] [int] NULL,
	[AwayTeamID] [int] NULL,
	[WinningTeamID] [int] NULL,
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_TeamFixture_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_TeamFixture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Competition] ON 

INSERT [dbo].[Competition] ([ID], [Name], [CompetitionTypeID], [Deleted]) VALUES (1, N'FA', 1, 0)
INSERT [dbo].[Competition] ([ID], [Name], [CompetitionTypeID], [Deleted]) VALUES (2, N'World', 1, 0)
INSERT [dbo].[Competition] ([ID], [Name], [CompetitionTypeID], [Deleted]) VALUES (3, N'European', 1, 0)
INSERT [dbo].[Competition] ([ID], [Name], [CompetitionTypeID], [Deleted]) VALUES (4, N'Champions', 2, 0)
INSERT [dbo].[Competition] ([ID], [Name], [CompetitionTypeID], [Deleted]) VALUES (5, N'Premier', 2, 0)
SET IDENTITY_INSERT [dbo].[Competition] OFF
SET IDENTITY_INSERT [dbo].[CompetitionType] ON 

INSERT [dbo].[CompetitionType] ([ID], [Type], [Deleted]) VALUES (1, N'Cup', 0)
INSERT [dbo].[CompetitionType] ([ID], [Type], [Deleted]) VALUES (2, N'League', 0)
SET IDENTITY_INSERT [dbo].[CompetitionType] OFF
SET IDENTITY_INSERT [dbo].[Fixture] ON 

INSERT [dbo].[Fixture] ([ID], [MatchTime], [HomeTeamGoals], [AwayTeamGoals], [CompetitionID], [Deleted]) VALUES (1, CAST(N'2017-01-08 10:00:00.000' AS DateTime), 2, 4, 1, 0)
INSERT [dbo].[Fixture] ([ID], [MatchTime], [HomeTeamGoals], [AwayTeamGoals], [CompetitionID], [Deleted]) VALUES (2, CAST(N'2017-01-02 00:00:00.000' AS DateTime), 1, 2, 1, 0)
SET IDENTITY_INSERT [dbo].[Fixture] OFF
SET IDENTITY_INSERT [dbo].[Player] ON 

INSERT [dbo].[Player] ([ID], [Firstname], [Surname], [DOB], [ShirtNumber], [FavouredFoot], [PositionID], [RosterID], [SetPieceID], [Deleted]) VALUES (1, N'Dan', N'Bell', CAST(N'1994-05-02' AS Date), 11, N'Right', 1, 2, 1, 0)
INSERT [dbo].[Player] ([ID], [Firstname], [Surname], [DOB], [ShirtNumber], [FavouredFoot], [PositionID], [RosterID], [SetPieceID], [Deleted]) VALUES (2, N'Liam', N'Pemberton', CAST(N'1996-04-03' AS Date), 4, N'Right', 3, 1, 2, 0)
INSERT [dbo].[Player] ([ID], [Firstname], [Surname], [DOB], [ShirtNumber], [FavouredFoot], [PositionID], [RosterID], [SetPieceID], [Deleted]) VALUES (4, N'Jack', N'Wilkinson', CAST(N'1995-05-01' AS Date), 6, N'Right', 2, 4, 3, 0)
INSERT [dbo].[Player] ([ID], [Firstname], [Surname], [DOB], [ShirtNumber], [FavouredFoot], [PositionID], [RosterID], [SetPieceID], [Deleted]) VALUES (5, N'Adam', N'Pemberton', CAST(N'1994-02-12' AS Date), 7, N'Right', 4, 1, 3, 0)
SET IDENTITY_INSERT [dbo].[Player] OFF
SET IDENTITY_INSERT [dbo].[PlayerFixture] ON 

INSERT [dbo].[PlayerFixture] ([ID], [PlayerID], [FixtureID], [StartingEleven], [Substitute]) VALUES (1, 2, 1, 1, 0)
INSERT [dbo].[PlayerFixture] ([ID], [PlayerID], [FixtureID], [StartingEleven], [Substitute]) VALUES (2, 5, 1, 1, 1)
INSERT [dbo].[PlayerFixture] ([ID], [PlayerID], [FixtureID], [StartingEleven], [Substitute]) VALUES (3, 1, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[PlayerFixture] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([ID], [Type], [Deleted]) VALUES (1, N'Goalkeeper', 0)
INSERT [dbo].[Position] ([ID], [Type], [Deleted]) VALUES (2, N'Defender', 0)
INSERT [dbo].[Position] ([ID], [Type], [Deleted]) VALUES (3, N'Midfielder', 0)
INSERT [dbo].[Position] ([ID], [Type], [Deleted]) VALUES (4, N'Foward', 0)
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[Roster] ON 

INSERT [dbo].[Roster] ([ID], [Manager], [Deleted]) VALUES (1, N'Aitor Karanka', 0)
INSERT [dbo].[Roster] ([ID], [Manager], [Deleted]) VALUES (2, N'Antonio Conte', 0)
INSERT [dbo].[Roster] ([ID], [Manager], [Deleted]) VALUES (3, N'José Mourinho', 0)
INSERT [dbo].[Roster] ([ID], [Manager], [Deleted]) VALUES (4, N'Pep Guardiola', 0)
INSERT [dbo].[Roster] ([ID], [Manager], [Deleted]) VALUES (5, N'Jürgen Klopp', 0)
SET IDENTITY_INSERT [dbo].[Roster] OFF
SET IDENTITY_INSERT [dbo].[SetPiece] ON 

INSERT [dbo].[SetPiece] ([ID], [Piece], [Deleted]) VALUES (1, N'Corner', 0)
INSERT [dbo].[SetPiece] ([ID], [Piece], [Deleted]) VALUES (2, N'Free Kick', 0)
INSERT [dbo].[SetPiece] ([ID], [Piece], [Deleted]) VALUES (3, N'Throw-In', 0)
INSERT [dbo].[SetPiece] ([ID], [Piece], [Deleted]) VALUES (4, N'Penalty', 0)
INSERT [dbo].[SetPiece] ([ID], [Piece], [Deleted]) VALUES (5, N'Goal Kick', 0)
SET IDENTITY_INSERT [dbo].[SetPiece] OFF
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([ID], [Name], [RosterID], [Deleted]) VALUES (1, N'Middlesbrough', 1, 0)
INSERT [dbo].[Team] ([ID], [Name], [RosterID], [Deleted]) VALUES (2, N'Chelsea', 2, 0)
INSERT [dbo].[Team] ([ID], [Name], [RosterID], [Deleted]) VALUES (3, N'Manchester United', 3, 0)
INSERT [dbo].[Team] ([ID], [Name], [RosterID], [Deleted]) VALUES (4, N'Manchester City', 4, 0)
INSERT [dbo].[Team] ([ID], [Name], [RosterID], [Deleted]) VALUES (5, N'Liverpool', 5, 0)
SET IDENTITY_INSERT [dbo].[Team] OFF
SET IDENTITY_INSERT [dbo].[TeamFixture] ON 

INSERT [dbo].[TeamFixture] ([ID], [FixtureID], [HomeTeamID], [AwayTeamID], [WinningTeamID], [Deleted]) VALUES (1, 1, 1, 2, 2, 0)
INSERT [dbo].[TeamFixture] ([ID], [FixtureID], [HomeTeamID], [AwayTeamID], [WinningTeamID], [Deleted]) VALUES (2, 2, 3, 4, 4, 0)
SET IDENTITY_INSERT [dbo].[TeamFixture] OFF
ALTER TABLE [dbo].[Competition]  WITH CHECK ADD  CONSTRAINT [FK_Competition_CompetitionType] FOREIGN KEY([CompetitionTypeID])
REFERENCES [dbo].[CompetitionType] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Competition] CHECK CONSTRAINT [FK_Competition_CompetitionType]
GO
ALTER TABLE [dbo].[Fixture]  WITH CHECK ADD  CONSTRAINT [FK_Fixture_Competition] FOREIGN KEY([CompetitionID])
REFERENCES [dbo].[Competition] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Fixture] CHECK CONSTRAINT [FK_Fixture_Competition]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Position]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Roster] FOREIGN KEY([RosterID])
REFERENCES [dbo].[Roster] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Roster]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_SetPiece] FOREIGN KEY([SetPieceID])
REFERENCES [dbo].[SetPiece] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_SetPiece]
GO
ALTER TABLE [dbo].[PlayerFixture]  WITH CHECK ADD  CONSTRAINT [FK_PlayerFixture_Fixture] FOREIGN KEY([FixtureID])
REFERENCES [dbo].[Fixture] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerFixture] CHECK CONSTRAINT [FK_PlayerFixture_Fixture]
GO
ALTER TABLE [dbo].[PlayerFixture]  WITH CHECK ADD  CONSTRAINT [FK_PlayerFixture_Player] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Player] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerFixture] CHECK CONSTRAINT [FK_PlayerFixture_Player]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Roster] FOREIGN KEY([RosterID])
REFERENCES [dbo].[Roster] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Roster]
GO
ALTER TABLE [dbo].[TeamCompetition]  WITH CHECK ADD  CONSTRAINT [FK_TeamCompetition_Competition] FOREIGN KEY([CompetitionID])
REFERENCES [dbo].[Competition] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamCompetition] CHECK CONSTRAINT [FK_TeamCompetition_Competition]
GO
ALTER TABLE [dbo].[TeamCompetition]  WITH CHECK ADD  CONSTRAINT [FK_TeamCompetition_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamCompetition] CHECK CONSTRAINT [FK_TeamCompetition_Team]
GO
ALTER TABLE [dbo].[TeamFixture]  WITH CHECK ADD  CONSTRAINT [FK_TeamFixture_AwayTeam] FOREIGN KEY([AwayTeamID])
REFERENCES [dbo].[Team] ([ID])
GO
ALTER TABLE [dbo].[TeamFixture] CHECK CONSTRAINT [FK_TeamFixture_AwayTeam]
GO
ALTER TABLE [dbo].[TeamFixture]  WITH CHECK ADD  CONSTRAINT [FK_TeamFixture_Fixture] FOREIGN KEY([FixtureID])
REFERENCES [dbo].[Fixture] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamFixture] CHECK CONSTRAINT [FK_TeamFixture_Fixture]
GO
ALTER TABLE [dbo].[TeamFixture]  WITH CHECK ADD  CONSTRAINT [FK_TeamFixture_HomeTeam] FOREIGN KEY([HomeTeamID])
REFERENCES [dbo].[Team] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamFixture] CHECK CONSTRAINT [FK_TeamFixture_HomeTeam]
GO
/****** Object:  StoredProcedure [dbo].[Fixture_Get]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jack Wilkinson
-- Create date: 08-Jan-2017
-- =============================================
CREATE PROCEDURE [dbo].[Fixture_Get] 
	@FixtureID	INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

	SELECT	F.MatchTime [Kick-Off],
			TH.Name [Home Team],
			F.HomeTeamGoals [Home Goals],
			TA.Name [Away Team],
			F.AwayTeamGoals [Away Goals],
			W.Name [Winner]
		FROM TeamFixture TF
		INNER JOIN Team TH
		ON TH.ID = TF.HomeTeamID
		INNER JOIN Team TA
		ON TA.ID = TF.AwayTeamID
		INNER JOIN Fixture F
		ON F.ID = TF.FixtureID
		INNER JOIN Team W
		ON W.ID = TF.WinningTeamID
		WHERE (
			(
				TF.FixtureID = @FixtureID
				OR (
					@FixtureID IS NULL
				)
			)
		)
END

GO
/****** Object:  StoredProcedure [dbo].[Fixture_GetPlayersForFixture]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jack Wilkinson
-- Create date: 08-Jan-2017
-- =============================================
CREATE PROCEDURE [dbo].[Fixture_GetPlayersForFixture]
	@FixtureID INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

    SELECT	P.Firstname + ' ' + P.Surname [Name],
			P.ShirtNumber [Shirt Number],
			PO.[Type] [Position],
			SP.Piece [Set Piece],
			T.Name [Team]
		FROM PlayerFixture PF
		INNER JOIN Player P
		ON P.ID = PF.PlayerID
		INNER JOIN Position PO
		ON PO.ID = P.PositionID
		INNER JOIN SetPiece SP
		ON SP.ID = P.SetPieceID
		INNER JOIN Roster R
		ON R.ID = P.RosterID
		INNER JOIN Team T
		ON T.RosterID = R.ID
		WHERE (
			(
				PF.FixtureID = @FixtureID
				OR (
					@FixtureID IS NULL
				)
			)
			AND (
				P.Deleted = 0
			)
			AND (
				PF.StartingEleven = 1
			)
			AND (
				PF.Substitute = 0
			)
		)
		ORDER BY T.Name
END

GO
/****** Object:  StoredProcedure [dbo].[Player_Delete]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jack Wilkinson
-- Create date: 08-Jan-2017
-- =============================================
CREATE PROCEDURE [dbo].[Player_Delete]
	
	@PlayerID	INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

    UPDATE dbo.Player
		SET Deleted = 1
		WHERE (
			ID = @PlayerID
		)
END

GO
/****** Object:  StoredProcedure [dbo].[Player_Get]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jack Wilkinson
-- Create date: 08-Jan-2017
-- =============================================
CREATE PROCEDURE [dbo].[Player_Get]
	@TeamID INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

	SELECT	PL.Firstname + ' ' + PL.Surname [Name],
			PL.ShirtNumber [Shirt Number],
			PL.FavouredFoot [Favoured Foot],
			P.[Type] [Position],
			ISNULL(S.Piece, 'Not Chosen') [Set Piece],
			T.Name [Team],
			CASE
				WHEN PL.Playing = 1
				THEN 'Yes'
				ELSE 'No'
			END [Currently on-Team]
		FROM Player PL
		INNER JOIN Position P
		ON P.ID = PL.PositionID
		INNER JOIN SetPiece S
		ON S.ID = PL.SetPieceID
		INNER JOIN Roster R
		ON R.ID = PL.RosterID
		INNER JOIN Team T
		ON T.RosterID = R.ID
		WHERE (
			(
				T.ID = @TeamID
				OR (
					@TeamID IS NULL
				)
			)
			AND (
				PL.Deleted = 0
			)
		)
END

GO
/****** Object:  StoredProcedure [dbo].[Player_Merge]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jack Wilkinson
-- Create date: 08-Jan-2017
-- =============================================
CREATE PROCEDURE [dbo].[Player_Merge]

	@PlayerID		INT = NULL,
	@Firstname		NVARCHAR(15) = NULL,
	@Surname		NVARCHAR(25) = NULL,
	@DOB			DATE = NULL,
	@ShirtNumber	INT = NULL,
	@FavouredFoot	NVARCHAR(5) = NULL,
	@PositionID		INT = NULL,
	@RosterID		INT = NULL,
	@SetPieceID		INT = NULL,
	@Deleted		BIT	= NULL

AS
BEGIN

	SET NOCOUNT ON;

	IF (
		@PlayerID IS NOT NULL
	)
	BEGIN
		DECLARE @PlayerRecord TABLE (
			Firstname		NVARCHAR(15),
			Surname			NVARCHAR(25),
			DOB				DATE,
			ShirtNumber		INT,
			FavouredFoot	NVARCHAR(5),
			PositionID		INT,
			RosterID		INT,
			SetPieceID		INT,
			Deleted			BIT
		)

		INSERT INTO @PlayerRecord
		SELECT	Firstname,
				Surname,
				DOB,
				ShirtNumber,
				FavouredFoot,
				PositionID,
				RosterID,
				SetPieceID,
				Deleted
			FROM Player
			WHERE (
				ID = @PlayerID
			)
		
		IF (
			@Firstname IS NULL
		)
		BEGIN
			SELECT @Firstname = Firstname
				FROM @PlayerRecord
		END

		IF (
			@Surname IS NULL
		)
		BEGIN
			SELECT @Surname = Surname
				FROM @PlayerRecord
		END

		IF (
			@DOB IS NULL
		)
		BEGIN
			SELECT @DOB = DOB
				FROM @PlayerRecord
		END

		IF (
			@ShirtNumber IS NULL
		)
		BEGIN
			SELECT @ShirtNumber = ShirtNumber
				FROM @PlayerRecord
		END

		IF (
			@FavouredFoot IS NULL
		)
		BEGIN
			SELECT @FavouredFoot = FavouredFoot
				FROM @PlayerRecord
		END

		IF (
			@PositionID IS NULL
		)
		BEGIN
			SELECT @PositionID = PositionID
				FROM @PlayerRecord
		END

		IF (
			@RosterID IS NULL
		)
		BEGIN
			SELECT @RosterID = RosterID
				FROM @PlayerRecord
		END

		IF (
			@SetPieceID IS NULL
		)
		BEGIN
			SELECT @SetPieceID = SetPieceID
				FROM @PlayerRecord
		END

		IF (
			@Deleted IS NULL
		)
		BEGIN
			SELECT @Deleted = Deleted
				FROM @PlayerRecord
		END
	END

	MERGE dbo.Player P
	USING (VALUES (
		@PlayerID,
		@Firstname,
		@Surname,
		@DOB,
		@ShirtNumber,
		@FavouredFoot,
		@PositionID,
		@RosterID,
		@SetPieceID,
		@Deleted
	) ) AS S (
		ID,
		Firstname,
		Surname,
		DOB,
		ShirtNumber,
		FavouredFoot,
		PositionID,
		RosterID,
		SetPieceID,
		Deleted
	) ON (
		P.ID = S.ID
	)
	WHEN MATCHED AND (
		P.Firstname <> S.Firstname
		OR P.Surname <> S.Surname
		OR P.DOB <> S.DOB
		OR P.ShirtNumber <> S.ShirtNumber
		OR P.FavouredFoot <> S.FavouredFoot
		OR P.PositionID <> S.PositionID
		OR P.RosterID <> S.RosterID
		OR P.SetPieceID <> S.SetPieceID
		OR P.Deleted <> S.Deleted
	) THEN UPDATE
			SET P.Firstname = S.Firstname,
				P.Surname = S.Surname,
				P.DOB = S.DOB,
				P.ShirtNumber = S.ShirtNumber,
				P.FavouredFoot = S.FavouredFoot,				
				P.PositionID = S.PositionID,
				P.RosterID = S.RosterID,
				P.SetPieceID = S.SetPieceID,
				P.Deleted = S.Deleted

	WHEN NOT MATCHED
		THEN INSERT (
			Firstname,
			Surname,
			DOB,
			ShirtNumber,
			FavouredFoot,
			PositionID,
			RosterID,
			SetPieceID
		)
		VALUES (
			Firstname,
			Surname,
			DOB,
			ShirtNumber,
			FavouredFoot,
			PositionID,
			RosterID,
			SetPieceID
		);


END

GO
/****** Object:  StoredProcedure [dbo].[Team_Delete]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jack Wilkinson
-- Create date: 08-Jan-2017
-- =============================================
CREATE PROCEDURE [dbo].[Team_Delete]
	@TeamID	INT
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE dbo.Team
		SET Deleted = 1
		WHERE (
			ID = @TeamID
		)
END

GO
/****** Object:  StoredProcedure [dbo].[Team_Get]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jack Wilkinson
-- Create date: 08-Jan-2017
-- =============================================
CREATE PROCEDURE [dbo].[Team_Get]
	
	@TeamID	INT = NULL
AS
BEGIN

	SET NOCOUNT ON;

    SELECT	T.Name,
			R.Manager
		FROM Team T
		INNER JOIN Roster R
		ON R.ID = T.RosterID
		WHERE (
			(
				T.ID = @TeamID
				OR (
					@TeamID IS NULL
				)
			)
			AND (
			T.Deleted = 0
			)
		)
END

GO
/****** Object:  StoredProcedure [dbo].[Team_Merge]    Script Date: 08/01/2017 21:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jack Wilkinson
-- Create date: 07-Jan-2017
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Team_Merge]
	@TeamID		INT = NULL,
	@Name		VARCHAR(50) = NULL,
	@Deleted	BIT = NULL

AS
BEGIN

	SET NOCOUNT ON;

	IF (
		@TeamID IS NOT NULL
	)
	BEGIN
		DECLARE @TeamRecord TABLE (
			Name		NVARCHAR(MAX),
			Deleted		BIT
		)

		INSERT INTO @TeamRecord
		SELECT	Name,
				Deleted
			FROM Team
			WHERE (
				ID = @TeamID
			)

		IF (
			@Name IS NULL
		)
		BEGIN
			SELECT @Name = Name
				FROM @TeamRecord
		END

		IF (
			@Deleted IS NULL
		)
		BEGIN
			SELECT @Deleted = Deleted
				FROM @TeamRecord
		END
	END
	
	MERGE dbo.Team T
	USING (VALUES (
		@TeamID,
		@Name,
		@Deleted
	) ) AS S (
		ID,
		Name,
		Deleted
	)
	ON (
		T.ID = S.ID
	)
	WHEN MATCHED AND (	T.Name <> S.Name 
						OR T.Deleted <> S.Deleted
	) THEN UPDATE
			SET T.Name = S.Name,
				T.Deleted = S.Deleted

	WHEN NOT MATCHED
		THEN INSERT (
			Name
		)
		VALUES (
			Name
		);

END



GO
