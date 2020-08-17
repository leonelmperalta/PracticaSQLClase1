CREATE DATABASE practica;

USE practica;

CREATE TABLE departamentos(
	codDepto VARCHAR(4) NOT NULL,
    	nombreDpto VARCHAR(20) NOT NULL,
    	ciudad VARCHAR(15),
   	PRIMARY KEY(codDepto)
);

CREATE TABLE jefes(
	jefeID VARCHAR(12) NOT NULL,
	nombreJF VARCHAR(30),
	apellidoJF VARCHAR(30),
	PRIMARY KEY(jefeID)
);

CREATE TABLE empleados(
	nDIEmp VARCHAR(12) NOT NULL,
    	nomEMP VARCHAR(30) NOT NULL,
    	sexEMP CHAR(1) NOT NULL,
    	fecNac DATE NOT NULL,
    	fecIncorporacion DATE NOT NULL,
    	salEMP FLOAT NOT NULL,
    	comisionE FLOAT NOT NULL,
    	cargoE VARCHAR(15) NOT NULL,
    	jefeID VARCHAR(12),
    	codDepto VARCHAR(4) NOT NULL,
    	PRIMARY KEY(nDIEmp),
    	FOREIGN KEY(codDepto) REFERENCES departamentos(codDepto),
	FOREIGN KEY(jefeID) REFERENCES jefes(jefeID)
);



