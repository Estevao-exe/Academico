-- Querrys

SELECT musica.titulo AS 'Musicas', musica.duracao_segundos AS'Segundos'
FROM musica
WHERE musica.duracao_segundos > 180
ORDER BY musica.duracao_segundos DESC; 

-- 2 premium sem um email
SELECT usuarios.nomeU AS 'Nome', email_reculpe AS 'Email', plano
FROM usuarios
WHERE plano = 'Premium' AND email_reculpe IS NULL;

-- 3 Nome e Quantidade de Musicas
SELECT artista.nomeA AS 'Nome', COUNT(musica.id_musica) AS 'Quantidade de Musicas'
FROM artista 
INNER JOIN musica ON artista.id_artista = musica.id_artista
GROUP BY artista.id_artista, artista.nomeA;

-- 4. Junção tripla: usuário, música ouvida e data
SELECT usuarios.nomeU AS 'Nome do Usuário', musica.titulo AS 'Título da Música', reproducao.data_play AS 'Data'
FROM reproducao
INNER JOIN usuarios ON reproducao.id_usuario = usuarios.id_usuario
INNER JOIN musica ON reproducao.id_musica = musica.id_musica;

-- 5 Usuarios, e repetição de musica
SELECT usuarios.nomeU AS 'Nome', COUNT(reproducao.id_reproducao) AS 'Musicas Ouvidas'
FROM usuarios
LEFT JOIN reproducao ON reproducao.id_usuario = usuarios.id_usuario
GROUP BY usuarios.id_usuario, usuarios.nomeU;

-- 6 Artistas com duração maior que 300 s
SELECT artista.nomeA AS 'Artista', ROUND(AVG(musica.duracao_segundos),1) AS 'Duração em Segundos'
FROM artista
INNER JOIN musica ON artista.id_artista = musica.id_artista
GROUP BY artista.nomeA, artista.id_artista
HAVING  AVG(musica.duracao_segundos) > 300;