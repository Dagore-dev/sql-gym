-- 1. Alphabetical list of activities that are active, indicating its price and the name of the monitor that teaches it (type, activity, price, monitor).
SELECT 
  actividad.nombre,
  tarifa,
  monitor.nombre AS monitor
FROM 
  actividad
INNER JOIN monitor
  ON monitor_id = monitor.id
WHERE
  activasn = 'S'
ORDER BY actividad.nombre;

-- 2. List of all non-active activities indicating the number of requests they have, ordered descending by number of requests (activity, number of requests).
SELECT 
  nombre,
  COUNT(*) AS demanda
FROM 
  actividad
RIGHT JOIN actividad_demanda_socio
  ON id = actividad_id
WHERE
  activasn = 'N'
GROUP BY nombre
ORDER BY demanda DESC;

-- 3. List of the schedule of the activity called 'Activity11' (day of the week, time, room). The day of the week must be expressed in the form 'Monday', 'Tuesday', 'Wednesday', etc.
SELECT
  CASE dia
    WHEN 'L' THEN 'Lunes'
    WHEN 'M' THEN 'Martes'
    WHEN 'X' THEN 'Miércoles'
    WHEN 'J' THEN 'Jueves'
    WHEN 'V' THEN 'Viernes'
    WHEN 'S' THEN 'Sábado'
    WHEN 'D' THEN 'Domingo'
    ELSE 'error'
  END dia,
  hora,
  sala
FROM 
  horario
WHERE
  actividad_id = (SELECT id FROM actividad WHERE nombre = 'Actividad1');

-- 4. Alphabetical list of members who have not been withdrawn, indicating the amount spent monthly on gym activities (member, monthly amount).
-- MIRAR EL DE JUAN QUE EL ENUNCIADO ME HABÍA CONFUNDIDO.
SELECT
  nombre,
  cantidad
FROM 
  socio
LEFT JOIN recibo
  ON socio.id = socio_id
WHERE
  bajasn = 'N'
ORDER BY nombre;

-- 5. List of members who unsubscribed (member, telephone and email).
SELECT
  nombre,
  telefono,
  email
FROM
  socio
WHERE
  bajasn = 'S';

-- 6. List of members who have class at 18:00 (member and telephone). The data should not be repeated.
SELECT DISTINCT
  socio.nombre,
  telefono
FROM
  socio
INNER JOIN actividad_realiza_socio
  ON socio.id = socio_id
INNER JOIN horario
  ON actividad_realiza_socio.actividad_id = horario.actividad_id
WHERE
  hora = '18:00:00';

-- 7. Alphabetical list of activities ordered descending by number of members that carry them out, of only those that have more than 2 members (activity, number of members).
SELECT
  actividad.nombre,
  COUNT(*) AS inscritos
FROM
  actividad
INNER JOIN actividad_realiza_socio
  ON actividad.id = actividad_id
GROUP BY 
  actividad.nombre
HAVING
    COUNT(*) > 2
ORDER BY 
  actividad.nombre,
  inscritos DESC;

-- 8. List of monitors indicating their name, NIF and the activities they carry out separated by a comma (monitor, NIF,activities).
SELECT
    monitor.nombre,
    monitor.nif,
    LISTAGG(actividad.nombre, ', ') AS actividades
FROM
    monitor
INNER JOIN actividad
    ON monitor.id = monitor_id
GROUP BY
    monitor.nombre,
    monitor.nif
ORDER BY
    monitor.nombre;
