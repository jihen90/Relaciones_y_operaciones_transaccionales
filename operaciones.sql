-- Identificar id de usuario01

SELECT id FROM cliente WHERE nombre = 'usuario01';

-- Identificar id y consultar stock de producto9

SELECT id, stock FROM producto WHERE descripcion = 'producto9';

--Ingresando transaccion 

BEGIN;
INSERT INTO compra (cliente_id, fecha)
VALUES (1, NOW());
INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES(9, (SELECT MAX(compra.id) FROM compra INNER JOIN detalle_compra ON compra.id = detalle_compra.compra_id), 5 );
UPDATE producto SET stock = stock - 5 WHERE id = 9;
COMMIT;

--Chequear si el stock fue descontado

SELECT stock FROM producto WHERE id = 9;

-- Identificar id de usuario02

SELECT id FROM cliente WHERE nombre = 'usuario02';

-- Identificar id y consultar stock de producto1, producto2 y producto8

SELECT id, stock FROM producto WHERE descripcion = 'producto1';
SELECT id, stock FROM producto WHERE descripcion = 'producto2';
SELECT id, stock FROM producto WHERE descripcion = 'producto8';

--Ingresando transacciones

BEGIN;
INSERT INTO compra (cliente_id, fecha)
VALUES (2, NOW());

INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES(1, (SELECT MAX(compra.id) FROM compra INNER JOIN detalle_compra ON compra.id = detalle_compra.compra_id), 3 );

INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES(2, (SELECT MAX(compra.id) FROM compra INNER JOIN detalle_compra ON compra.id = detalle_compra.compra_id), 3 );

INSERT INTO detalle_compra(producto_id, compra_id, cantidad)
VALUES(8, (SELECT MAX(compra.id) FROM compra INNER JOIN detalle_compra ON compra.id = detalle_compra.compra_id), 3 );

UPDATE producto SET stock = stock - 3 WHERE id = 1;
UPDATE producto SET stock = stock - 3 WHERE id = 2;
UPDATE producto SET stock = stock - 3 WHERE id = 8;

COMMIT;

--Chequear si el stock fue descontado

SELECT stock FROM producto WHERE id = 1;
SELECT stock FROM producto WHERE id = 2;
SELECT stock FROM producto WHERE id = 8;

-- Chequear estado del autocommit

\echo :AUTOCOMMIT

-- Modificar estado del autocommit  a 'off'

\set AUTOCOMMIT off

-- Ingresando requerimientos

BEGIN;
SAVEPOINT test_add_client;
INSERT INTO cliente(nombre, email)
VALUES ('usuario23', 'usuario23@gmail.com');
SELECT * FROM cliente WHERE nombre = 'usuario23';
ROLLBACK TO SAVEPOINT test_add_client;
SELECT * FROM cliente WHERE nombre = 'usuario23'; 
COMMIT;

-- Configurando autocommit en 'on'

\set AUTOCOMMIT on 

-- Chequear estado del autocommit

\echo :AUTOCOMMIT




