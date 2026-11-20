CREATE TABLE artista (
    id_artista INT PRIMARY KEY,
    nomeA VARCHAR(50) NOT NULL,
    genero VARCHAR(100)
);

CREATE TABLE musica (
    id_musica INT PRIMARY KEY,
    titulo VARCHAR(100),
    duracao_segundos INT NOT NULL,
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES artista (id_artista)
);

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nomeU VARCHAR(70),
    plano VARCHAR(10),
    email_reculpe VARCHAR(70)
);

CREATE TABLE reproducao (
    id_reproducao INT PRIMARY KEY,
    id_usuario INT,
    id_musica INT, 
    data_play DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (id_musica) REFERENCES musica (id_musica)
);
