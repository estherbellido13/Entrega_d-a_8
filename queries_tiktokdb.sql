-- Consulta de datos

   -- Ver todos los usuarios de TikTok:
SELECT * FROM usuarios;

   -- Ver todos los videos publicados:
SELECT * FROM videos;

   -- Ver todos comentarios realizados en los videos:
SELECT * FROM comentarios;

  -- Ver todos los likes dados a los videos.
SELECT * FROM likes;

-- Ver las relaciones de seguimiento entre los usuarios.
SELECT * FROM seguidores;

-- Inventados
-- Mostrar los titulos de los videos
SELECT titulo_video FROM videos;
-- Mostrar el nombre de los usuarios y su país de origen
SELECT nombre_usuario, pais_origen FROM usuarios;
-- Mostrar los datos de Juanito 
 SELECT * FROM usuarios
 WHERE nombre_usuario = 'Juanito';

