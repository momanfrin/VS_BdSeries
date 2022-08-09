CREATE TABLE [dbo].[IdiomaDublado]
(
	[IdIdiomaDublado] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [NomeIdiomaDublado] NVARCHAR(100) NULL, 
    [Ativo] BIT NULL DEFAULT 'true'
)
