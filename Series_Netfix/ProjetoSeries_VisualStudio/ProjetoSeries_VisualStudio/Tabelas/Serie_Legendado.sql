CREATE TABLE [dbo].[Serie_Legendado]
(
	[IdSerie] NVARCHAR(50) NOT NULL , 
    [IdIdiomaLegendado] NVARCHAR(50) NOT NULL, 
    PRIMARY KEY ([IdSerie], [IdIdiomaLegendado]), 
    CONSTRAINT [FK_Serie_Legendado_ToTable] FOREIGN KEY ([IdSerie]) 
    REFERENCES [Serie]([IdSerie]), 
    CONSTRAINT [FK_Serie_Legendado_ToTable_1] FOREIGN KEY ([IdIdiomaLegendado]) 
    REFERENCES [IdiomaLegendado]([IdIdiomaLegendado])
)
