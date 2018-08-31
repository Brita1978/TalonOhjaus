
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/31/2018 12:13:48
-- Generated from EDMX file: C:\Users\Brita\source\repos\AlytaloPalauta\AlytaloPalauta\TalonModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Talo];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__TalonTila__TaloI__1273C1CD]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TalonTila] DROP CONSTRAINT [FK__TalonTila__TaloI__1273C1CD];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Huoneet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Huoneet];
GO
IF OBJECT_ID(N'[dbo].[Saunat]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Saunat];
GO
IF OBJECT_ID(N'[dbo].[TalonTila]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TalonTila];
GO
IF OBJECT_ID(N'[dbo].[Valot]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Valot];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Huoneet'
CREATE TABLE [dbo].[Huoneet] (
    [HuoneID] int IDENTITY(1,1) NOT NULL,
    [HuoneenNimi] nvarchar(255)  NULL,
    [HuoneenLampotila] nvarchar(255)  NULL,
    [HuoneenTavoiteLampotila] nvarchar(255)  NULL,
    [PVM] datetime  NULL
);
GO

-- Creating table 'Saunat'
CREATE TABLE [dbo].[Saunat] (
    [SaunaID] int IDENTITY(1,1) NOT NULL,
    [SaunanSijainti] nvarchar(255)  NULL,
    [SaunaPaalla] bit  NULL,
    [SaunanLampotila] nvarchar(255)  NULL,
    [PVM] datetime  NULL
);
GO

-- Creating table 'TalonTila'
CREATE TABLE [dbo].[TalonTila] (
    [TalonTilaID] int IDENTITY(1,1) NOT NULL,
    [TaloID] int  NULL,
    [TalonTavoiteLampotila] nvarchar(255)  NULL,
    [TalonNykyLampotila] nvarchar(255)  NULL,
    [PVM] datetime  NULL,
    [TaloHuone] nvarchar(255)  NULL
);
GO

-- Creating table 'Valot'
CREATE TABLE [dbo].[Valot] (
    [ValoID] int IDENTITY(1,1) NOT NULL,
    [ValonSijainti] nvarchar(255)  NULL,
    [ValoPaalla] bit  NULL,
    [ValonMaara] nvarchar(50)  NULL,
    [PVM] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [HuoneID] in table 'Huoneet'
ALTER TABLE [dbo].[Huoneet]
ADD CONSTRAINT [PK_Huoneet]
    PRIMARY KEY CLUSTERED ([HuoneID] ASC);
GO

-- Creating primary key on [SaunaID] in table 'Saunat'
ALTER TABLE [dbo].[Saunat]
ADD CONSTRAINT [PK_Saunat]
    PRIMARY KEY CLUSTERED ([SaunaID] ASC);
GO

-- Creating primary key on [TalonTilaID] in table 'TalonTila'
ALTER TABLE [dbo].[TalonTila]
ADD CONSTRAINT [PK_TalonTila]
    PRIMARY KEY CLUSTERED ([TalonTilaID] ASC);
GO

-- Creating primary key on [ValoID] in table 'Valot'
ALTER TABLE [dbo].[Valot]
ADD CONSTRAINT [PK_Valot]
    PRIMARY KEY CLUSTERED ([ValoID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TaloID] in table 'TalonTila'
ALTER TABLE [dbo].[TalonTila]
ADD CONSTRAINT [FK__TalonTila__TaloI__1273C1CD]
    FOREIGN KEY ([TaloID])
    REFERENCES [dbo].[Huoneet]
        ([HuoneID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__TalonTila__TaloI__1273C1CD'
CREATE INDEX [IX_FK__TalonTila__TaloI__1273C1CD]
ON [dbo].[TalonTila]
    ([TaloID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------