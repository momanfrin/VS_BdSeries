CREATE TABLE [dbo].[Genero]
(
	[IdGenero] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [NomeGenero] NVARCHAR(50) NULL, 
    [Ativo] BIT NULL DEFAULT 'true'
)
