
# Consultas SQL Avanzadas

## Motor de Base de Datos
PostgreSQL

## Descripción
Script SQL con consultas CRUD y JOIN para gestión de alojamientos turísticos.

## Esquema de Base de Datos

La base de datos contiene las siguientes tablas:

- propietarios
- alojamientos
- huespedes
- reservas
- pagos
- resenas

## Relaciones

- Un propietario puede tener varios alojamientos.
- Un huésped puede realizar varias reservas.
- Una reserva pertenece a un alojamiento.
- Un pago pertenece a una reserva.
- Una reseña pertenece a un huésped y a un alojamiento.

## Archivo principal

- consultas_sql.sql
