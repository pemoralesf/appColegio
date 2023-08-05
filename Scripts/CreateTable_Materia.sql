CREATE TABLE Materia (
	MateriaId int NOT NULL IDENTITY,
	Nombre nvarchar(120) NOT NULL
	
);


ALTER TABLE Materia
ADD CONSTRAINT PK_Materia PRIMARY KEY (MateriaId);