CREATE DATABASE autoservicio_cervantes;

USE autoservicio_cervantes;

CREATE TABLE Aseguradora (
    id_aseguradora int NOT NULL,
    nombre varchar(50),
    telefono varchar(20),
    correo varchar(50),
    PRIMARY KEY (id_aseguradora)
);

CREATE TABLE Proveedor (
    id_proveedor int NOT NULL,
    nombre varchar(50),
    telefono varchar(20),
    correo varchar(50),
    PRIMARY KEY (id_proveedor)
);

CREATE TABLE Empleado (
    id_empleado int NOT NULL,
    nombre varchar(50),
    telefono varchar(20),
    correo varchar(50),
    created_at date,
    updated_at date,
    deleted_at date,
    PRIMARY KEY (id_empleado)
);

CREATE TABLE Cliente (
    id_cliente int NOT NULL,
    nombre varchar(50),
    telefono varchar(20),
    correo varchar(50),
    id_aseguradora int NOT NULL,
    PRIMARY KEY (id_cliente),
    CONSTRAINT FK_AseguradoraCliente FOREIGN KEY (id_aseguradora)
    REFERENCES Aseguradora(id_aseguradora)
);

CREATE TABLE Auto (
    id_auto int NOT NULL,
    marca varchar(50),
    modelo varchar(50),
    placas varchar(10),
    anio int,
    id_cliente int NOT NULL,
    PRIMARY KEY (id_auto),
    CONSTRAINT FK_ClienteAuto FOREIGN KEY (id_cliente)
    REFERENCES Cliente(id_cliente)
);

CREATE TABLE Pieza (
    id_pieza int NOT NULL,
    nombre varchar(50),
    existencia int,
    id_proveedor int NOT NULL,
    PRIMARY KEY (id_pieza),
    CONSTRAINT FK_ProveedorPieza FOREIGN KEY (id_proveedor)
    REFERENCES Proveedor(id_proveedor)
);

CREATE TABLE Siniestro (
    id_siniestro int NOT NULL,
    fecha date,
    estatus varchar(50),
    id_empleado int NOT NULL,
    id_auto int NOT NULL,
    id_proveedor int NOT NULL,
    PRIMARY KEY (id_siniestro),
    CONSTRAINT FK_EmpleadoSiniestro FOREIGN KEY (id_empleado)
    REFERENCES Empleado(id_empleado),
    CONSTRAINT FK_AutoSiniestro FOREIGN KEY (id_auto)
    REFERENCES Auto(id_auto),
    CONSTRAINT FK_ProveedorSiniestro FOREIGN KEY (id_proveedor)
    REFERENCES Proveedor(id_proveedor)
);