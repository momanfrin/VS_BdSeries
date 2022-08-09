CREATE TABLE [dbo].[Serie_Genero]
(
	[IdSerie] NVARCHAR(50) NOT NULL , 
    [IdGenero] NVARCHAR(50) NOT NULL, 
    PRIMARY KEY ([IdSerie], [IdGenero]), 
    CONSTRAINT [FK_Serie_Genero_IdSerie] 
    FOREIGN KEY ([IdSerie]) REFERENCES [Serie]([IdSerie]), 
    CONSTRAINT [FK_Serie_Genero_IdGenero] 
    FOREIGN KEY ([IdGenero]) REFERENCES [Genero]([IdGenero])
)
