CREATE TABLE [dbo].[Serie_Dublado]
(
	[IdSerie] NVARCHAR(50) NOT NULL , 
    [IdIdiomaDublado] NVARCHAR(50) NOT NULL, 
    PRIMARY KEY ([IdSerie], [IdIdiomaDublado]), 
    CONSTRAINT [FK_Serie_Dublado_IdSerie] FOREIGN KEY ([IdSerie]) 
    REFERENCES [Serie]([IdSerie]), 
    CONSTRAINT [FK_Serie_Dublado_IdIdiomaDublado] FOREIGN KEY (IdIdiomaDublado) 
    REFERENCES [IdiomaDublado](IdIdiomaDublado)
)
