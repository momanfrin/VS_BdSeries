CREATE TABLE [dbo].[Produtora]
(
	[IdProdutora] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [NomeProdutora] NVARCHAR(100) NULL, 
    [Ativo] BIT NULL DEFAULT 'true'
)
