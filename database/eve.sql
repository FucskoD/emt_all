/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [eve]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE DATABASE [eve]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ebs_DATADUMP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\eve.mdf' , SIZE = 296960KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ebs_DATADUMP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\eve_log.ldf' , SIZE = 4096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eve] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eve].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eve] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eve] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eve] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eve] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eve] SET ARITHABORT OFF 
GO
ALTER DATABASE [eve] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eve] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eve] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eve] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eve] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eve] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eve] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eve] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eve] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eve] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eve] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eve] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eve] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eve] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eve] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eve] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eve] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eve] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eve] SET  MULTI_USER 
GO
ALTER DATABASE [eve] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eve] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eve] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eve] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [eve] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eve] SET QUERY_STORE = OFF
GO
USE [eve]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [eve]
GO
/****** Object:  Table [dbo].[agtAgentTypes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agtAgentTypes](
	[agentTypeID] [int] NOT NULL,
	[agentType] [varchar](50) NULL,
 CONSTRAINT [agtAgentTypes_PK] PRIMARY KEY CLUSTERED 
(
	[agentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agtAgents]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agtAgents](
	[agentID] [int] NOT NULL,
	[divisionID] [tinyint] NULL,
	[corporationID] [int] NULL,
	[locationID] [int] NULL,
	[level] [tinyint] NULL,
	[quality] [smallint] NULL,
	[agentTypeID] [int] NULL,
	[isLocator] [bit] NULL,
 CONSTRAINT [agtAgents_PK] PRIMARY KEY CLUSTERED 
(
	[agentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agtResearchAgents]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agtResearchAgents](
	[agentID] [int] NOT NULL,
	[typeID] [int] NOT NULL,
 CONSTRAINT [agtResearchAgents_PK] PRIMARY KEY CLUSTERED 
(
	[agentID] ASC,
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrAncestries]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrAncestries](
	[ancestryID] [tinyint] NOT NULL,
	[ancestryName] [nvarchar](100) NULL,
	[bloodlineID] [tinyint] NULL,
	[description] [nvarchar](1000) NULL,
	[perception] [tinyint] NULL,
	[willpower] [tinyint] NULL,
	[charisma] [tinyint] NULL,
	[memory] [tinyint] NULL,
	[intelligence] [tinyint] NULL,
	[iconID] [int] NULL,
	[shortDescription] [nvarchar](500) NULL,
 CONSTRAINT [chrAncestries_PK] PRIMARY KEY CLUSTERED 
(
	[ancestryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrAttributes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrAttributes](
	[attributeID] [tinyint] NOT NULL,
	[attributeName] [varchar](100) NULL,
	[description] [varchar](1000) NULL,
	[iconID] [int] NULL,
	[shortDescription] [nvarchar](500) NULL,
	[notes] [nvarchar](500) NULL,
 CONSTRAINT [chrAttributes_PK] PRIMARY KEY CLUSTERED 
(
	[attributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrBloodlines]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrBloodlines](
	[bloodlineID] [tinyint] NOT NULL,
	[bloodlineName] [nvarchar](100) NULL,
	[raceID] [tinyint] NULL,
	[description] [nvarchar](1000) NULL,
	[maleDescription] [nvarchar](1000) NULL,
	[femaleDescription] [nvarchar](1000) NULL,
	[shipTypeID] [int] NULL,
	[corporationID] [int] NULL,
	[perception] [tinyint] NULL,
	[willpower] [tinyint] NULL,
	[charisma] [tinyint] NULL,
	[memory] [tinyint] NULL,
	[intelligence] [tinyint] NULL,
	[iconID] [int] NULL,
	[shortDescription] [nvarchar](500) NULL,
	[shortMaleDescription] [nvarchar](500) NULL,
	[shortFemaleDescription] [nvarchar](500) NULL,
 CONSTRAINT [chrBloodlines_PK] PRIMARY KEY CLUSTERED 
(
	[bloodlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrFactions]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrFactions](
	[factionID] [int] NOT NULL,
	[factionName] [varchar](100) NULL,
	[description] [varchar](1000) NULL,
	[raceIDs] [int] NULL,
	[solarSystemID] [int] NULL,
	[corporationID] [int] NULL,
	[sizeFactor] [float] NULL,
	[stationCount] [smallint] NULL,
	[stationSystemCount] [smallint] NULL,
	[militiaCorporationID] [int] NULL,
	[iconID] [int] NULL,
 CONSTRAINT [chrFactions_PK] PRIMARY KEY CLUSTERED 
(
	[factionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrRaces]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrRaces](
	[raceID] [tinyint] NOT NULL,
	[raceName] [varchar](100) NULL,
	[description] [varchar](1000) NULL,
	[iconID] [int] NULL,
	[shortDescription] [varchar](500) NULL,
 CONSTRAINT [chrRaces_PK] PRIMARY KEY CLUSTERED 
(
	[raceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crpActivities]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crpActivities](
	[activityID] [tinyint] NOT NULL,
	[activityName] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
 CONSTRAINT [crpActivities_PK] PRIMARY KEY CLUSTERED 
(
	[activityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crpNPCCorporationDivisions]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crpNPCCorporationDivisions](
	[corporationID] [int] NOT NULL,
	[divisionID] [tinyint] NOT NULL,
	[size] [tinyint] NULL,
 CONSTRAINT [crpNPCCorporationDivisions_PK] PRIMARY KEY CLUSTERED 
(
	[corporationID] ASC,
	[divisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crpNPCCorporationResearchFields]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crpNPCCorporationResearchFields](
	[skillID] [int] NOT NULL,
	[corporationID] [int] NOT NULL,
 CONSTRAINT [crpNPCCorporationResearchFields_PK] PRIMARY KEY CLUSTERED 
(
	[skillID] ASC,
	[corporationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crpNPCCorporationTrades]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crpNPCCorporationTrades](
	[corporationID] [int] NOT NULL,
	[typeID] [int] NOT NULL,
 CONSTRAINT [crpNPCCorporationTrades_PK] PRIMARY KEY CLUSTERED 
(
	[corporationID] ASC,
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crpNPCCorporations]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crpNPCCorporations](
	[corporationID] [int] NOT NULL,
	[size] [char](1) NULL,
	[extent] [char](1) NULL,
	[solarSystemID] [int] NULL,
	[investorID1] [int] NULL,
	[investorShares1] [tinyint] NULL,
	[investorID2] [int] NULL,
	[investorShares2] [tinyint] NULL,
	[investorID3] [int] NULL,
	[investorShares3] [tinyint] NULL,
	[investorID4] [int] NULL,
	[investorShares4] [tinyint] NULL,
	[friendID] [int] NULL,
	[enemyID] [int] NULL,
	[publicShares] [bigint] NULL,
	[initialPrice] [int] NULL,
	[minSecurity] [float] NULL,
	[scattered] [bit] NULL,
	[fringe] [tinyint] NULL,
	[corridor] [tinyint] NULL,
	[hub] [tinyint] NULL,
	[border] [tinyint] NULL,
	[factionID] [int] NULL,
	[sizeFactor] [float] NULL,
	[stationCount] [smallint] NULL,
	[stationSystemCount] [smallint] NULL,
	[description] [nvarchar](4000) NULL,
	[iconID] [int] NULL,
 CONSTRAINT [crpNPCCorporations_PK] PRIMARY KEY CLUSTERED 
(
	[corporationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crpNPCDivisions]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crpNPCDivisions](
	[divisionID] [tinyint] NOT NULL,
	[divisionName] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[leaderType] [nvarchar](100) NULL,
 CONSTRAINT [crpNPCDivisions_PK] PRIMARY KEY CLUSTERED 
(
	[divisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dgmAttributeCategories]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgmAttributeCategories](
	[categoryID] [tinyint] NOT NULL,
	[categoryName] [nvarchar](50) NULL,
	[categoryDescription] [nvarchar](200) NULL,
 CONSTRAINT [dgmAttributeCategories_PK] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dgmAttributeTypes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgmAttributeTypes](
	[attributeID] [smallint] NOT NULL,
	[attributeName] [varchar](100) NULL,
	[description] [varchar](1000) NULL,
	[iconID] [int] NULL,
	[defaultValue] [float] NULL,
	[published] [bit] NULL,
	[displayName] [varchar](100) NULL,
	[unitID] [tinyint] NULL,
	[stackable] [bit] NULL,
	[highIsGood] [bit] NULL,
	[categoryID] [tinyint] NULL,
 CONSTRAINT [dgmAttributeTypes_PK] PRIMARY KEY CLUSTERED 
(
	[attributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dgmEffects]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgmEffects](
	[effectID] [smallint] NOT NULL,
	[effectName] [varchar](400) NULL,
	[effectCategory] [smallint] NULL,
	[preExpression] [int] NULL,
	[postExpression] [int] NULL,
	[description] [varchar](1000) NULL,
	[guid] [varchar](60) NULL,
	[iconID] [int] NULL,
	[isOffensive] [bit] NULL,
	[isAssistance] [bit] NULL,
	[durationAttributeID] [smallint] NULL,
	[trackingSpeedAttributeID] [smallint] NULL,
	[dischargeAttributeID] [smallint] NULL,
	[rangeAttributeID] [smallint] NULL,
	[falloffAttributeID] [smallint] NULL,
	[disallowAutoRepeat] [bit] NULL,
	[published] [bit] NULL,
	[displayName] [varchar](100) NULL,
	[isWarpSafe] [bit] NULL,
	[rangeChance] [bit] NULL,
	[electronicChance] [bit] NULL,
	[propulsionChance] [bit] NULL,
	[distribution] [tinyint] NULL,
	[sfxName] [varchar](20) NULL,
	[npcUsageChanceAttributeID] [smallint] NULL,
	[npcActivationChanceAttributeID] [smallint] NULL,
	[fittingUsageChanceAttributeID] [smallint] NULL,
 CONSTRAINT [dgmEffects_PK] PRIMARY KEY CLUSTERED 
(
	[effectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dgmTypeAttributes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgmTypeAttributes](
	[typeID] [int] NOT NULL,
	[attributeID] [smallint] NOT NULL,
	[valueInt] [int] NULL,
	[valueFloat] [float] NULL,
 CONSTRAINT [dgmTypeAttributes_PK] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC,
	[attributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dgmTypeEffects]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dgmTypeEffects](
	[typeID] [int] NOT NULL,
	[effectID] [smallint] NOT NULL,
	[isDefault] [bit] NULL,
 CONSTRAINT [dgmTypeEffects_PK] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC,
	[effectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eveUnits]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eveUnits](
	[unitID] [tinyint] NOT NULL,
	[unitName] [varchar](100) NULL,
	[displayName] [varchar](50) NULL,
	[description] [varchar](1000) NULL,
 CONSTRAINT [eveUnits_PK] PRIMARY KEY CLUSTERED 
(
	[unitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invBlueprintTypes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invBlueprintTypes](
	[blueprintTypeID] [int] NOT NULL,
	[parentBlueprintTypeID] [int] NULL,
	[productTypeID] [int] NULL,
	[productionTime] [int] NULL,
	[techLevel] [smallint] NULL,
	[researchProductivityTime] [int] NULL,
	[researchMaterialTime] [int] NULL,
	[researchCopyTime] [int] NULL,
	[researchTechTime] [int] NULL,
	[productivityModifier] [int] NULL,
	[materialModifier] [smallint] NULL,
	[wasteFactor] [smallint] NULL,
	[maxProductionLimit] [int] NULL,
 CONSTRAINT [invBlueprintTypes_PK] PRIMARY KEY CLUSTERED 
(
	[blueprintTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invCategories]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invCategories](
	[categoryID] [int] NOT NULL,
	[categoryName] [nvarchar](100) NULL,
	[description] [nvarchar](3000) NULL,
	[iconID] [int] NULL,
	[published] [bit] NULL,
 CONSTRAINT [invCategories_PK] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invContrabandTypes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invContrabandTypes](
	[factionID] [int] NOT NULL,
	[typeID] [int] NOT NULL,
	[standingLoss] [float] NULL,
	[confiscateMinSec] [float] NULL,
	[fineByValue] [float] NULL,
	[attackMinSec] [float] NULL,
 CONSTRAINT [invContrabandTypes_PK] PRIMARY KEY CLUSTERED 
(
	[factionID] ASC,
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invControlTowerResourcePurposes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invControlTowerResourcePurposes](
	[purpose] [tinyint] NOT NULL,
	[purposeText] [varchar](100) NULL,
 CONSTRAINT [invControlTowerResourcePurposes_PK] PRIMARY KEY CLUSTERED 
(
	[purpose] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invControlTowerResources]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invControlTowerResources](
	[controlTowerTypeID] [int] NOT NULL,
	[resourceTypeID] [int] NOT NULL,
	[purpose] [tinyint] NULL,
	[quantity] [int] NULL,
	[minSecurityLevel] [float] NULL,
	[factionID] [int] NULL,
 CONSTRAINT [invControlTowerResources_PK] PRIMARY KEY CLUSTERED 
(
	[controlTowerTypeID] ASC,
	[resourceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invFlags]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invFlags](
	[flagID] [smallint] NOT NULL,
	[flagName] [varchar](200) NULL,
	[flagText] [varchar](100) NULL,
	[orderID] [int] NULL,
 CONSTRAINT [invFlags_PK] PRIMARY KEY CLUSTERED 
(
	[flagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invGroups]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invGroups](
	[groupID] [int] NOT NULL,
	[categoryID] [int] NULL,
	[groupName] [nvarchar](100) NULL,
	[description] [nvarchar](3000) NULL,
	[iconID] [int] NULL,
	[useBasePrice] [bit] NULL,
	[allowManufacture] [bit] NULL,
	[allowRecycler] [bit] NULL,
	[anchored] [bit] NULL,
	[anchorable] [bit] NULL,
	[fittableNonSingleton] [bit] NULL,
	[published] [bit] NULL,
 CONSTRAINT [invGroups_PK] PRIMARY KEY CLUSTERED 
(
	[groupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invItems]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invItems](
	[itemID] [bigint] NOT NULL,
	[typeID] [int] NOT NULL,
	[ownerID] [int] NOT NULL,
	[locationID] [bigint] NOT NULL,
	[flagID] [smallint] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [invItems_PK] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invMarketGroups]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invMarketGroups](
	[marketGroupID] [int] NOT NULL,
	[parentGroupID] [int] NULL,
	[marketGroupName] [nvarchar](100) NULL,
	[description] [nvarchar](3000) NULL,
	[iconID] [int] NULL,
	[hasTypes] [bit] NULL,
 CONSTRAINT [invMarketGroups_PK] PRIMARY KEY CLUSTERED 
(
	[marketGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invMetaGroups]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invMetaGroups](
	[metaGroupID] [smallint] NOT NULL,
	[metaGroupName] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[iconID] [int] NULL,
 CONSTRAINT [invMetaGroups_PK] PRIMARY KEY CLUSTERED 
(
	[metaGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invMetaTypes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invMetaTypes](
	[typeID] [int] NOT NULL,
	[parentTypeID] [int] NULL,
	[metaGroupID] [smallint] NULL,
 CONSTRAINT [invMetaTypes_PK] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invNames]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invNames](
	[itemID] [bigint] NOT NULL,
	[itemName] [nvarchar](200) NOT NULL,
 CONSTRAINT [invNames_PK] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invPositions]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invPositions](
	[itemID] [bigint] NOT NULL,
	[x] [float] NOT NULL,
	[y] [float] NOT NULL,
	[z] [float] NOT NULL,
	[yaw] [real] NULL,
	[pitch] [real] NULL,
	[roll] [real] NULL,
 CONSTRAINT [invPositions_PK] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invTypeMaterials]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invTypeMaterials](
	[typeID] [int] NOT NULL,
	[materialTypeID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [invTypeMaterials_PK] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC,
	[materialTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invTypeReactions]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invTypeReactions](
	[reactionTypeID] [int] NOT NULL,
	[input] [bit] NOT NULL,
	[typeID] [int] NOT NULL,
	[quantity] [smallint] NULL,
 CONSTRAINT [pk_invTypeReactions] PRIMARY KEY CLUSTERED 
(
	[reactionTypeID] ASC,
	[input] ASC,
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invTypes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invTypes](
	[typeID] [int] NOT NULL,
	[groupID] [int] NULL,
	[typeName] [nvarchar](100) NULL,
	[description] [nvarchar](3000) NULL,
	[mass] [float] NULL,
	[volume] [float] NULL,
	[capacity] [float] NULL,
	[portionSize] [int] NULL,
	[raceID] [tinyint] NULL,
	[basePrice] [money] NULL,
	[published] [bit] NULL,
	[marketGroupID] [int] NULL,
	[chanceOfDuplicating] [float] NULL,
 CONSTRAINT [invTypes_PK] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invUniqueNames]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invUniqueNames](
	[itemID] [int] NOT NULL,
	[itemName] [nvarchar](200) NOT NULL,
	[groupID] [int] NULL,
 CONSTRAINT [invUniqueNames_PK] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mapUniverse]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mapUniverse](
	[universeID] [int] NOT NULL,
	[universeName] [varchar](100) NULL,
	[x] [float] NULL,
	[y] [float] NULL,
	[z] [float] NULL,
	[xMin] [float] NULL,
	[xMax] [float] NULL,
	[yMin] [float] NULL,
	[yMax] [float] NULL,
	[zMin] [float] NULL,
	[zMax] [float] NULL,
	[radius] [float] NULL,
 CONSTRAINT [mapUniverse_PK] PRIMARY KEY CLUSTERED 
(
	[universeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [varchar](50) NULL,
	[type_id] [varchar](50) NULL,
	[location_id] [varchar](50) NULL,
	[volume_total] [varchar](50) NULL,
	[volume_remain] [varchar](50) NULL,
	[min_volume] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[is_buy_order] [varchar](50) NULL,
	[duration] [varchar](50) NULL,
	[issued] [varchar](50) NULL,
	[range] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planetSchematics]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planetSchematics](
	[schematicID] [smallint] NOT NULL,
	[schematicName] [nvarchar](255) NULL,
	[cycleTime] [int] NULL,
 CONSTRAINT [planetSchematics_PK] PRIMARY KEY CLUSTERED 
(
	[schematicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planetSchematicsPinMap]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planetSchematicsPinMap](
	[schematicID] [smallint] NOT NULL,
	[pinTypeID] [int] NOT NULL,
 CONSTRAINT [planetSchematicsPinMap_PK] PRIMARY KEY CLUSTERED 
(
	[schematicID] ASC,
	[pinTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planetSchematicsTypeMap]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planetSchematicsTypeMap](
	[schematicID] [smallint] NOT NULL,
	[typeID] [int] NOT NULL,
	[quantity] [smallint] NULL,
	[isInput] [bit] NULL,
 CONSTRAINT [planetSchematicsTypeMap_PK] PRIMARY KEY CLUSTERED 
(
	[schematicID] ASC,
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ramActivities]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ramActivities](
	[activityID] [tinyint] NOT NULL,
	[activityName] [nvarchar](100) NULL,
	[iconNo] [varchar](5) NULL,
	[description] [nvarchar](1000) NULL,
	[published] [bit] NULL,
 CONSTRAINT [ramActivities_PK] PRIMARY KEY CLUSTERED 
(
	[activityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ramAssemblyLineStations]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ramAssemblyLineStations](
	[stationID] [int] NOT NULL,
	[assemblyLineTypeID] [tinyint] NOT NULL,
	[quantity] [tinyint] NULL,
	[stationTypeID] [int] NULL,
	[ownerID] [int] NULL,
	[solarSystemID] [int] NULL,
	[regionID] [int] NULL,
 CONSTRAINT [ramAssemblyLineStations_PK] PRIMARY KEY CLUSTERED 
(
	[stationID] ASC,
	[assemblyLineTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ramAssemblyLineTypeDetailPerCategory]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ramAssemblyLineTypeDetailPerCategory](
	[assemblyLineTypeID] [tinyint] NOT NULL,
	[categoryID] [int] NOT NULL,
	[timeMultiplier] [float] NULL,
	[materialMultiplier] [float] NULL,
 CONSTRAINT [ramAssemblyLineTypeDetailPerCategory_PK] PRIMARY KEY CLUSTERED 
(
	[assemblyLineTypeID] ASC,
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ramAssemblyLineTypeDetailPerGroup]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ramAssemblyLineTypeDetailPerGroup](
	[assemblyLineTypeID] [tinyint] NOT NULL,
	[groupID] [int] NOT NULL,
	[timeMultiplier] [float] NULL,
	[materialMultiplier] [float] NULL,
 CONSTRAINT [ramAssemblyLineTypeDetailPerGroup_PK] PRIMARY KEY CLUSTERED 
(
	[assemblyLineTypeID] ASC,
	[groupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ramAssemblyLineTypes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ramAssemblyLineTypes](
	[assemblyLineTypeID] [tinyint] NOT NULL,
	[assemblyLineTypeName] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[baseTimeMultiplier] [float] NULL,
	[baseMaterialMultiplier] [float] NULL,
	[volume] [float] NULL,
	[activityID] [tinyint] NULL,
	[minCostPerHour] [float] NULL,
 CONSTRAINT [ramAssemblyLineTypes_PK] PRIMARY KEY CLUSTERED 
(
	[assemblyLineTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ramAssemblyLines]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ramAssemblyLines](
	[assemblyLineID] [int] NOT NULL,
	[assemblyLineTypeID] [tinyint] NULL,
	[containerID] [int] NULL,
	[nextFreeTime] [smalldatetime] NULL,
	[UIGroupingID] [tinyint] NULL,
	[costInstall] [float] NULL,
	[costPerHour] [float] NULL,
	[restrictionMask] [tinyint] NULL,
	[discountPerGoodStandingPoint] [float] NULL,
	[surchargePerBadStandingPoint] [float] NULL,
	[minimumStanding] [float] NULL,
	[minimumCharSecurity] [float] NULL,
	[minimumCorpSecurity] [float] NULL,
	[maximumCharSecurity] [float] NULL,
	[maximumCorpSecurity] [float] NULL,
	[ownerID] [int] NULL,
	[activityID] [tinyint] NULL,
 CONSTRAINT [ramAssemblyLines_PK] PRIMARY KEY CLUSTERED 
(
	[assemblyLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ramInstallationTypeContents]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ramInstallationTypeContents](
	[installationTypeID] [int] NOT NULL,
	[assemblyLineTypeID] [tinyint] NOT NULL,
	[quantity] [tinyint] NULL,
 CONSTRAINT [ramInstallationTypeContents_PK] PRIMARY KEY CLUSTERED 
(
	[installationTypeID] ASC,
	[assemblyLineTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ramTypeRequirements]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ramTypeRequirements](
	[typeID] [int] NOT NULL,
	[activityID] [tinyint] NOT NULL,
	[requiredTypeID] [int] NOT NULL,
	[quantity] [int] NULL,
	[damagePerJob] [float] NULL,
	[recycle] [bit] NULL,
 CONSTRAINT [ramTypeRequirements_PK] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC,
	[activityID] ASC,
	[requiredTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staOperationServices]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staOperationServices](
	[operationID] [tinyint] NOT NULL,
	[serviceID] [int] NOT NULL,
 CONSTRAINT [staOperationServices_PK] PRIMARY KEY CLUSTERED 
(
	[operationID] ASC,
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staOperations]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staOperations](
	[activityID] [tinyint] NULL,
	[operationID] [tinyint] NOT NULL,
	[operationName] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
	[fringe] [tinyint] NULL,
	[corridor] [tinyint] NULL,
	[hub] [tinyint] NULL,
	[border] [tinyint] NULL,
	[ratio] [tinyint] NULL,
	[caldariStationTypeID] [int] NULL,
	[minmatarStationTypeID] [int] NULL,
	[amarrStationTypeID] [int] NULL,
	[gallenteStationTypeID] [int] NULL,
	[joveStationTypeID] [int] NULL,
 CONSTRAINT [staOperations_PK] PRIMARY KEY CLUSTERED 
(
	[operationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staServices]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staServices](
	[serviceID] [int] NOT NULL,
	[serviceName] [nvarchar](100) NULL,
	[description] [nvarchar](1000) NULL,
 CONSTRAINT [staServices_PK] PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staStationTypes]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staStationTypes](
	[stationTypeID] [int] NOT NULL,
	[dockEntryX] [float] NULL,
	[dockEntryY] [float] NULL,
	[dockEntryZ] [float] NULL,
	[dockOrientationX] [float] NULL,
	[dockOrientationY] [float] NULL,
	[dockOrientationZ] [float] NULL,
	[operationID] [tinyint] NULL,
	[officeSlots] [tinyint] NULL,
	[reprocessingEfficiency] [float] NULL,
	[conquerable] [bit] NULL,
 CONSTRAINT [stationTypes_PK] PRIMARY KEY CLUSTERED 
(
	[stationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staStations]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staStations](
	[stationID] [int] NOT NULL,
	[security] [smallint] NULL,
	[dockingCostPerVolume] [float] NULL,
	[maxShipVolumeDockable] [float] NULL,
	[officeRentalCost] [int] NULL,
	[operationID] [tinyint] NULL,
	[stationTypeID] [int] NULL,
	[corporationID] [int] NULL,
	[solarSystemID] [int] NULL,
	[constellationID] [int] NULL,
	[regionID] [int] NULL,
	[stationName] [nvarchar](100) NULL,
	[x] [float] NULL,
	[y] [float] NULL,
	[z] [float] NULL,
	[reprocessingEfficiency] [float] NULL,
	[reprocessingStationsTake] [float] NULL,
	[reprocessingHangarFlag] [tinyint] NULL,
 CONSTRAINT [staStations_PK] PRIMARY KEY CLUSTERED 
(
	[stationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[translationTables]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[translationTables](
	[sourceTable] [nvarchar](200) NOT NULL,
	[destinationTable] [nvarchar](200) NULL,
	[translatedKey] [nvarchar](200) NOT NULL,
	[tcGroupID] [int] NULL,
	[tcID] [int] NULL,
 CONSTRAINT [translationTables_PK] PRIMARY KEY CLUSTERED 
(
	[sourceTable] ASC,
	[translatedKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnTranslationColumns]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnTranslationColumns](
	[tcGroupID] [smallint] NULL,
	[tcID] [smallint] NOT NULL,
	[tableName] [nvarchar](256) NOT NULL,
	[columnName] [nvarchar](128) NOT NULL,
	[masterID] [nvarchar](128) NULL,
 CONSTRAINT [translationColumns_PK] PRIMARY KEY CLUSTERED 
(
	[tcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnTranslationLanguages]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnTranslationLanguages](
	[numericLanguageID] [int] NOT NULL,
	[languageID] [varchar](50) NULL,
	[languageName] [nvarchar](200) NULL,
 CONSTRAINT [trnTranslationLanguages_PK] PRIMARY KEY CLUSTERED 
(
	[numericLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trnTranslations]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trnTranslations](
	[tcID] [smallint] NOT NULL,
	[keyID] [int] NOT NULL,
	[languageID] [varchar](50) NOT NULL,
	[text] [nvarchar](max) NOT NULL,
 CONSTRAINT [trnTranslations_PK] PRIMARY KEY CLUSTERED 
(
	[tcID] ASC,
	[keyID] ASC,
	[languageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warCombatZoneSystems]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warCombatZoneSystems](
	[solarSystemID] [int] NOT NULL,
	[combatZoneID] [int] NULL,
 CONSTRAINT [combatZoneSystems_PK] PRIMARY KEY CLUSTERED 
(
	[solarSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warCombatZones]    Script Date: 2017. 08. 22. 11:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warCombatZones](
	[combatZoneID] [int] NOT NULL,
	[combatZoneName] [nvarchar](100) NULL,
	[factionID] [int] NULL,
	[centerSystemID] [int] NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [combatZones_PK] PRIMARY KEY CLUSTERED 
(
	[combatZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [agtAgents_IX_corporation]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [agtAgents_IX_corporation] ON [dbo].[agtAgents]
(
	[corporationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [agtAgents_IX_station]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [agtAgents_IX_station] ON [dbo].[agtAgents]
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [agtResearchAgents_IX_type]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [agtResearchAgents_IX_type] ON [dbo].[agtResearchAgents]
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [invContrabandTypes_IX_type]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [invContrabandTypes_IX_type] ON [dbo].[invContrabandTypes]
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [invGroups_IX_category]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [invGroups_IX_category] ON [dbo].[invGroups]
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [items_IX_Location]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [items_IX_Location] ON [dbo].[invItems]
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [items_IX_OwnerLocation]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [items_IX_OwnerLocation] ON [dbo].[invItems]
(
	[ownerID] ASC,
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [invTypes_IX_Group]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [invTypes_IX_Group] ON [dbo].[invTypes]
(
	[groupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [invUniqueNames_IX_GroupName]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [invUniqueNames_IX_GroupName] ON [dbo].[invUniqueNames]
(
	[groupID] ASC,
	[itemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [invUniqueNames_UQ]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [invUniqueNames_UQ] ON [dbo].[invUniqueNames]
(
	[itemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ramAssemblyLineStations_IX_owner]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [ramAssemblyLineStations_IX_owner] ON [dbo].[ramAssemblyLineStations]
(
	[ownerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ramAssemblyLineStations_IX_region]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [ramAssemblyLineStations_IX_region] ON [dbo].[ramAssemblyLineStations]
(
	[regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ramAssemblyLines_IX_container]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [ramAssemblyLines_IX_container] ON [dbo].[ramAssemblyLines]
(
	[containerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ramAssemblyLines_IX_owner]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [ramAssemblyLines_IX_owner] ON [dbo].[ramAssemblyLines]
(
	[ownerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [staStations_IX_constellation]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [staStations_IX_constellation] ON [dbo].[staStations]
(
	[constellationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [staStations_IX_corporation]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [staStations_IX_corporation] ON [dbo].[staStations]
(
	[corporationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [staStations_IX_operation]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [staStations_IX_operation] ON [dbo].[staStations]
(
	[operationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [staStations_IX_region]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [staStations_IX_region] ON [dbo].[staStations]
(
	[regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [staStations_IX_system]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [staStations_IX_system] ON [dbo].[staStations]
(
	[solarSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [staStations_IX_type]    Script Date: 2017. 08. 22. 11:32:16 ******/
CREATE NONCLUSTERED INDEX [staStations_IX_type] ON [dbo].[staStations]
(
	[stationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[invPositions] ADD  DEFAULT ((0.0)) FOR [x]
GO
ALTER TABLE [dbo].[invPositions] ADD  DEFAULT ((0.0)) FOR [y]
GO
ALTER TABLE [dbo].[invPositions] ADD  DEFAULT ((0.0)) FOR [z]
GO
ALTER TABLE [dbo].[invTypeMaterials] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[warCombatZones] ADD  DEFAULT ((-1)) FOR [combatZoneID]
GO
USE [master]
GO
ALTER DATABASE [eve] SET  READ_WRITE 
GO
