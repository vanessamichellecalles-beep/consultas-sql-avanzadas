-- =========================================
-- 01 INSERTAR PROPIETARIO
-- =========================================

INSERT INTO propietarios(nombre, telefono, email)
VALUES ('Carlos López', '7777-7777', 'carlos@gmail.com');
-- 01 INSERTAR PROPIETARIO

INSERT INTO propietarios(nombre, telefono, email)
VALUES ('Carlos López', '7777-7777', 'carlos@gmail.com');

-- 02 INSERTAR ALOJAMIENT

INSERT INTO alojamientos(nombre, ciudad, precio_noche, activo, id_propietario)
VALUES ('Hotel Paraíso', 'San Salvador', 80.00, TRUE, 1);
-- 03 HUESPED Y RESERVA

INSERT INTO huespedes(nombre, pais, email)
VALUES ('Ana Pérez', 'México', 'ana@gmail.com');

INSERT INTO reservas(fecha_inicio, fecha_fin, estado, id_huesped, id_alojamiento)
VALUES ('2026-06-01', '2026-06-05', 'Confirmada', 1, 1);

-- 04 INSERTAR PAGO

INSERT INTO pagos(monto, fecha_pago, id_reserva)
VALUES (320.00, '2026-06-01', 1);

-- 04 INSERTAR PAGO

INSERT INTO pagos(monto, fecha_pago, id_reserva)
VALUES (320.00, '2026-06-01', 1);

-- 05 ALOJAMIENTOS ACTIVOS

SELECT * FROM alojamientos
WHERE activo = TRUE;

-- 06 HUESPEDES POR PAIS

SELECT * FROM huespedes
WHERE pais = 'México';

-- 07 RESERVAS POR FECHAS

SELECT * FROM reservas
WHERE fecha_inicio BETWEEN '2026-06-01' AND '2026-06-30';

-- 08 ACTUALIZAR PRECIO

UPDATE alojamientos
SET precio_noche = 95.00
WHERE id_alojamiento = 1;

-- 09 ACTUALIZAR ESTADO RESERVA

UPDATE reservas
SET estado = 'Finalizada'
WHERE id_reserva = 1;

-- 10 ELIMINAR RESEÑA

DELETE FROM resenas
WHERE id_resena = 1;

-- 11 JOIN RESERVAS Y HUESPED

SELECT r.id_reserva, h.nombre, r.estado
FROM reservas r
INNER JOIN huespedes h
ON r.id_huesped = h.id_huesped;

-- 12 JOIN ALOJAMIENTO COMPLETO

SELECT a.nombre, p.nombre AS propietario
FROM alojamientos a
INNER JOIN propietarios p
ON a.id_propietario = p.id_propietario;

-- 13 PAGOS Y RESERVAS

SELECT p.monto, r.estado
FROM pagos p
INNER JOIN reservas r
ON p.id_reserva = r.id_reserva;

-- 14 LEFT JOIN SIN RESEÑAS

SELECT a.nombre, re.comentario
FROM alojamientos a
LEFT JOIN resenas re
ON a.id_alojamiento = re.id_alojamiento;

-- 15 ALOJAMIENTOS SIN RESERVAS

SELECT a.nombre
FROM alojamientos a
LEFT JOIN reservas r
ON a.id_alojamiento = r.id_alojamiento
WHERE r.id_reserva IS NULL;

-- 16 TOTAL INGRESOS

SELECT SUM(monto) AS total_ingresos
FROM pagos;

-- 17 PROMEDIO RATING

SELECT AVG(rating) AS promedio_rating
FROM resenas;

-- 18 TOP ALOJAMIENTOS

SELECT id_alojamiento, COUNT(*) AS total_reservas
FROM reservas
GROUP BY id_alojamiento
ORDER BY total_reservas DESC
LIMIT 5;

-- 19 MAS DE 3 RESERVAS

SELECT id_alojamiento, COUNT(*) AS total
FROM reservas
GROUP BY id_alojamiento
HAVING COUNT(*) > 3;

-- 20 ALOJAMIENTO MAS CARO

SELECT nombre, precio_noche
FROM alojamientos
WHERE precio_noche = (
    SELECT MAX(precio_noche)
    FROM alojamientos
);