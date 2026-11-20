
-- 1. Inserindo Artistas
INSERT INTO artista (id_artista, nomeA, genero) VALUES
(1, 'Fabio Brazza', 'Rap'),
(2, 'The Animals', 'Pop Rock'),
(3, 'Alec', 'Intimista'),
(4, 'Raphyx & Alec', 'MPB'); -- Artista sem músicas cadastradas

-- 2. Inserindo Músicas (ligadas aos artistas acima)
INSERT INTO musica (id_musica, titulo, duracao_segundos, id_artista) VALUES
(10, 'As flores e o louco', 302, 1),
(11, 'O Fantasma da Ópera', 308, 3),
(12, 'Forasteiro', 194, 4),
(13, 'House Of The Rising Sun', 451, 2),
(14, 'Olhos Carmesin', 165, 3),
(15, 'Cab Callowey', 543, 3);

-- 3. Inserindo Usuários (incluindo e-mail NULL e usuário inativo)
INSERT INTO usuarios (id_usuario, nomeU, plano, email_reculpe) VALUES
(1, 'Carlos Eduardo', 'Premium', 'carlosguloso@email.com'),

-- Premium sem e-mail de recuperação
(2, 'Ana Beatriz', 'Premium', NULL),

(3, 'Lucas Martins', 'Grátis', 'lucasfemboie@email.com'),
(4, 'Fernanda Lima', 'Grátis', NULL),
 -- Usuário que ainda não ouviu nenhuma música
(5, 'Rafael Souza', 'Premium', 'rafaelsapeca@email.com');

-- 4. Inserindo Reproduções (ligando usuários às músicas)
INSERT INTO reproducao (id_reproducao, id_usuario, id_musica, data_play) VALUES
(100, 1, 10, '2026-12-31'),
(101, 1, 12, '2025-12-22'),
(102, 1, 15, '2025-04-12'),
(103, 2, 13, '2023-02-12'),
(104, 2, 14, '2023-10-15'),
(105, 3, 11, '2021-01-16'),
(106, 4, 12, '2022-02-18'),
(107, 4, 13, '2023-02-19');
