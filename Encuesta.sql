/* CREACI�N DE BASE DE DATOS ENCUESTA */
CREATE DATABASE ENCUESTA
GO

USE ENCUESTA

/* CREACI�N DE TABLA DE REGISTRO DE ENCUESTA */
CREATE TABLE RegistroEncuesta
(
	IdEncuesta INT IDENTITY(1,1) PRIMARY KEY,
	NombreParticipante VARCHAR(50) NOT NULL,
	Edad INT NOT NULL CHECK (Edad > 18 AND Edad < 50),
	Correo VARCHAR(100) NOT NULL
)
GO
/* FIN CREACI�N DE TABLA REGISTRO DE ENCUESTA */

/* CREACI�N DE TABLA PARTIDOS */
CREATE TABLE PartidosPoliticos
(
	IdPartido INT IDENTITY(1,1) PRIMARY KEY,
	NombrePartido VARCHAR(50)
)
GO
/* FIN CREACI�N DE TABLA PARTIDOS */

/* PROCEDIMIENTOS ALMACENADOS */
CREATE PROCEDURE AgregarEncuesta
@NombreParticipante VARCHAR(50),
@Edad INT,
@Correo VARCHAR(100)
AS
	BEGIN
		INSERT INTO RegistroEncuesta VALUES (@NombreParticipante, @Edad, @Correo)
	END
GO

CREATE PROCEDURE BorrarEncuesta
@Id INT
AS
	BEGIN
		DELETE RegistroEncuesta WHERE IdEncuesta = @Id
	END
GO

CREATE PROCEDURE ConsultarEncuesta
@Id INT
AS
	BEGIN
		SELECT * FROM RegistroEncuesta WHERE IdEncuesta = @Id
	END
GO

CREATE PROCEDURE ModificarEncuesta
@Id INT,
@NombreParticipante VARCHAR(50),
@Edad INT,
@Correo VARCHAR(100)
AS
	BEGIN
		UPDATE RegistroEncuesta SET @NombreParticipante = @NombreParticipante, @Edad = Edad, @Correo = Correo  WHERE IdEncuesta = @Id
	END
GO



