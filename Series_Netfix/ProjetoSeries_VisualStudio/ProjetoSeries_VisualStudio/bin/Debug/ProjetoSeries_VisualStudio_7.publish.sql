/*
Deployment script for VS_Series

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "VS_Series"
:setvar DefaultFilePrefix "VS_Series"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.TREINAMENTOALURA\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.TREINAMENTOALURA\MSSQL\DATA\"

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
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Ator]...';


GO
ALTER TABLE [dbo].[Ator] DROP CONSTRAINT [DF__Ator__Ativo__46E78A0C];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[ClassificacaoEtaria]...';


GO
ALTER TABLE [dbo].[ClassificacaoEtaria] DROP CONSTRAINT [DF__Classific__Ativo__47DBAE45];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Diretor]...';


GO
ALTER TABLE [dbo].[Diretor] DROP CONSTRAINT [DF__tmp_ms_xx__Ativo__5CD6CB2B];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Episodio]...';


GO
ALTER TABLE [dbo].[Episodio] DROP CONSTRAINT [DF__Episodio__Ativo__48CFD27E];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Genero]...';


GO
ALTER TABLE [dbo].[Genero] DROP CONSTRAINT [DF__Genero__Ativo__49C3F6B7];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[IdiomaDublado]...';


GO
ALTER TABLE [dbo].[IdiomaDublado] DROP CONSTRAINT [DF__IdiomaDub__Ativo__4AB81AF0];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[IdiomaLegendado]...';


GO
ALTER TABLE [dbo].[IdiomaLegendado] DROP CONSTRAINT [DF__IdiomaLeg__Ativo__4BAC3F29];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [dbo].[Produtora]...';


GO
ALTER TABLE [dbo].[Produtora] DROP CONSTRAINT [DF__Produtora__Ativo__2A4B4B5E];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_ATOR]...';


GO
ALTER TABLE [dbo].[Serie_Ator] DROP CONSTRAINT [FK_ATOR];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Avaliacao_IdSerie]...';


GO
ALTER TABLE [dbo].[Avaliacao] DROP CONSTRAINT [FK_Avaliacao_IdSerie];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_IdClassificacaoEtaria]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [FK_Serie_IdClassificacaoEtaria];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_IdDiretor]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [FK_Serie_IdDiretor];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Episodio_IdSerie]...';


GO
ALTER TABLE [dbo].[Episodio] DROP CONSTRAINT [FK_Episodio_IdSerie];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_Genero_IdGenero]...';


GO
ALTER TABLE [dbo].[Serie_Genero] DROP CONSTRAINT [FK_Serie_Genero_IdGenero];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_Dublado_IdIdiomaDublado]...';


GO
ALTER TABLE [dbo].[Serie_Dublado] DROP CONSTRAINT [FK_Serie_Dublado_IdIdiomaDublado];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_Legendado_ToTable_1]...';


GO
ALTER TABLE [dbo].[Serie_Legendado] DROP CONSTRAINT [FK_Serie_Legendado_ToTable_1];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_IdPaisOrigem]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [FK_Serie_IdPaisOrigem];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_IdProdutora]...';


GO
ALTER TABLE [dbo].[Serie] DROP CONSTRAINT [FK_Serie_IdProdutora];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_SERIEATOR]...';


GO
ALTER TABLE [dbo].[Serie_Ator] DROP CONSTRAINT [FK_SERIEATOR];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_Dublado_IdSerie]...';


GO
ALTER TABLE [dbo].[Serie_Dublado] DROP CONSTRAINT [FK_Serie_Dublado_IdSerie];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_Genero_IdSerie]...';


GO
ALTER TABLE [dbo].[Serie_Genero] DROP CONSTRAINT [FK_Serie_Genero_IdSerie];


GO
PRINT N'Dropping Foreign Key [dbo].[FK_Serie_Legendado_ToTable]...';


GO
ALTER TABLE [dbo].[Serie_Legendado] DROP CONSTRAINT [FK_Serie_Legendado_ToTable];


GO
PRINT N'Starting rebuilding table [dbo].[Ator]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Ator] (
    [IdAtor]   NVARCHAR (50) NOT NULL,
    [NomeAtor] NVARCHAR (50) NULL,
    [Ativo]    BIT           DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdAtor] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Ator])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Ator] ([IdAtor], [NomeAtor], [Ativo])
        SELECT   [IdAtor],
                 [NomeAtor],
                 [Ativo]
        FROM     [dbo].[Ator]
        ORDER BY [IdAtor] ASC;
    END

DROP TABLE [dbo].[Ator];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Ator]', N'Ator';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Avaliacao]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Avaliacao] (
    [IdAvaliacao]   NVARCHAR (50) NOT NULL,
    [IdSerie]       NVARCHAR (50) NULL,
    [Nota]          NVARCHAR (50) NULL,
    [DataAvaliacao] DATE          NULL,
    [Ativo]         BIT           NULL,
    PRIMARY KEY CLUSTERED ([IdAvaliacao] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Avaliacao])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Avaliacao] ([IdAvaliacao], [IdSerie], [Nota], [DataAvaliacao], [Ativo])
        SELECT   [IdAvaliacao],
                 [IdSerie],
                 [Nota],
                 [DataAvaliacao],
                 [Ativo]
        FROM     [dbo].[Avaliacao]
        ORDER BY [IdAvaliacao] ASC;
    END

DROP TABLE [dbo].[Avaliacao];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Avaliacao]', N'Avaliacao';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[ClassificacaoEtaria]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_ClassificacaoEtaria] (
    [IdClassificacaoEtaria] NVARCHAR (50)  NOT NULL,
    [FaixaClassificacao]    NVARCHAR (100) NULL,
    [Descricao]             NVARCHAR (300) NULL,
    [Ativo]                 BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdClassificacaoEtaria] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[ClassificacaoEtaria])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_ClassificacaoEtaria] ([IdClassificacaoEtaria], [FaixaClassificacao], [Descricao], [Ativo])
        SELECT   [IdClassificacaoEtaria],
                 [FaixaClassificacao],
                 [Descricao],
                 [Ativo]
        FROM     [dbo].[ClassificacaoEtaria]
        ORDER BY [IdClassificacaoEtaria] ASC;
    END

DROP TABLE [dbo].[ClassificacaoEtaria];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_ClassificacaoEtaria]', N'ClassificacaoEtaria';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Diretor]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Diretor] (
    [IdDiretor]   NVARCHAR (50)  NOT NULL,
    [NomeDiretor] NVARCHAR (100) NULL,
    [Ativo]       BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdDiretor] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Diretor])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Diretor] ([IdDiretor], [NomeDiretor], [Ativo])
        SELECT   [IdDiretor],
                 [NomeDiretor],
                 [Ativo]
        FROM     [dbo].[Diretor]
        ORDER BY [IdDiretor] ASC;
    END

DROP TABLE [dbo].[Diretor];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Diretor]', N'Diretor';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Episodio]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Episodio] (
    [IdSerie]        NVARCHAR (50)  NOT NULL,
    [NomeEpisodio]   NVARCHAR (100) NOT NULL,
    [DataLancamento] DATETIME       NOT NULL,
    [Duracao]        NVARCHAR (50)  NOT NULL,
    [Ativo]          BIT            DEFAULT 'true' NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Episodio])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Episodio] ([IdSerie], [NomeEpisodio], [DataLancamento], [Duracao], [Ativo])
        SELECT   [IdSerie],
                 [NomeEpisodio],
                 [DataLancamento],
                 [Duracao],
                 [Ativo]
        FROM     [dbo].[Episodio]
        ORDER BY [IdSerie] ASC;
    END

DROP TABLE [dbo].[Episodio];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Episodio]', N'Episodio';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Genero]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Genero] (
    [IdGenero]   NVARCHAR (50) NOT NULL,
    [NomeGenero] NVARCHAR (50) NULL,
    [Ativo]      BIT           DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdGenero] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Genero])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Genero] ([IdGenero], [NomeGenero], [Ativo])
        SELECT   [IdGenero],
                 [NomeGenero],
                 [Ativo]
        FROM     [dbo].[Genero]
        ORDER BY [IdGenero] ASC;
    END

DROP TABLE [dbo].[Genero];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Genero]', N'Genero';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[IdiomaDublado]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_IdiomaDublado] (
    [IdIdiomaDublado]   NVARCHAR (50)  NOT NULL,
    [NomeIdiomaDublado] NVARCHAR (100) NULL,
    [Ativo]             BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdIdiomaDublado] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[IdiomaDublado])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_IdiomaDublado] ([IdIdiomaDublado], [NomeIdiomaDublado], [Ativo])
        SELECT   [IdIdiomaDublado],
                 [NomeIdiomaDublado],
                 [Ativo]
        FROM     [dbo].[IdiomaDublado]
        ORDER BY [IdIdiomaDublado] ASC;
    END

DROP TABLE [dbo].[IdiomaDublado];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_IdiomaDublado]', N'IdiomaDublado';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[IdiomaLegendado]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_IdiomaLegendado] (
    [IdIdiomaLegendado]   NVARCHAR (50)  NOT NULL,
    [NomeIdiomaLegendado] NVARCHAR (100) NULL,
    [Ativo]               BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdIdiomaLegendado] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[IdiomaLegendado])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_IdiomaLegendado] ([IdIdiomaLegendado], [NomeIdiomaLegendado], [Ativo])
        SELECT   [IdIdiomaLegendado],
                 [NomeIdiomaLegendado],
                 [Ativo]
        FROM     [dbo].[IdiomaLegendado]
        ORDER BY [IdIdiomaLegendado] ASC;
    END

DROP TABLE [dbo].[IdiomaLegendado];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_IdiomaLegendado]', N'IdiomaLegendado';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[PaisOrigem]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_PaisOrigem] (
    [IdPais]   NVARCHAR (50)  NOT NULL,
    [NomePais] NVARCHAR (100) NULL,
    [Ativo]    BIT            NULL,
    PRIMARY KEY CLUSTERED ([IdPais] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[PaisOrigem])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_PaisOrigem] ([IdPais], [NomePais], [Ativo])
        SELECT   [IdPais],
                 [NomePais],
                 [Ativo]
        FROM     [dbo].[PaisOrigem]
        ORDER BY [IdPais] ASC;
    END

DROP TABLE [dbo].[PaisOrigem];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_PaisOrigem]', N'PaisOrigem';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Produtora]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Produtora] (
    [IdProdutora]   NVARCHAR (50)  NOT NULL,
    [NomeProdutora] NVARCHAR (100) NULL,
    [Ativo]         BIT            DEFAULT 'true' NULL,
    PRIMARY KEY CLUSTERED ([IdProdutora] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Produtora])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Produtora] ([IdProdutora], [NomeProdutora], [Ativo])
        SELECT   [IdProdutora],
                 [NomeProdutora],
                 [Ativo]
        FROM     [dbo].[Produtora]
        ORDER BY [IdProdutora] ASC;
    END

DROP TABLE [dbo].[Produtora];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Produtora]', N'Produtora';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Serie]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Serie] (
    [IdSerie]               NVARCHAR (50)  NOT NULL,
    [IdDiretor]             NVARCHAR (50)  NULL,
    [IdProdutora]           NVARCHAR (50)  NULL,
    [IdPaisOrigem]          NVARCHAR (50)  NULL,
    [IdClassificacaoEtaria] NVARCHAR (50)  NULL,
    [Ativo]                 BIT            NULL,
    [Nome]                  NVARCHAR (100) NULL,
    [AnoProducao]           NVARCHAR (4)   NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Serie])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Serie] ([IdSerie], [IdDiretor], [IdProdutora], [IdPaisOrigem], [IdClassificacaoEtaria], [Ativo], [Nome], [AnoProducao])
        SELECT   [IdSerie],
                 [IdDiretor],
                 [IdProdutora],
                 [IdPaisOrigem],
                 [IdClassificacaoEtaria],
                 [Ativo],
                 [Nome],
                 [AnoProducao]
        FROM     [dbo].[Serie]
        ORDER BY [IdSerie] ASC;
    END

DROP TABLE [dbo].[Serie];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Serie]', N'Serie';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Serie_Ator]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Serie_Ator] (
    [IdSerie] NVARCHAR (50) NOT NULL,
    [IdAtor]  NVARCHAR (50) NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_SERIE_ATOR1] PRIMARY KEY CLUSTERED ([IdAtor] ASC, [IdSerie] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Serie_Ator])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Serie_Ator] ([IdAtor], [IdSerie])
        SELECT   [IdAtor],
                 [IdSerie]
        FROM     [dbo].[Serie_Ator]
        ORDER BY [IdAtor] ASC, [IdSerie] ASC;
    END

DROP TABLE [dbo].[Serie_Ator];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Serie_Ator]', N'Serie_Ator';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_SERIE_ATOR1]', N'PK_SERIE_ATOR', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Serie_Dublado]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Serie_Dublado] (
    [IdSerie]         NVARCHAR (50) NOT NULL,
    [IdIdiomaDublado] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC, [IdIdiomaDublado] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Serie_Dublado])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Serie_Dublado] ([IdSerie], [IdIdiomaDublado])
        SELECT   [IdSerie],
                 [IdIdiomaDublado]
        FROM     [dbo].[Serie_Dublado]
        ORDER BY [IdSerie] ASC, [IdIdiomaDublado] ASC;
    END

DROP TABLE [dbo].[Serie_Dublado];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Serie_Dublado]', N'Serie_Dublado';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Serie_Genero]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Serie_Genero] (
    [IdSerie]  NVARCHAR (50) NOT NULL,
    [IdGenero] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC, [IdGenero] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Serie_Genero])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Serie_Genero] ([IdSerie], [IdGenero])
        SELECT   [IdSerie],
                 [IdGenero]
        FROM     [dbo].[Serie_Genero]
        ORDER BY [IdSerie] ASC, [IdGenero] ASC;
    END

DROP TABLE [dbo].[Serie_Genero];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Serie_Genero]', N'Serie_Genero';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Serie_Legendado]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Serie_Legendado] (
    [IdSerie]           NVARCHAR (50) NOT NULL,
    [IdIdiomaLegendado] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSerie] ASC, [IdIdiomaLegendado] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Serie_Legendado])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Serie_Legendado] ([IdSerie], [IdIdiomaLegendado])
        SELECT   [IdSerie],
                 [IdIdiomaLegendado]
        FROM     [dbo].[Serie_Legendado]
        ORDER BY [IdSerie] ASC, [IdIdiomaLegendado] ASC;
    END

DROP TABLE [dbo].[Serie_Legendado];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Serie_Legendado]', N'Serie_Legendado';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating Foreign Key [dbo].[FK_ATOR]...';


GO
ALTER TABLE [dbo].[Serie_Ator] WITH NOCHECK
    ADD CONSTRAINT [FK_ATOR] FOREIGN KEY ([IdAtor]) REFERENCES [dbo].[Ator] ([IdAtor]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Avaliacao_IdSerie]...';


GO
ALTER TABLE [dbo].[Avaliacao] WITH NOCHECK
    ADD CONSTRAINT [FK_Avaliacao_IdSerie] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_IdClassificacaoEtaria]...';


GO
ALTER TABLE [dbo].[Serie] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_IdClassificacaoEtaria] FOREIGN KEY ([IdClassificacaoEtaria]) REFERENCES [dbo].[ClassificacaoEtaria] ([IdClassificacaoEtaria]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_IdDiretor]...';


GO
ALTER TABLE [dbo].[Serie] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_IdDiretor] FOREIGN KEY ([IdDiretor]) REFERENCES [dbo].[Diretor] ([IdDiretor]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Episodio_IdSerie]...';


GO
ALTER TABLE [dbo].[Episodio] WITH NOCHECK
    ADD CONSTRAINT [FK_Episodio_IdSerie] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Genero_IdGenero]...';


GO
ALTER TABLE [dbo].[Serie_Genero] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Genero_IdGenero] FOREIGN KEY ([IdGenero]) REFERENCES [dbo].[Genero] ([IdGenero]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Dublado_IdIdiomaDublado]...';


GO
ALTER TABLE [dbo].[Serie_Dublado] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Dublado_IdIdiomaDublado] FOREIGN KEY ([IdIdiomaDublado]) REFERENCES [dbo].[IdiomaDublado] ([IdIdiomaDublado]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Legendado_ToTable_1]...';


GO
ALTER TABLE [dbo].[Serie_Legendado] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Legendado_ToTable_1] FOREIGN KEY ([IdIdiomaLegendado]) REFERENCES [dbo].[IdiomaLegendado] ([IdIdiomaLegendado]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_IdPaisOrigem]...';


GO
ALTER TABLE [dbo].[Serie] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_IdPaisOrigem] FOREIGN KEY ([IdPaisOrigem]) REFERENCES [dbo].[PaisOrigem] ([IdPais]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_IdProdutora]...';


GO
ALTER TABLE [dbo].[Serie] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_IdProdutora] FOREIGN KEY ([IdProdutora]) REFERENCES [dbo].[Produtora] ([IdProdutora]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_SERIEATOR]...';


GO
ALTER TABLE [dbo].[Serie_Ator] WITH NOCHECK
    ADD CONSTRAINT [FK_SERIEATOR] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Dublado_IdSerie]...';


GO
ALTER TABLE [dbo].[Serie_Dublado] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Dublado_IdSerie] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Genero_IdSerie]...';


GO
ALTER TABLE [dbo].[Serie_Genero] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Genero_IdSerie] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Serie_Legendado_ToTable]...';


GO
ALTER TABLE [dbo].[Serie_Legendado] WITH NOCHECK
    ADD CONSTRAINT [FK_Serie_Legendado_ToTable] FOREIGN KEY ([IdSerie]) REFERENCES [dbo].[Serie] ([IdSerie]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Serie_Ator] WITH CHECK CHECK CONSTRAINT [FK_ATOR];

ALTER TABLE [dbo].[Avaliacao] WITH CHECK CHECK CONSTRAINT [FK_Avaliacao_IdSerie];

ALTER TABLE [dbo].[Serie] WITH CHECK CHECK CONSTRAINT [FK_Serie_IdClassificacaoEtaria];

ALTER TABLE [dbo].[Serie] WITH CHECK CHECK CONSTRAINT [FK_Serie_IdDiretor];

ALTER TABLE [dbo].[Episodio] WITH CHECK CHECK CONSTRAINT [FK_Episodio_IdSerie];

ALTER TABLE [dbo].[Serie_Genero] WITH CHECK CHECK CONSTRAINT [FK_Serie_Genero_IdGenero];

ALTER TABLE [dbo].[Serie_Dublado] WITH CHECK CHECK CONSTRAINT [FK_Serie_Dublado_IdIdiomaDublado];

ALTER TABLE [dbo].[Serie_Legendado] WITH CHECK CHECK CONSTRAINT [FK_Serie_Legendado_ToTable_1];

ALTER TABLE [dbo].[Serie] WITH CHECK CHECK CONSTRAINT [FK_Serie_IdPaisOrigem];

ALTER TABLE [dbo].[Serie] WITH CHECK CHECK CONSTRAINT [FK_Serie_IdProdutora];

ALTER TABLE [dbo].[Serie_Ator] WITH CHECK CHECK CONSTRAINT [FK_SERIEATOR];

ALTER TABLE [dbo].[Serie_Dublado] WITH CHECK CHECK CONSTRAINT [FK_Serie_Dublado_IdSerie];

ALTER TABLE [dbo].[Serie_Genero] WITH CHECK CHECK CONSTRAINT [FK_Serie_Genero_IdSerie];

ALTER TABLE [dbo].[Serie_Legendado] WITH CHECK CHECK CONSTRAINT [FK_Serie_Legendado_ToTable];


GO
PRINT N'Update complete.';


GO
