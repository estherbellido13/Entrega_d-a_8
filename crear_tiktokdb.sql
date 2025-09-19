-- Creamos el DataBase
-- DROP DATABASE TikTokDB
CREATE DATABASE TikTokDB;
USE TikTokDB;

-- Creamos las tablas

-- PRIMARY KEY nos asegura que el valor será único
-- INT AUTO_INCREMENT PRIMARY KEY es otra forma 
CREATE TABLE usuarios (
 id_usuario INT auto_increment PRIMARY KEY,
 nombre_usuario VARCHAR(50) NOT NULL,
 email_usuario VARCHAR(100) NOT NULL UNIQUE,
 fecha_registro DATE NOT NULL,
 pais_origen VARCHAR(50) NOT NULL
 );
 
 -- Añadimos INT NOT NULL en id_usuario porque ya lo hemos definido antes y va a coger de esos los que hayan subido un video
 -- Añadimos TEXT (sin NULL) porque no es obligatorio poner una descripción
 -- Como queremos segundos ponemos INT (es un número entero)
 -- en la última línea vinculamos esta tabla con la de usuarios, mediante id_usuario
 
 CREATE TABLE videos (
 id_video INT auto_increment PRIMARY KEY,
 id_usuario INT NOT NULL,
 titulo_video VARCHAR(200) NOT NULL,
 descripcion_video TEXT,
 fecha_publicacion DATE NOT NULL,
 duracion_video_segundos INT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
 );
 
 CREATE TABLE Comentarios (
 id_comentario INT auto_increment PRIMARY KEY,
 id_video INT NOT NULL,
 id_usuario INT NOT NULL,
 texto_comentario VARCHAR(1000) NOT NULL,
 fecha_comentario DATE NOT NULL,
 FOREIGN KEY (id_video) REFERENCES videos(id_video),
 FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
  );
  
  CREATE TABLE likes (
 id_like INT auto_increment PRIMARY KEY,
 id_video INT NOT NULL,
 id_usuario INT NOT NULL,
 fecha_like DATE NOT NULL,
 FOREIGN KEY (id_video) REFERENCES videos(id_video),
 FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
  );
  
  -- Añadimos CONSTRAINT chk_seguirse para chequear que se siguen, garantizando que no se repiten (un mismo usuario no se sigue a sí mismo)
    
CREATE TABLE seguidor (
 id_seguidor INT auto_increment PRIMARY KEY,
 id_usuario_seguidor INT NOT NULL,
 id_usuario_seguido INT NOT NULL,
 fecha_seguimiento DATE NOT NULL,
 FOREIGN KEY (id_usuario_seguidor) REFERENCES usuarios(id_usuario),
 FOREIGN KEY (id_usuario_seguido) REFERENCES usuarios(id_usuario),
 CONSTRAINT chk_seguirse CHECK (id_usuario_seguidor <> id_usuario_seguido)
  );
  
-- Insertamos valores en las tablas

INSERT INTO usuarios ( nombre_usuario,
 email_usuario,
 fecha_registro,
 pais_origen
) VALUES
 ('Ana', 'ana@mail.com'),
 ('Juan', 'juan@mail.com'),
 ('Sara', 'sara@mail.com'); 
 
INSERT INTO videos ( titulo_video,
 descripcion_video,
 fecha_publicacion,
 duracion_video_segundos
) VALUES
 ('Trailer Gen Z III', 'La nueva película de Brad Pitt'),
 ('Videoclip Roar Katy Perry', 'Grammys Winner'),
 ('Resumen partido Alcaráz'); 
 
 INSERT INTO comentarios ( texto_comentario ,
 fecha_comentario
) VALUES
 ('Gran película', 'La nueva película de Brad Pitt'),
 ('Videoclip Roar Katy Perry', 'Grammys Winner'),
 ('Resumen partido Alcaráz'); 
  