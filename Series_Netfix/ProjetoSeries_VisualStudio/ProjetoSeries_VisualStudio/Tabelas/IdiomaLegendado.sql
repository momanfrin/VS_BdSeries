CREATE TABLE [dbo].[IdiomaLegendado]
(
	[IdIdiomaLegendado] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [NomeIdiomaLegendado] NVARCHAR(100) NULL, 
    [Ativo] BIT NULL DEFAULT 'true'
)
