-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-06-2025 a las 01:15:43
-- Versión del servidor: 10.11.10-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u138346358_u138346358_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Administrador`
--

CREATE TABLE `Administrador` (
  `id_administrador` int(11) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_P` varchar(50) NOT NULL,
  `apellido_M` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('MASCULINO','FEMENINO') NOT NULL,
  `email` varchar(100) NOT NULL,
  `numero_domicilio` varchar(10) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `Municipio` varchar(50) NOT NULL,
  `cp` varchar(50) NOT NULL,
  `departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cita`
--

CREATE TABLE `Cita` (
  `id_cita` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estatus` enum('Agendada','Pendiente','Realizada','Cancelada') NOT NULL,
  `motivo_reag` varchar(250) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `fecha_cita` datetime NOT NULL,
  `hora_minutos` time NOT NULL,
  `metodo_cita` enum('Videollamada','Chat en linea') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Cita`
--

INSERT INTO `Cita` (`id_cita`, `codigo`, `descripcion`, `estatus`, `motivo_reag`, `id_paciente`, `id_medico`, `fecha_cita`, `hora_minutos`, `metodo_cita`) VALUES
(1, 'CITA1748391484', 'Chequeo general', 'Cancelada', NULL, 1, 1, '2025-05-28 08:00:00', '08:00:00', 'Videollamada'),
(2, 'CITA1748392058', 'General', 'Agendada', NULL, 1, 1, '2025-05-28 08:30:00', '08:30:00', 'Videollamada'),
(3, 'CITA1748402799', 'Chat para seguimiento de resultados', 'Agendada', NULL, 1, 1, '2025-05-29 09:30:00', '09:30:00', 'Chat en linea'),
(4, 'CITA1748408616', 'me duele la nariz', 'Agendada', 'Me siento mal', 2, 1, '2025-05-31 00:00:00', '08:00:00', 'Videollamada'),
(5, 'CITA1748410778', 'General', 'Agendada', NULL, 1, 1, '2025-06-01 08:00:00', '08:00:00', 'Videollamada'),
(6, 'CITA1748464025', 'Consulta general', 'Agendada', NULL, 1, 1, '2025-05-28 15:00:00', '15:00:00', 'Videollamada'),
(7, 'CITA1748465249', 'General', 'Agendada', NULL, 1, 1, '2025-05-28 15:30:00', '15:30:00', 'Videollamada'),
(8, 'CITA1748468445', 'Revision general', 'Agendada', NULL, 1, 1, '2025-05-28 16:00:00', '16:00:00', 'Videollamada'),
(9, 'CITA1748476658', 'Traigo mal de amoress', 'Agendada', NULL, 1, 3, '2025-05-30 09:30:00', '09:30:00', 'Chat en linea'),
(10, 'CITA1748483275', 'Consulta de seguimiento para tratamiento', 'Agendada', NULL, 1, 1, '2025-05-30 08:00:00', '08:00:00', 'Chat en linea'),
(11, 'CITA1748567833', 'Consulta general', 'Agendada', NULL, 1, 1, '2025-05-30 17:30:00', '17:30:00', 'Chat en linea'),
(12, 'CITA1748569319', 'Consulta general', 'Agendada', NULL, 1, 1, '2025-05-30 11:30:00', '11:30:00', 'Chat en linea'),
(13, 'CITA1748570694', 'consulta general', 'Agendada', NULL, 1, 3, '2025-05-31 17:30:00', '17:30:00', 'Chat en linea'),
(14, 'CITA1748572075', 'consulta general', 'Agendada', NULL, 1, 3, '2025-06-01 08:00:00', '08:00:00', 'Videollamada'),
(15, 'CITA1748574826', 'Pa algo', 'Agendada', NULL, 1, 1, '2025-05-30 17:00:00', '17:00:00', 'Videollamada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Historial_Medico`
--

CREATE TABLE `Historial_Medico` (
  `id_historial_medico` int(11) NOT NULL,
  `antecedentes` text DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_cita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Medico`
--

CREATE TABLE `Medico` (
  `id_medico` int(11) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_P` varchar(50) NOT NULL,
  `apellido_M` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('MASCULINO','FEMENINO') NOT NULL,
  `email` varchar(100) NOT NULL,
  `numero_domicilio` varchar(10) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `Municipio` varchar(50) NOT NULL,
  `cp` varchar(50) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `cedula_profesional` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Medico`
--

INSERT INTO `Medico` (`id_medico`, `curp`, `password`, `nombre`, `apellido_P`, `apellido_M`, `fecha_nacimiento`, `sexo`, `email`, `numero_domicilio`, `calle`, `colonia`, `Municipio`, `cp`, `especialidad`, `cedula_profesional`) VALUES
(1, 'LOPE010203HDFNRN07', '$2y$10$qTTtg7dKiZdFHobd2kik1.6UQc3eft1ePzqJVWLDlrY.BfH0J2Xai', 'Azael', 'Govea', 'Vasques', '2003-07-29', 'MASCULINO', 'santilacostra@gmail.com', '44', 'Tajin', 'Teresa Morales', 'Coatzacoalcos', '96530', 'Cardiología', '1234567'),
(3, 'MALH040729HVZRSCA5', '$2y$10$CPcqlkhIt9cN7UhjLPoULOaRfzHiOw39mwj8NjAcEVxcCML1fM0su', 'Hecto Daniel', 'Martinez', 'Luis', '2004-07-29', 'MASCULINO', 'isic22.hmartinezl@itesco.edu.mx', '12', 'BELLAVISTA', 'FONHAPO', 'Coatzacoalcos', '96380', 'Medico Cirujano', '7932181');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `emisor` varchar(100) DEFAULT NULL,
  `receptor` varchar(100) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `emisor`, `receptor`, `mensaje`, `fecha`) VALUES
(1, 'Ivan', 'Hugo', 'Hola paciente', '2025-05-28 04:16:50'),
(2, 'Azael', 'Hugo', 'Hola hugo', '2025-05-28 04:50:35'),
(3, 'Hugo', 'Azael', 'Hola doctor', '2025-05-28 04:51:05'),
(4, 'Azael', 'Hugo', 'hola', '2025-05-28 05:01:02'),
(5, 'Hugo', 'Azael', 'hola doctor', '2025-05-28 20:09:10'),
(6, 'Azael', 'Hugo', 'holaaa', '2025-05-28 20:09:27'),
(7, 'Hugo', 'Azael', 'hola', '2025-05-28 20:56:19'),
(8, 'Azael', 'Hugo', 'hola', '2025-05-28 20:56:32'),
(9, 'Azael', 'Hector', 'hola', '2025-05-29 00:05:45'),
(10, 'Héctor', 'Azael', 'Ando con mal de amores que puedo hacer', '2025-05-29 00:08:15'),
(11, 'Héctor', 'Azael', 'Help mee', '2025-05-29 00:08:27'),
(12, 'Azael', 'Hector', 'Un paracetamol cada 8 horas', '2025-05-29 00:08:32'),
(13, 'Azael', 'Hector', 'con eso jala chido', '2025-05-29 00:08:38'),
(14, 'Héctor', 'Azael', 'Y ya?', '2025-05-29 00:08:39'),
(15, 'Azael', 'Hector', 'Claro son $200', '2025-05-29 00:08:53'),
(16, 'Héctor', 'Azael', 'Mejor voy al simi', '2025-05-29 00:09:02'),
(17, 'Azael', 'Hector', 'Weno', '2025-05-29 00:09:08'),
(18, 'Azael', 'Hector', 'JAJJAAJ yaaaaa', '2025-05-29 00:09:12'),
(19, 'Héctor', 'Azael', 'Gracias por nada :(', '2025-05-29 00:09:16'),
(20, 'Azael', 'Hector', 'Weno', '2025-05-29 00:09:22'),
(21, 'Héctor', 'Azael', 'Vamos por unos tacos doc', '2025-05-29 00:09:30'),
(22, 'Azael', 'Hector', 'ahi me pagas la consulta porfa', '2025-05-29 00:09:35'),
(23, 'Azael', 'Hector', 'Vamossss', '2025-05-29 00:09:39'),
(24, 'Héctor', 'Azael', 'Te estoy invitando y andas pidiendo dinero', '2025-05-29 00:09:50'),
(25, 'Azael', 'Hector', 'AJAJJAJJ', '2025-05-29 00:10:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Notificacion`
--

CREATE TABLE `Notificacion` (
  `id_notificacion` int(11) NOT NULL,
  `tipo` enum('Cita','Reporte','Medica') NOT NULL,
  `fecha_envio` date NOT NULL,
  `id_cita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Paciente`
--

CREATE TABLE `Paciente` (
  `id_paciente` int(11) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_P` varchar(50) NOT NULL,
  `apellido_M` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('MASCULINO','FEMENINO') NOT NULL,
  `email` varchar(100) NOT NULL,
  `numero_domicilio` varchar(10) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `Municipio` varchar(50) NOT NULL,
  `cp` varchar(50) NOT NULL,
  `nss` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Paciente`
--

INSERT INTO `Paciente` (`id_paciente`, `curp`, `password`, `nombre`, `apellido_P`, `apellido_M`, `fecha_nacimiento`, `sexo`, `email`, `numero_domicilio`, `calle`, `colonia`, `Municipio`, `cp`, `nss`) VALUES
(1, 'JIRH041013HVZMDGA2', '$2y$10$BdVXB0q0WmZxF08Wh0W83eQAuL/221xboTnEIHDwdmZsF7TE2zsZC', 'Hugo Santiago', 'Jimenez', 'Rueda', '2004-10-13', 'MASCULINO', 'hugo18057@gmail.com', '55', 'Boulevard del Bosque', 'Pensiones', 'Coatzacoalcos', '96530', '12239854711'),
(2, 'VIEE040729HVZDNRA7', '$2y$10$hmU4t88e5tSGDgrabtY41.MUaUkQpMs0.W1XmVRercSiQ4dJDf.Ky', 'ERIC', 'VIDAL', 'CARDENAS', '1997-03-03', 'MASCULINO', 'ericvidal04@hotmail.com', '1', 'llave', 'nose ', 'Acuitzio', '96410', '74190498050'),
(4, 'MALH040729HVZRSCA6', '$2y$10$EEE03earGV9PlWsMrcO5Jul/mpcaz2FIC.1tKNQHnarEhh.dpdVbG', 'Hanny Gissell', 'Gomez', 'Santiago', '2004-03-15', 'FEMENINO', 'gissell14santi@gmail.com', 'S/N', 'Cuahutemoc', 'Zapotal', 'Oteapan', '96330', '46127209461'),
(5, 'HAAP040615HVZXGDA2', '$2y$10$3Ssbm.3bZm6Ywfgnn6XA2.tKK.Xw8RsSUKbILZOSvLhAeUS1foOpC', 'Pedro ', 'Hau', 'Aguirre', '2004-06-15', 'MASCULINO', 'pedrito@gmail.com', '8', 'Fresno', 'Pensiones', 'Coatzacoalcos', '96530', '75190419988'),
(6, 'COLH040729HVZRSCA5', '$2y$10$Kwlq8bUHdMf33t6dmamhXOFJlQPQSN1TNEjeb5nV1AoMr6smjVX5y', 'Ariana', 'Colorado ', 'Grande', '2005-08-18', 'FEMENINO', 'isic22.acolg@itesco.edu.mx', '12', 'BELLAVISTA', 'FONHAPO', 'Coatzacoalcos', '96380', '05130268179');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pago`
--

CREATE TABLE `Pago` (
  `id_pago` int(11) NOT NULL,
  `metodo` varchar(40) DEFAULT NULL,
  `numero_cuenta` varchar(24) NOT NULL,
  `concepto` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `banco` varchar(50) NOT NULL,
  `fecha_expiracion` date NOT NULL,
  `cvv` varchar(4) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Pago`
--

INSERT INTO `Pago` (`id_pago`, `metodo`, `numero_cuenta`, `concepto`, `monto`, `banco`, `fecha_expiracion`, `cvv`, `id_paciente`, `id_medico`) VALUES
(1, 'Tarjeta crédito', '4567891023456789', 'Consulta', 100.00, 'Tarjeta crédito', '0000-00-00', '123', 1, NULL),
(2, 'Tarjeta crédito', '4567891023456789', 'Pago consulta', 100.00, 'Tarjeta crédito', '0000-00-00', '123', 1, NULL),
(3, 'Tarjeta crédito', '4567891023456789', 'Pago', 100.00, 'Tarjeta crédito', '0000-00-00', '123', 1, NULL),
(4, 'Tarjeta débito', '4567891023456789', 'pago', 100.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(5, 'Tarjeta débito', '4567891023456789', 'pago', 100.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(6, 'Tarjeta débito', '4567891023456789', 'Pago', 100.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(7, 'Tarjeta débito', '4567891023456789', 'pago', 199.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(8, 'Tarjeta débito', '4567891023456789', 'pago', 100.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(9, 'Tarjeta débito', '4567891023456789', 'pago', 100.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(10, 'Tarjeta débito', '4567891023456789', 'Pago', 100.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(11, 'Tarjeta débito', '4567891023456789', 'pago', 100.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(12, 'Tarjeta débito', '4567891023456789', 'Pago consulta', 150.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(13, 'Tarjeta crédito', '4169160859032843', 'membresia', 200.00, 'Tarjeta crédito', '0000-00-00', '123', NULL, 1),
(14, 'PayPal', '4929123456789012', 'Pago membresia', 200.00, 'PayPal', '0000-00-00', '123', NULL, 1),
(15, 'Tarjeta débito', '4929123456789012', 'membresia', 200.00, 'Tarjeta débito', '0000-00-00', '123', NULL, 1),
(16, 'Tarjeta débito', '1982657483916235', 'membresia', 200.00, 'Tarjeta débito', '0000-00-00', '123', NULL, 1),
(17, 'Tarjeta débito', '1982734667345645', 'membresia', 200.00, 'Tarjeta débito', '0000-00-00', '123', NULL, 1),
(18, 'Tarjeta débito', '1234567234561645', 'pago de consulta', 70.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(19, 'Tarjeta débito', '3462857462346758', 'pago de consulta', 70.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(20, 'Tarjeta débito', '1234523671234567', 'pago de consulta', 70.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL),
(21, 'Transferencia bancaria', '4142476882627191', 'Cita', 500.00, 'Transferencia bancaria', '0000-00-00', '567', 1, NULL),
(22, 'Tarjeta débito', '4169160859032841', 'Consulta medica', 70.00, 'Tarjeta débito', '0000-00-00', '123', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas_medicas`
--

CREATE TABLE `recetas_medicas` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre_paciente` varchar(255) NOT NULL,
  `solicitud` text NOT NULL,
  `firma` varchar(255) DEFAULT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetas_medicas`
--

INSERT INTO `recetas_medicas` (`id`, `id_paciente`, `id_medico`, `fecha`, `nombre_paciente`, `solicitud`, `firma`, `contacto`, `fecha_creacion`) VALUES
(1, 1, 1, '2025-05-28', 'Hugo Santiago Jimenez Rueda', 'Tomar lecha para desparacitar jaj', NULL, NULL, '2025-05-28 03:38:00'),
(2, 1, 1, '2025-05-30', 'Hugo Santiago Jimenez Rueda', 'Tomar una tableta de Paracetamol cada 8 hrs', NULL, NULL, '2025-05-29 01:56:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reporte`
--

CREATE TABLE `Reporte` (
  `id_reporte` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `categoria` enum('Financiero','Técnico','Administrativo','Otro') NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date NOT NULL,
  `id_administrador` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Reporte`
--

INSERT INTO `Reporte` (`id_reporte`, `nombre`, `email`, `categoria`, `descripcion`, `fecha`, `id_administrador`, `id_paciente`, `id_tecnico`, `id_medico`) VALUES
(1, 'Hecto Daniel', 'isic22.hmartinezl@itesco.edu.mx', 'Financiero', '2222', '2025-04-14', NULL, NULL, NULL, 1),
(2, '', '', 'Financiero', '', '2025-02-17', NULL, NULL, NULL, 1),
(3, '', '', 'Técnico', '', '2025-02-18', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tecnico`
--

CREATE TABLE `Tecnico` (
  `id_tecnico` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('Masculino','Femenino') NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_P` varchar(50) NOT NULL,
  `apellido_M` varchar(50) NOT NULL,
  `estatus_report` enum('Pendiente','En proceso','Resuelto') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Administrador`
--
ALTER TABLE `Administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `curp` (`curp`);

--
-- Indices de la tabla `Cita`
--
ALTER TABLE `Cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `Historial_Medico`
--
ALTER TABLE `Historial_Medico`
  ADD PRIMARY KEY (`id_historial_medico`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_cita` (`id_cita`);

--
-- Indices de la tabla `Medico`
--
ALTER TABLE `Medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `curp` (`curp`),
  ADD UNIQUE KEY `cedula_profesional` (`cedula_profesional`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Notificacion`
--
ALTER TABLE `Notificacion`
  ADD PRIMARY KEY (`id_notificacion`),
  ADD KEY `id_cita` (`id_cita`);

--
-- Indices de la tabla `Paciente`
--
ALTER TABLE `Paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `curp` (`curp`),
  ADD UNIQUE KEY `nss` (`nss`);

--
-- Indices de la tabla `Pago`
--
ALTER TABLE `Pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `fk_pago_medico` (`id_medico`);

--
-- Indices de la tabla `recetas_medicas`
--
ALTER TABLE `recetas_medicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `Reporte`
--
ALTER TABLE `Reporte`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `id_administrador` (`id_administrador`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_tecnico` (`id_tecnico`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Indices de la tabla `Tecnico`
--
ALTER TABLE `Tecnico`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Administrador`
--
ALTER TABLE `Administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cita`
--
ALTER TABLE `Cita`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `Historial_Medico`
--
ALTER TABLE `Historial_Medico`
  MODIFY `id_historial_medico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Medico`
--
ALTER TABLE `Medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `Notificacion`
--
ALTER TABLE `Notificacion`
  MODIFY `id_notificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Paciente`
--
ALTER TABLE `Paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Pago`
--
ALTER TABLE `Pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `recetas_medicas`
--
ALTER TABLE `recetas_medicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Reporte`
--
ALTER TABLE `Reporte`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Tecnico`
--
ALTER TABLE `Tecnico`
  MODIFY `id_tecnico` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cita`
--
ALTER TABLE `Cita`
  ADD CONSTRAINT `Cita_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `Cita_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Historial_Medico`
--
ALTER TABLE `Historial_Medico`
  ADD CONSTRAINT `Historial_Medico_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `Historial_Medico_ibfk_2` FOREIGN KEY (`id_cita`) REFERENCES `Cita` (`id_cita`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Notificacion`
--
ALTER TABLE `Notificacion`
  ADD CONSTRAINT `Notificacion_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `Cita` (`id_cita`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Pago`
--
ALTER TABLE `Pago`
  ADD CONSTRAINT `Pago_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pago_medico` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`) ON DELETE CASCADE;

--
-- Filtros para la tabla `recetas_medicas`
--
ALTER TABLE `recetas_medicas`
  ADD CONSTRAINT `recetas_medicas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`),
  ADD CONSTRAINT `recetas_medicas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`);

--
-- Filtros para la tabla `Reporte`
--
ALTER TABLE `Reporte`
  ADD CONSTRAINT `Reporte_ibfk_1` FOREIGN KEY (`id_administrador`) REFERENCES `Administrador` (`id_administrador`) ON DELETE CASCADE,
  ADD CONSTRAINT `Reporte_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `Paciente` (`id_paciente`) ON DELETE CASCADE,
  ADD CONSTRAINT `Reporte_ibfk_3` FOREIGN KEY (`id_tecnico`) REFERENCES `Tecnico` (`id_tecnico`) ON DELETE CASCADE,
  ADD CONSTRAINT `Reporte_ibfk_4` FOREIGN KEY (`id_medico`) REFERENCES `Medico` (`id_medico`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
