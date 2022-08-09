CREATE TABLE [dbo].[Ator]
(
	[IdAtor] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [NomeAtor] NVARCHAR(50) NULL, 
    [Ativo] BIT NULL DEFAULT 'true'
)
