SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Administrador`;
DROP TABLE IF EXISTS `Paciente`;
DROP TABLE IF EXISTS `Medico`;
DROP TABLE IF EXISTS `Tecnico`;
DROP TABLE IF EXISTS `Cita`;
DROP TABLE IF EXISTS `Historial_Medico`;
DROP TABLE IF EXISTS `mensajes`;
DROP TABLE IF EXISTS `Notificacion`;
DROP TABLE IF EXISTS `Pago`;
DROP TABLE IF EXISTS `recetas_medicas`;
DROP TABLE IF EXISTS `Reporte`;
SET FOREIGN_KEY_CHECKS = 1;

SET NAMES utf8mb4;

-- ========================================================
-- 1. ENTIDADES PRINCIPALES (Usuarios e Infraestructura)
-- ========================================================

CREATE TABLE `Administrador` (
  `id_administrador` INT(11) NOT NULL AUTO_INCREMENT,
  `curp` VARCHAR(18) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_P` VARCHAR(50) NOT NULL,
  `apellido_M` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('MASCULINO','FEMENINO') NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `numero_domicilio` VARCHAR(10) NOT NULL,
  `calle` VARCHAR(50) NOT NULL,
  `colonia` VARCHAR(50) NOT NULL,
  `Municipio` VARCHAR(50) NOT NULL,
  `cp` VARCHAR(50) NOT NULL,
  `departamento` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_administrador`),
  UNIQUE KEY `uk_admin_curp` (`curp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Paciente` (
  `id_paciente` INT(11) NOT NULL AUTO_INCREMENT,
  `curp` VARCHAR(18) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_P` VARCHAR(50) NOT NULL,
  `apellido_M` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('MASCULINO','FEMENINO') NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `numero_domicilio` VARCHAR(10) NOT NULL,
  `calle` VARCHAR(50) NOT NULL,
  `colonia` VARCHAR(50) NOT NULL,
  `Municipio` VARCHAR(50) NOT NULL,
  `cp` VARCHAR(50) NOT NULL,
  `nss` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `uk_paciente_curp` (`curp`),
  UNIQUE KEY `uk_paciente_nss` (`nss`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Medico` (
  `id_medico` INT(11) NOT NULL AUTO_INCREMENT,
  `curp` VARCHAR(18) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_P` VARCHAR(50) NOT NULL,
  `apellido_M` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('MASCULINO','FEMENINO') NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `numero_domicilio` VARCHAR(10) NOT NULL,
  `calle` VARCHAR(50) NOT NULL,
  `colonia` VARCHAR(50) NOT NULL,
  `Municipio` VARCHAR(50) NOT NULL,
  `cp` VARCHAR(50) NOT NULL,
  `especialidad` VARCHAR(100) NOT NULL,
  `cedula_profesional` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_medico`),
  UNIQUE KEY `uk_medico_curp` (`curp`),
  UNIQUE KEY `uk_medico_cedula` (`cedula_profesional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Tecnico` (
  `id_tecnico` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_P` VARCHAR(50) NOT NULL,
  `apellido_M` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('Masculino','Femenino') NOT NULL,
  `estatus_report` ENUM('Pendiente','En proceso','Resuelto') NOT NULL,
  PRIMARY KEY (`id_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ========================================================
-- 2. OPERACIONES, MEDIOS Y SEGUIMIENTO
-- ========================================================

CREATE TABLE `Cita` (
  `id_cita` INT(11) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(20) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `estatus` ENUM('Agendada','Pendiente','Realizada','Cancelada') NOT NULL,
  `motivo_reag` VARCHAR(250) DEFAULT NULL,
  `id_paciente` INT(11) DEFAULT NULL,
  `id_medico` INT(11) DEFAULT NULL,
  `fecha_cita` DATETIME NOT NULL,
  `metodo_cita` ENUM('Videollamada','Chat en linea') NOT NULL,
  PRIMARY KEY (`id_cita`),
  UNIQUE KEY `uk_cita_codigo` (`codigo`),
  CONSTRAINT `fk_cita_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE,
  CONSTRAINT `fk_cita_medico` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Historial_Medico` (
  `id_historial_medico` INT(11) NOT NULL AUTO_INCREMENT,
  `antecedentes` TEXT DEFAULT NULL,
  `id_paciente` INT(11) DEFAULT NULL,
  `id_cita` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id_historial_medico`),
  CONSTRAINT `fk_historial_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE,
  CONSTRAINT `fk_historial_cita` FOREIGN KEY (`id_cita`) REFERENCES `Cita` (`id_cita`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `mensajes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_emisor` INT(11) NOT NULL,
  `id_receptor` INT(11) NOT NULL,
  `mensaje` TEXT NOT NULL,
  `fecha` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Notificacion` (
  `id_notificacion` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('Cita','Reporte','Medica') NOT NULL,
  `fecha_envio` DATE NOT NULL,
  `id_cita` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id_notificacion`),
  CONSTRAINT `fk_notificacion_cita` FOREIGN KEY (`id_cita`) REFERENCES `Cita` (`id_cita`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Pago` (
  `id_pago` INT(11) NOT NULL AUTO_INCREMENT,
  `metodo` VARCHAR(40) DEFAULT NULL,
  `token_pago` VARCHAR(255) NOT NULL COMMENT 'Token seguro devuelto por Stripe/PayPal/MercadoPago',
  `concepto` VARCHAR(50) NOT NULL,
  `monto` DECIMAL(10,2) NOT NULL,
  `banco` VARCHAR(50) NOT NULL,
  `id_paciente` INT(11) DEFAULT NULL,
  `id_medico` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  CONSTRAINT `fk_pago_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE,
  CONSTRAINT `fk_pago_medico` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `recetas_medicas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` INT(11) NOT NULL,
  `id_medico` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `solicitud` TEXT NOT NULL,
  `firma` VARCHAR(255) DEFAULT NULL,
  `contacto` VARCHAR(255) DEFAULT NULL,
  `fecha_creacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_receta_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`),
  CONSTRAINT `fk_receta_medico` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Reporte` (
  `id_reporte` INT(11) NOT NULL AUTO_INCREMENT,
  `categoria` ENUM('Financiero','Técnico','Administrativo','Otro') NOT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `fecha` DATE NOT NULL,
  `id_administrador` INT(11) DEFAULT NULL,
  `id_paciente` INT(11) DEFAULT NULL,
  `id_tecnico` INT(11) DEFAULT NULL,
  `id_medico` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id_reporte`),
  CONSTRAINT `fk_reporte_admin` FOREIGN KEY (`id_administrador`) REFERENCES `Administrador` (`id_administrador`) ON DELETE CASCADE,
  CONSTRAINT `fk_reporte_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE,
  CONSTRAINT `fk_reporte_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `Tecnico` (`id_tecnico`) ON DELETE CASCADE,
  CONSTRAINT `fk_reporte_medico` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

COMMIT;
