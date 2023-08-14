Use [master]
Go

If  exists ( select * from sys.databases where name  = 'Colegio')
		BEGIN
			USE Master;
			DROP DATABASE Colegio;
			PRINT 'BD ELIMINADA'
			Create DATABASE Colegio;
			PRINT 'BD CREADA NUEVAMENTE'
		END;
ELSE

		BEGIN
			Create DATABASE Colegio;
			PRINT 'BD CREADA'
		END;

GO

Use [Colegio]
Go




PRINT 'SE CREARAN LAS TABLAS CON SUS LLAVES PRIMARIAS'
----- Tabla  Alumno ----

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



CREATE TABLE Materia (
	MateriaId int NOT NULL IDENTITY,
	Nombre nvarchar(120) NOT NULL
	
);

ALTER TABLE Materia
ADD CONSTRAINT PK_Materia PRIMARY KEY (MateriaId);


CREATE TABLE Docentes
(
DocenteId int NOT NULL  IDENTITY,
Nombre    nvarchar(120) NOT NULL,
Direccion nvarchar(120) NOT NULL,
FchNacimiento datetime2 NOT NULL
);

ALTER TABLE  Docentes
ADD CONSTRAINT PK_Docente PRIMARY KEY (DocenteId);

CREATE TABLE AlumnoMateria(
AlumnoMatId int NOT NULL IDENTITY,
AlumnoId    int NOT NULL,
MateriaId   int NOT NULL
);

 ALTER TABLE  AlumnoMateria
 ADD CONSTRAINT PK_AlumnoMateria PRIMARY KEY (AlumnoMatId)

CREATE TABLE  Nota(
NotaId    int NOT NULL IDENTITY,
AlumnoId  int NOT NULL,
MateriaId int NOT NULL,
Nota      numeric(7,2) NOT NULL 
);


ALTER TABLE Nota
ADD CONSTRAINT PK_Nota PRIMARY KEY (NotaId)


PRINT 'SE  INSERTARAN REGISTROS A LAS TABLAS'

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Jose Mario Perez Lopez', 'Calle los Abetos pasaje 3 Mejicanos', '01-01-2010', 3.5, 1 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Maria Jose Martinez Lara', 'Avenida las Camelias pasaje Pinto Zacamil', '03-05-2011', 8, 1 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Gustavo Alonso Pacas Sanches', 'Residencia el  Carmen Soyapango', '08-11-2010', 4.2, 4 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Luis Alfredo Landaverde', 'Urbanizacion Calle nueva el pino', '07-11-2012', 8.9, 4 )




-------------------Tabla Docentes -----------------------------------





INSERT INTO Docentes (Nombre, Direccion,  FchNacimiento )
VALUES ('Josefina Lucia Lopez', 'Residencial Villa  Dolores', '10-23-1970')

INSERT INTO Docentes (Nombre, Direccion,  FchNacimiento )
VALUES ('Karina Bustamente', 'Calle a Mejicanos casa 10', '03-26-1982')

INSERT INTO Docentes (Nombre, Direccion,  FchNacimiento )
VALUES ('Enrique Adolfo Martinez', 'Avenida Dolores  Castellanos', '02-17-1985')

INSERT INTO Docentes (Nombre, Direccion,  FchNacimiento )
VALUES ('Isaac Isabel Villanueva', 'Calle  Federico  casa 22', '11-19-1986')




---------Tabla  Materia---------------------------------




INSERT INTO Materia (Nombre)
VALUES ('Fisica');

INSERT INTO Materia (Nombre)
VALUES ('Matematicas');

INSERT INTO Materia (Nombre)
VALUES ('Computacion');

INSERT INTO Materia (Nombre)
VALUES ('Sociales');




--------- AlumnoMateria ------



INSERT INTO AlumnoMateria (AlumnoId, MateriaId )
VALUES (1,2)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId )
VALUES (1,2)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId )
VALUES (1,3)

--------------Tabla Nota---------------------





INSERT INTO Nota (AlumnoId, MateriaId, Nota) VALUES (1,1, 4.5)

INSERT INTO Nota (AlumnoId, MateriaId, Nota) VALUES (1,2, 7.8)

INSERT INTO Nota (AlumnoId, MateriaId, Nota) VALUES (1,3, 8.9)

INSERT INTO Nota (AlumnoId, MateriaId, Nota) VALUES (1,4, 7.0)

INSERT INTO Nota (AlumnoId, MateriaId, Nota) VALUES (2,1, 6.5)

INSERT INTO Nota (AlumnoId, MateriaId, Nota) VALUES (2,2, 9.6)

INSERT INTO Nota (AlumnoId, MateriaId, Nota) VALUES (2,3, 7.5)

INSERT INTO Nota (AlumnoId, MateriaId, Nota) VALUES (2,4, 6.3)

PRINT 'SE AGREGARAN LAS LLAVES PRIMARIAS'

-----Llaves  Foraneas


ALTER TABLE AlumnoMateria
ADD CONSTRAINT FK_AlumnoMateria_Materia_MateriaId FOREIGN KEY(MateriaId)
REFERENCES Materia (MateriaId) ON DELETE CASCADE;


ALTER TABLE AlumnoMateria
ADD CONSTRAINT FK_AlumnoMateria_Alumno_AlumnoId FOREIGN KEY (AlumnoId)
REFERENCES Alumno(AlumnoId) ON DELETE CASCADE;

ALTER TABLE Nota
ADD CONSTRAINT FK_Nota_Alumno_AlumnoId FOREIGN KEY (AlumnoId)
REFERENCES Alumno(AlumnoId) ON DELETE CASCADE;

ALTER TABLE Nota
ADD CONSTRAINT FK_Nota_Materia_MateriaId FOREIGN KEY(MateriaId)
REFERENCES Materia(MateriaId) ON DELETE CASCADE;

--------


USE Colegio
GO
CREATE PROCEDURE NotasRangoAlumnos
	@notaini numeric,
	@notafin numeric
AS
select a.nombre, a.direccion,a.FchNacimiento, b.nombre as materia, a.nota  
from alumno a, materia b
where a.MateriaId = b.MateriaId
and a.nota  >= @notaini and  a.nota <= @notafin
GO
