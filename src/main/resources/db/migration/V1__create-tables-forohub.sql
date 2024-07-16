-- V1__Initial_Setup.sql

CREATE TABLE usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    apellido VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    enabled BIT NOT NULL,
    nombre VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    role ENUM('ROLE_USER', 'ROLE_ADMIN'),
    username VARCHAR(255) NOT NULL
);

CREATE TABLE cursos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    activo BIT NOT NULL,
    categoria ENUM('Category1', 'Category2', 'Category3'),
    name VARCHAR(255) NOT NULL
);

CREATE TABLE topicos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    estado ENUM('OPEN', 'CLOSED', 'PENDING'),
    fecha_creacion DATETIME(6) NOT NULL,
    mensaje VARCHAR(255),
    titulo VARCHAR(255) NOT NULL,
    ultima_actualizacion DATETIME(6),
    curso_id BIGINT,
    usuario_id BIGINT,
    FOREIGN KEY (curso_id) REFERENCES cursos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE respuestas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    borrado BIT NOT NULL,
    fecha_creacion DATETIME(6) NOT NULL,
    mensaje VARCHAR(255) NOT NULL,
    solucion BIT,
    ultima_actualizacion DATETIME(6),
    topico_id BIGINT,
    usuario_id BIGINT,
    FOREIGN KEY (topico_id) REFERENCES topicos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
