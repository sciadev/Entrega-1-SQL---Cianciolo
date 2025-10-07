CREATE DATABASE ux_management_v2;
USE ux_management_v2;

-- Tabla Agente
CREATE TABLE Agente (
    id_agente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
    -- Se podría agregar email o estado del agente en próximas versiones
);

-- Tabla Volumen
CREATE TABLE Volumen (
    id_volumen INT AUTO_INCREMENT PRIMARY KEY,
    id_agente INT,
    cantidad_tickets INT,
    FOREIGN KEY (id_agente) REFERENCES Agente(id_agente)
    -- Posible mejora: agregar NOT NULL a cantidad_tickets
);

-- Tabla Cumplimiento_SLA
CREATE TABLE Cumplimiento_SLA (
    id_SLA INT AUTO_INCREMENT PRIMARY KEY,
    id_volumen INT,
    cumple_SLA INT,
    no_cumple_SLA INT,
    FOREIGN KEY (id_volumen) REFERENCES Volumen(id_volumen)
    -- Nota: Podría agregarse restricción para que los valores sean positivos
);

-- Tabla Favorabilidad
CREATE TABLE Favorabilidad (
    id_favorabilidad INT AUTO_INCREMENT PRIMARY KEY,
    id_volumen INT,
    nivel_favorabilidad VARCHAR(50),
    FOREIGN KEY (id_volumen) REFERENCES Volumen(id_volumen)
    -- Posible mejora: definir ENUM para limitar niveles de favorabilidad
);

-- Fin del script
