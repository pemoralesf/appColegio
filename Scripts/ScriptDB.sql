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
VALUES ('Jose Mario Perez Lopez', 'Calle los Abetos pasaje 3 Mejicanos', '01-01-2010', 2.5, 1 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Jose Mario Perez Lopez', 'Calle los Abetos pasaje 3 Mejicanos', '01-01-2010', 4.0, 2 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Jose Mario Perez Lopez', 'Calle los Abetos pasaje 3 Mejicanos', '01-01-2010', 5.0, 3 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Jose Mario Perez Lopez', 'Calle los Abetos pasaje 3 Mejicanos', '01-01-2010', 3.6, 4 )



--
INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Maria Jose Martinez Lara', 'Avenida las Camelias pasaje Pinto Zacamil', '03-05-2011', 6.7, 1 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Maria Jose Martinez Lara', 'Avenida las Camelias pasaje Pinto Zacamil', '03-05-2011', 6.3, 2 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Maria Jose Martinez Lara', 'Avenida las Camelias pasaje Pinto Zacamil', '03-05-2011', 7.0, 3 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Maria Jose Martinez Lara', 'Avenida las Camelias pasaje Pinto Zacamil', '03-05-2011', 5.5, 4 )


INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Gustavo Alonso Pacas Sanches', 'Residencia el  Carmen Soyapango', '08-11-2010', 4.2, 1 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Gustavo Alonso Pacas Sanches', 'Residencia el  Carmen Soyapango', '08-11-2010', 7.0, 2 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Gustavo Alonso Pacas Sanches', 'Residencia el  Carmen Soyapango', '08-11-2010', 7.5, 3 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Gustavo Alonso Pacas Sanches', 'Residencia el  Carmen Soyapango', '08-11-2010', 6.0, 4 )



INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Luis Alfredo Landaverde', 'Urbanizacion Calle nueva el pino', '07-11-2012', 8.9, 1 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Luis Alfredo Landaverde', 'Urbanizacion Calle nueva el pino', '07-11-2012', 4.3, 2 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Luis Alfredo Landaverde', 'Urbanizacion Calle nueva el pino', '07-11-2012', 8.2, 3 )

INSERT INTO Alumno (Nombre, Direccion,  FchNacimiento, Nota, MateriaId)
VALUES ('Luis Alfredo Landaverde', 'Urbanizacion Calle nueva el pino', '07-11-2012', 5.2, 4 )


--




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



INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (1,1)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (1,2)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (1,3)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (1,4)



--

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (2,1)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (2,2)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (2,3)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (2,4)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (3,1)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (3,2)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (3,3)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (3,4)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (4,1)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (4,2)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (4,3)

INSERT INTO AlumnoMateria (AlumnoId, MateriaId ) VALUES (4,4)

---

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
from Colegio.dbo.alumno a, Colegio.dbo.materia b
where a.MateriaId = b.MateriaId
and a.nota  >= @notaini and  a.nota <= @notafin
GO


---- 20/08/2023

USE Colegio
GO
 create PROCEDURE ResultadosCalificaciones
	@notaini numeric,
	@notafin numeric
AS
select a.nombre, a.direccion,a.FchNacimiento, b.nombre as materia, a.nota,
CASE
	WHEN a.nota >= 1 AND a.nota <= 3.99 THEN 'La nota es Baja'
	WHEN a.nota >= 4 AND a.nota <= 5.99 THEN 'La nota es Regular'
	WHEN a.nota >= 6 AND a.nota <= 7.99  THEN 'La nota es Buena'
	WHEN a.nota >= 8   THEN 'La nota es Excelente'
END as Resultado
from Colegio.dbo.alumno a, Colegio.dbo.materia b
where a.MateriaId = b.MateriaId
and a.nota  >= @notaini and  a.nota <= @notafin
GO


USE Colegio
GO
CREATE PROCEDURE AddAlumnosNota
	@notaIni numeric,
	@notaFin numeric
AS
DELETE FROM Colegio.dbo.Nota WHERE nota  >= @notaini and  nota <= @notafin;
INSERT INTO Colegio.dbo.Nota (AlumnoId,Nota, MateriaId)  SELECT AlumnoId, Nota, MateriaId FROM Colegio.dbo.Alumno  WHERE nota  >= @notaini and  nota <= @notafin;
GO




---4  SEMANA----



CREATE TABLE CambioNota(
 CambioNotaId int not null IDENTITY,
 AlumnoId int not null,
 NotaAnterior numeric(7,2) NOT NULL,
 NotaActualizada numeric(7,2) NOT NULL,
 FechaCambio datetime2 not null
)

ALTER TABLE CambioNota
ADD CONSTRAINT Pk_CambioNota PRIMARY KEY (CambioNotaId);


ALTER TABLE CambioNota
ADD CONSTRAINT Pk_CambioNota_Alumno_AlumnoId FOREIGN KEY (AlumnoId)
REFERENCES Alumno (AlumnoId) ON DELETE CASCADE;

GO

USE COLEGIO
GO
CREATE TRIGGER TR_CambioNota_AfterUpdate
ON Alumno
AFTER UPDATE
AS
	IF UPDATE(Nota)
		INSERT INTO CambioNota ( AlumnoId, NotaAnterior, NotaActualizada, FechaCambio)
		SELECT i.AlumnoId, d.Nota, i.Nota, GETDATE() FROM inserted i
		JOIN deleted d ON i.AlumnoId = d.AlumnoId

GO	
--- Prueba  de  TRIGGEE:     TR_CambioNota_AfterUpdate

--update alumno set nota  = 7.0  where AlumnoId = 1
--SELECT * INTO AlumnoHis FROM  alumno  WHERE 1 = 0;

USE Colegio
GO
IF OBJECT_ID('AlumnoHis', 'U') IS  NULL 
  BEGIN
   SELECT * INTO AlumnoHis FROM  alumno  WHERE 1 = 0;                    
  END;
GO            


set identity_insert AlumnoHis on;

USE COLEGIO
GO
CREATE TRIGGER TR_AlumnoHis_AfterDelete
ON Alumno
AFTER DELETE
AS
	INSERT INTO AlumnoHis(AlumnoId, Nombre, Direccion, FchNacimiento, ImagenUrl, Nota, MateriaId)
	SELECT AlumnoId, Nombre, Direccion, FchNacimiento, ImagenUrl, Nota, MateriaId FROM deleted




---Prueba  de  DELETE 

--- insert into alumno (Nombre, Direccion, FchNacimiento,  Nota, MateriaId)
	--VALUES ('Usuario Prueba Delete', 'Calle al curso de SQL', '01-01-2023', 0.0, 1 )

--	DELETE FROM Alumno  WHERE AlumnoId = 17

--	select * from AlumnoHis
