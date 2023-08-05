CREATE TABLE Alumno(
AlumnoId int NOT NULL IDENTITY,
Nombre nvarchar(120) NOT NULL,
Direccion nvarchar(120) NOT NULL,
FchNacimiento datetime2 NOT NULL,
ImagenUrl nvarchar(200),
Nota numeric(7,2) NOT NULL,
MateriaId int  NOT NULL
);

ALTER TABLE Alumno
ADD CONSTRAINT PK_Alumno PRIMARY KEY (AlumnoId);

ALTER TABLE Alumno
ADD CONSTRAINT KF_Alumno_Materia_MateriaId FOREIGN KEY(MateriaId)
REFERENCES Materia (MateriaId) ON DELETE CASCADE;