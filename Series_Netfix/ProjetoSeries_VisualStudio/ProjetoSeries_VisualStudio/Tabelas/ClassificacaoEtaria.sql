CREATE TABLE [dbo].[ClassificacaoEtaria]
(
	[IdClassificacaoEtaria] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [FaixaClassificacao] NVARCHAR(300) NULL, 
    [Descricao] NVARCHAR(500) NULL ,
    [Ativo] BIT NULL DEFAULT 'true'
)
