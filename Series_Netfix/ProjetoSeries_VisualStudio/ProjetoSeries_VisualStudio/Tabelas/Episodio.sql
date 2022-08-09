CREATE TABLE [dbo].[Episodio]
(
	[IdEpisodio] NVARCHAR(50) NOT NULL PRIMARY KEY, 
	[IdSerie] NVARCHAR(50) NULL,
    NomeEpisodio NVARCHAR(100) NULL,
	DataLancamento NVARCHAR(50) NULL,
	Duracao NVARCHAR(50) NULL,
	Ativo BIT NULL DEFAULT 'true' 
    CONSTRAINT [FK_Episodio_IdSerie] 
    FOREIGN KEY ([IdSerie]) REFERENCES [Serie]([IdSerie])
)
