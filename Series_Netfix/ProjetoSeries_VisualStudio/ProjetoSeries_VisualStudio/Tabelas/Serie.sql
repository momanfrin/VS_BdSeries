CREATE TABLE [dbo].[Serie]
(
	[IdSerie] INT(50) NOT NULL PRIMARY KEY, 
    [IdDiretor] INT(50) NULL, 
    [IdProdutora] INT(50) NULL, 
    [IdPaisOrigem] INT(50) NULL, 
    [IdClassificacaoEtaria] INT(50) NULL, 
    [Ativo] BIT NULL, 
    [Nome] NVARCHAR(100) NULL, 
    [AnoProducao] NVARCHAR(4) NULL, 
    CONSTRAINT [FK_Serie_IdDiretor] FOREIGN KEY ([IdDiretor]) 
    REFERENCES [Diretor]([IdDiretor]), 
    CONSTRAINT [FK_Serie_IdProdutora] 
    FOREIGN KEY ([IdProdutora]) 
    REFERENCES [Produtora]([IdProdutora]), 
    CONSTRAINT [FK_Serie_IdPaisOrigem] 
    FOREIGN KEY ([IdPaisOrigem]) 
    REFERENCES [PaisOrigem]([IdPais]), 
    CONSTRAINT [FK_Serie_IdClassificacaoEtaria] 
    FOREIGN KEY ([IdClassificacaoEtaria]) 
    REFERENCES [ClassificacaoEtaria]([IdClassificacaoEtaria])
)

