CREATE TABLE [dbo].[Avaliacao]
(
	[IdAvaliacao] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [IdSerie] NVARCHAR(50) NULL, 
    [Nota] NVARCHAR(50) NULL, 
    [DataAvaliacao] NVARCHAR(50) NULL, 
    [Ativo] BIT NULL, 
    CONSTRAINT [FK_Avaliacao_IdSerie] 
    FOREIGN KEY ([IdSerie]) REFERENCES [Serie]([IdSerie])
)
