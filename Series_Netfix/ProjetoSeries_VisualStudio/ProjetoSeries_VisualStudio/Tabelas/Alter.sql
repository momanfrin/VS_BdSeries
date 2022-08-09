USE DbSeries

GO
ALTER TABLE Serie
DROP COLUMN [IdDiretor];
ALTER TABLE Serie
DROP COLUMN [IdProdutora];
ALTER TABLE Serie
DROP COLUMN [IdPaisOrigem];
ALTER TABLE Serie
ADD Criadores VARCHAR(200);
ALTER TABLE Serie
ADD Genero INT;
GO