-- Borrando registros anteriores

DROP DATABASE blog;

-- Creando e ingresando en la base de datos

CREATE DATABASE blog;

\c blog;

-- Creando tablas requeridas

CREATE TABLE usuarios(
    id SERIAL,
    email VARCHAR (50),
    PRIMARY KEY (id)
);

CREATE TABLE post(
    id SERIAL,
    usuario_id INT,
    titulo VARCHAR(30),
    fecha DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
);

CREATE TABLE comentarios(
    id SERIAL,
    usuario_id INT,
    post_id INT,
    texto VARCHAR (30),
    fecha DATE,
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id),
    FOREIGN KEY (post_id)
    REFERENCES post(id)
);

-- Ingresando valores requeridos en las tablas

INSERT INTO usuarios
(email)
VALUES
('usuario01@gmail.com');

INSERT INTO usuarios
(email)
VALUES
('usuario02@gmail.com');

INSERT INTO usuarios
(email)
VALUES
('usuario03@gmail.com');

INSERT INTO usuarios
(email)
VALUES
('usuario04@gmail.com');

INSERT INTO usuarios
(email)
VALUES
('usuario05@gmail.com');

INSERT INTO usuarios
(email)
VALUES
('usuario06@gmail.com');

INSERT INTO usuarios
(email)
VALUES
('usuario07@gmail.com');

INSERT INTO usuarios
(email)
VALUES
('usuario08@gmail.com');

INSERT INTO usuarios
(email)
VALUES
('usuario09@gmail.com');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(1, 'Post 1: Esto es malo', '2020-06-29');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(5, 'Post 2: Esto es malo', '2020-06-20');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(1, 'Post 3: Esto es excelente', '2020-05-30');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(9, 'Post 4: Esto es bueno', '2020-05-09');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(7, 'Post 5: Esto es bueno', '2020-07-10');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(5, 'Post 6: Esto es excelente', '2020-07-18');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(8, 'Post 7: Esto es excelente', '2020-07-07');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(5, 'Post 8: Esto es excelente', '2020-05-14');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(2, 'Post 9: Esto es bueno', '2020-05-08');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(6, 'Post 10: Esto es bueno', '2020-06-02');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(4, 'Post 11: Esto es bueno', '2020-05-05');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(9, 'Post 12: Esto es malo', '2020-07-23');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(5, 'Post 13: Esto es excelente', '2020-05-30');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(8, 'Post 14: Esto es excelente', '2020-05-01');

INSERT INTO post
(usuario_id, titulo, fecha)
VALUES
(7, 'Post 15: Esto es malo', '2020-06-17');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(3, 6, 'Este es el comentario 1', '2020-07-08');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(4, 2, 'Este es el comentario 2', '2020-06-07');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(6, 4, 'Este es el comentario 3', '2020-06-16');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(2, 13, 'Este es el comentario 4', '2020-06-15');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(6, 6, 'Este es el comentario 5', '2020-05-14');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(3, 3, 'Este es el comentario 6', '2020-07-08');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(6, 1, 'Este es el comentario 7', '2020-05-22');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(6, 7, 'Este es el comentario 8', '2020-07-09');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(8, 13, 'Este es el comentario 9', '2020-06-30');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(8, 6, 'Este es el comentario 10', '2020-06-19');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(5, 1, 'Este es el comentario 11', '2020-05-09');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(8, 15, 'Este es el comentario 12', '2020-06-17');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(1, 9, 'Este es el comentario 13', '2020-05-01');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(2, 5, 'Este es el comentario 14', '2020-05-31');

INSERT INTO comentarios
(usuario_id, post_id, texto, fecha)
VALUES
(4, 3, 'Este es el comentario 15', '2020-06-28');

--  Seleccionar el correo, id y título de todos los post publicados por el usuario 5.

SELECT usuarios.email, usuarios.id, post.titulo FROM post
INNER JOIN usuarios
ON post.usuario_id = usuarios.id
WHERE usuarios.id = 5;

-- Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com.

SELECT usuarios.email, comentarios.id, comentarios.texto FROM usuarios
INNER JOIN comentarios
ON usuarios.id = comentarios.usuario_id
WHERE usuarios.email != 'usuario06@gmail.com';

--Listar los usuarios que no han publicado ningún post.

SELECT usuarios.id, usuarios.email FROM usuarios
LEFT JOIN post 
On usuarios.id = post.usuario_id
WHERE post.usuario_id IS NULL;

--Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).

SELECT post.titulo, comentarios.texto
FROM post
FULL OUTER JOIN comentarios
ON post.id = comentarios.post_id; 

-- Listar todos los usuarios que hayan publicado un post en Junio.

SELECT usuarios.id, usuarios.email FROM usuarios
INNER JOIN post 
On usuarios.id = post.usuario_id
WHERE fecha > '2020-05-31' AND fecha < '2020-07-01';



