--
-- Estructura de tabla para la tabla monitor`
--
CREATE TABLE monitor (
  id          INT PRIMARY KEY,
  nombre      VARCHAR2(45) NOT NULL,
  titulacion  VARCHAR2(20) NOT NULL,
  nif         VARCHAR2(9) NOT NULL
);

--
-- Volcado de datos para la tabla monitor`
--
INSERT INTO monitor VALUES (1, 'Monitor1', 'Titulación1', 'nif1');
INSERT INTO monitor VALUES (2, 'Monitor2', 'Titulación2', 'nif2');
INSERT INTO monitor VALUES (3, 'Monitor3', 'Titulación3', 'nif3');

--
-- Estructura de tabla para la tabla socio`
--
CREATE TABLE socio (
  id          INT PRIMARY KEY,
  nombre      VARCHAR2(45) NOT NULL,
  telefono    VARCHAR2(20) NOT NULL,
  email       VARCHAR2(100) NOT NULL,
  bajaSN      VARCHAR2(1)
);

--
-- Volcado de datos para la tabla socio`
--
INSERT INTO socio VALUES (1, 'Socio1', 'Teléfono1', 'E-mail1', 'N');
INSERT INTO socio VALUES (2, 'Socio2', 'Teléfono2', 'E-mail2', 'N');
INSERT INTO socio VALUES (3, 'Socio3', 'Teléfono3', 'E-mail3', 'N');
INSERT INTO socio VALUES (4, 'Socio4', 'Teléfono4', 'E-mail4', 'S');
INSERT INTO socio VALUES (5, 'Socio5', 'Teléfono5', 'E-mail5', 'N');

--
-- Estructura de tabla para la tabla actividad`
--
CREATE TABLE actividad (
  id          INT PRIMARY KEY,
  nombre      VARCHAR2(45) NOT NULL,
  tarifa      FLOAT,
  activaSN    VARCHAR2(1),
  monitor_id  INT,
  FOREIGN KEY (monitor_id) REFERENCES monitor(id) 
);

--
-- Volcado de datos para la tabla actividad`
--
INSERT INTO actividad VALUES (1, 'Actividad1', 10.5, 'S', 1);
INSERT INTO actividad VALUES (2, 'Actividad2', 9, 'S', 2);
INSERT INTO actividad VALUES (3, 'Actividad3', 12.25, 'S', 2);
INSERT INTO actividad VALUES (4, 'Actividad4', 10, 'S', 1);
INSERT INTO actividad VALUES (5, 'Actividad5', 9.5, 'S', 3);
INSERT INTO actividad VALUES (6, 'Actividad6', 8, 'N', 3);
INSERT INTO actividad VALUES (7, 'Actividad7', 10, 'N', 3);

--
-- Estructura de tabla para la tabla horario`
--
CREATE TABLE horario (
  id            INT PRIMARY KEY,
  dia           VARCHAR2(1) NOT NULL,
  hora          VARCHAR2(8) NOT NULL,
  sala          VARCHAR2(45) NOT NULL,
  actividad_id  INT,
  FOREIGN KEY (actividad_id) REFERENCES actividad(id) 
);

--
-- Volcado de datos para la tabla horario`
--
INSERT INTO horario VALUES (1, 'L', '10:00:00', 'Sala1', 1);
INSERT INTO horario VALUES (2, 'L', '18:00:00', 'Sala1', 1);
INSERT INTO horario VALUES (3, 'X', '10:00:00', 'Sala1', 1);
INSERT INTO horario VALUES (4, 'X', '18:00:00', 'Sala1', 1);
INSERT INTO horario VALUES (5, 'V', '10:00:00', 'Sala1', 1);
INSERT INTO horario VALUES (6, 'V', '18:00:00', 'Sala1', 1);
INSERT INTO horario VALUES (7, 'M', '13:00:00', 'Sala2', 2);
INSERT INTO horario VALUES (8, 'M', '21:00:00', 'Sala2', 2);
INSERT INTO horario VALUES (9, 'J', '13:00:00', 'Sala2', 2);
INSERT INTO horario VALUES (10, 'J', '21:00:00', 'Sala2', 2);
INSERT INTO horario VALUES (11, 'X', '11:30:00', 'Sala3', 3);
INSERT INTO horario VALUES (12, 'M', '17:30:00', 'Sala4', 4);
INSERT INTO horario VALUES (13, 'J', '17:30:00', 'Sala4', 4);
INSERT INTO horario VALUES (14, 'S', '11:15:00', 'Sala1', 5);

--
-- Estructura de tabla para la tabla recibo`
--
CREATE TABLE recibo (
  socio_id      INT NOT NULL,
  fecha_amision DATE NOT NULL,
  fecha_pago    DATE,
  cantidad      FLOAT
);

ALTER TABLE recibo
  ADD PRIMARY KEY (socio_id, fecha_amision);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla actividad_realiza_socio`
--
CREATE TABLE actividad_realiza_socio (
  actividad_id   INT NOT NULL,
  socio_id       INT NOT NULL,
  FOREIGN KEY (actividad_id) REFERENCES actividad (id),
  FOREIGN KEY (socio_id) REFERENCES socio (id)
);

--
-- Volcado de datos para la tabla actividad_realiza_socio`
--
INSERT INTO actividad_realiza_socio VALUES (1, 1);
INSERT INTO actividad_realiza_socio VALUES (1, 2);
INSERT INTO actividad_realiza_socio VALUES (1, 3);
INSERT INTO actividad_realiza_socio VALUES (2, 1);
INSERT INTO actividad_realiza_socio VALUES (2, 2);
INSERT INTO actividad_realiza_socio VALUES (2, 5);
INSERT INTO actividad_realiza_socio VALUES (3, 2);
INSERT INTO actividad_realiza_socio VALUES (3, 5);
INSERT INTO actividad_realiza_socio VALUES (4, 1);
INSERT INTO actividad_realiza_socio VALUES (5, 1);
INSERT INTO actividad_realiza_socio VALUES (5, 2);
INSERT INTO actividad_realiza_socio VALUES (5, 3);

--
-- Estructura de tabla para la tabla actividad_demanda_socio`
--
CREATE TABLE actividad_demanda_socio (
  actividad_id    INT NOT NULL,
  socio_id        INT NOT NULL,
  FOREIGN KEY (actividad_id) REFERENCES actividad (id),
  FOREIGN KEY (socio_id) REFERENCES socio (id)
);

--
-- Volcado de datos para la tabla actividad_demanda_socio`
--
INSERT INTO actividad_demanda_socio VALUES (6, 1);
INSERT INTO actividad_demanda_socio VALUES (6, 2);
INSERT INTO actividad_demanda_socio VALUES (7, 1);
