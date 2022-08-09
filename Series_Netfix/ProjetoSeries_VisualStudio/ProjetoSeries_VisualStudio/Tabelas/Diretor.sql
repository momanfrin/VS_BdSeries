CREATE TABLE [dbo].[Diretor]
(
	[IdDiretor] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [NomeDiretor] NVARCHAR(100) NULL, 
    [Ativo] BIT NULL DEFAULT 'true'
)
