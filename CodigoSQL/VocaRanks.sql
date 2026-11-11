CREATE DATABASE IF NOT EXISTS vocaloid_ranks;
USE vocaloid_ranks;

DROP TABLE IF EXISTS Ganancia_Mensual;
DROP TABLE IF EXISTS Metricas;
DROP TABLE IF EXISTS Interpreta;
DROP TABLE IF EXISTS Compone;
DROP TABLE IF EXISTS Cancion;
DROP TABLE IF EXISTS Cantante;
DROP TABLE IF EXISTS Compositor;

CREATE TABLE Compositor (
    canal_youtube VARCHAR(150) PRIMARY KEY,
    nombre_compositor VARCHAR(100) NOT NULL
);

CREATE TABLE Cantante (
    id_cantante INT PRIMARY KEY,
    nombre_cantante VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Cancion (
    link VARCHAR(43) PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    fecha_publicacion DATETIME NOT NULL
);

CREATE TABLE Compone (
    canal_youtube VARCHAR(150),
    link VARCHAR(43),
    rol VARCHAR(50) NOT NULL,
    PRIMARY KEY (canal_youtube, link, rol),
    FOREIGN KEY (canal_youtube) REFERENCES Compositor(canal_youtube),
    FOREIGN KEY (link) REFERENCES Cancion(link) 
);

CREATE TABLE Interpreta (
    id_cantante INT,
    link VARCHAR(43),
    PRIMARY KEY (id_cantante, link),
    FOREIGN KEY (id_cantante) REFERENCES Cantante(id_cantante),
    FOREIGN KEY (link) REFERENCES Cancion(link)
);

CREATE TABLE Metricas (
    id_metricas INT PRIMARY KEY,
    link VARCHAR(43) NOT NULL UNIQUE,
    vistas BIGINT  NOT NULL DEFAULT 0,
    likes BIGINT  NOT NULL DEFAULT 0,
    comentarios BIGINT NOT NULL DEFAULT 0,
    FOREIGN KEY (link) REFERENCES Cancion(link)
);

CREATE TABLE Ganancia_Mensual (
    id_ganancia INT PRIMARY KEY,
    id_metricas INT NOT NULL,
    mes DATE NOT NULL,
    vistas_ganadas BIGINT NOT NULL DEFAULT 0,
    likes_ganados BIGINT NOT NULL DEFAULT 0,
    comentarios_ganados BIGINT NOT NULL DEFAULT 0,
    UNIQUE (id_metricas, mes),
    FOREIGN KEY (id_metricas) REFERENCES Metricas(id_metricas)
);

-- INSERT: datos de las 10 primeras filas de playlist_data.csv
 
INSERT INTO Compositor (canal_youtube, nombre_compositor) VALUES
('https://www.youtube.com/channel/UCtGmulznR7e0KxpEdKu_nqw', 'siinamota'),
('https://www.youtube.com/channel/UCtmi2O7lp0C_i53hFIExAaA', 'Satsuki'),
('https://www.youtube.com/channel/UCft5HulDeuKloukyShxyOZA', 'Chinozo'),
('https://www.youtube.com/channel/UCS1RUyEDJ3TSiil8TC84G4g', 'Crusher'),
('https://www.youtube.com/channel/UCq3vSkJtBZdBjC8yrG-1xmA', 'Kikuo'),
('https://www.youtube.com/@hiiragi_magne', 'Hiiragi Magnetite'),
('https://www.youtube.com/channel/UCGmO0S4S-AunjRdmxA6TQYg', 'DECO*27'),
('https://www.youtube.com/channel/UCKeB3X0Akxxo3VfG46D_Dfg', 'Yukopi'),
('https://www.youtube.com/channel/UCLz6MG2kx_0xeaW0LowYnMQ', 'iyowa');
 
INSERT INTO Cantante (id_cantante, nombre_cantante) VALUES
(1, 'Kagamine Rin'),
(2, 'Hatsune Miku'),
(3, 'Kasane Teto'),
(4, 'Flower'),
(5, 'GUMI'),
(6, 'Kaai Yuki'),
(7, 'KAFU');
 
INSERT INTO Cancion (link, titulo, fecha_publicacion) VALUES
('https://www.youtube.com/watch?v=AqI97zHMoQw', 'Young Girl A', '2013-10-17 11:02:50'),
('https://www.youtube.com/watch?v=19y8YTbvri8', 'Mesmerizer', '2024-04-27 10:00:02'),
('https://www.youtube.com/watch?v=dHXC_ahjtEE', 'Goodbye Sengen', '2020-04-13 09:00:34'),
('https://www.youtube.com/watch?v=cQKGUgOfD8U', 'ECHO', '2014-10-08 04:07:41'),
('https://www.youtube.com/watch?v=NTrm_idbhUk', 'Aishite Aishite Aishite', '2015-03-06 09:00:01'),
('https://www.youtube.com/watch?v=Soy4jGPHr3g', 'Tetoris', '2024-11-08 13:09:06'),
('https://www.youtube.com/watch?v=eSW2LVbPThw', 'Rabbit Hole', '2023-05-19 10:00:29'),
('https://www.youtube.com/watch?v=D6DVTLvOupE', 'Kyoufuu All Back', '2023-03-15 11:00:19'),
('https://www.youtube.com/watch?v=kbNdx0yqbZE', 'Monitoring', '2024-11-22 10:00:08'),
('https://www.youtube.com/watch?v=2b1IexhKPz4', 'Kyu-kurarin', '2021-08-29 11:00:01');
 
INSERT INTO Compone (canal_youtube, link, rol) VALUES
('https://www.youtube.com/channel/UCtGmulznR7e0KxpEdKu_nqw', 'https://www.youtube.com/watch?v=AqI97zHMoQw', 'Compositor'),
('https://www.youtube.com/channel/UCtmi2O7lp0C_i53hFIExAaA', 'https://www.youtube.com/watch?v=19y8YTbvri8', 'Compositor'),
('https://www.youtube.com/channel/UCft5HulDeuKloukyShxyOZA', 'https://www.youtube.com/watch?v=dHXC_ahjtEE', 'Compositor'),
('https://www.youtube.com/channel/UCS1RUyEDJ3TSiil8TC84G4g', 'https://www.youtube.com/watch?v=cQKGUgOfD8U', 'Compositor'),
('https://www.youtube.com/channel/UCq3vSkJtBZdBjC8yrG-1xmA', 'https://www.youtube.com/watch?v=NTrm_idbhUk', 'Compositor'),
('https://www.youtube.com/@hiiragi_magne', 'https://www.youtube.com/watch?v=Soy4jGPHr3g', 'Compositor'),
('https://www.youtube.com/channel/UCGmO0S4S-AunjRdmxA6TQYg', 'https://www.youtube.com/watch?v=eSW2LVbPThw', 'Compositor'),
('https://www.youtube.com/channel/UCKeB3X0Akxxo3VfG46D_Dfg', 'https://www.youtube.com/watch?v=D6DVTLvOupE', 'Compositor'),
('https://www.youtube.com/channel/UCGmO0S4S-AunjRdmxA6TQYg', 'https://www.youtube.com/watch?v=kbNdx0yqbZE', 'Compositor'),
('https://www.youtube.com/channel/UCLz6MG2kx_0xeaW0LowYnMQ', 'https://www.youtube.com/watch?v=2b1IexhKPz4', 'Compositor');
 
INSERT INTO Interpreta (id_cantante, link) VALUES
(1, 'https://www.youtube.com/watch?v=AqI97zHMoQw'),
(2, 'https://www.youtube.com/watch?v=19y8YTbvri8'),
(3, 'https://www.youtube.com/watch?v=19y8YTbvri8'),
(4, 'https://www.youtube.com/watch?v=dHXC_ahjtEE'),
(5, 'https://www.youtube.com/watch?v=cQKGUgOfD8U'),
(2, 'https://www.youtube.com/watch?v=NTrm_idbhUk'),
(3, 'https://www.youtube.com/watch?v=Soy4jGPHr3g'),
(2, 'https://www.youtube.com/watch?v=eSW2LVbPThw'),
(6, 'https://www.youtube.com/watch?v=D6DVTLvOupE'),
(2, 'https://www.youtube.com/watch?v=kbNdx0yqbZE'),
(7, 'https://www.youtube.com/watch?v=2b1IexhKPz4');
 
INSERT INTO Metricas (id_metricas, link, vistas, likes, comentarios) VALUES
(1, 'https://www.youtube.com/watch?v=AqI97zHMoQw', 228184135, 3038888, 223462),
(2, 'https://www.youtube.com/watch?v=19y8YTbvri8', 229187795, 2246965, 133254),
(3, 'https://www.youtube.com/watch?v=dHXC_ahjtEE', 160991686, 1423013, 87384),
(4, 'https://www.youtube.com/watch?v=cQKGUgOfD8U', 131536514, 1536212, 55556),
(5, 'https://www.youtube.com/watch?v=NTrm_idbhUk', 124125151, 2382056, 60203),
(6, 'https://www.youtube.com/watch?v=Soy4jGPHr3g', 137148644, 1021914, 24824),
(7, 'https://www.youtube.com/watch?v=eSW2LVbPThw', 127819489, 1292796, 29428),
(8, 'https://www.youtube.com/watch?v=D6DVTLvOupE', 119214666, 1434735, 28908),
(9, 'https://www.youtube.com/watch?v=kbNdx0yqbZE', 137502151, 1344110, 22638),
(10, 'https://www.youtube.com/watch?v=2b1IexhKPz4', 122477815, 1148224, 39951);
 
INSERT INTO Ganancia_Mensual (id_ganancia, id_metricas, mes, vistas_ganadas, likes_ganados, comentarios_ganados) VALUES
(1, 1, '2026-10-01', 5128804, 41837, 1011),
(2, 2, '2026-10-01', 4748844, 22244, 865),
(3, 3, '2026-10-01', 987367, 4637, 209),
(4, 4, '2026-10-01', 949949, 6860, 65),
(5, 5, '2026-10-01', 859249, 7948, 181),
(6, 6, '2026-10-01', 2783830, 10745, 165),
(7, 7, '2026-10-01', 1832113, 9829, 79),
(8, 8, '2026-10-01', 656041, 3947, 87),
(9, 9, '2026-10-01', 3389402, 16261, 152),
(10, 10, '2026-10-01', 2012602, 11086, 218);
 
SHOW TABLES;

SELECT c.titulo, c.fecha_publicacion, m.vistas
FROM   Cancion c, Metricas m
WHERE  c.link = m.link
  AND  c.fecha_publicacion >= '2023-01-01'
  AND  m.vistas > 130000000;

SELECT ca.nombre_cantante
FROM   Cantante ca
WHERE  ca.id_cantante NOT IN (
         SELECT i.id_cantante
         FROM   Interpreta i, Cancion c
         WHERE  i.link = c.link
           AND  c.fecha_publicacion >= '2023-01-01'
       );

SELECT c.titulo, g.mes, m.vistas, g.vistas_ganadas
FROM   Cancion c, Metricas m, Ganancia_Mensual g
WHERE  c.link = m.link
  AND  m.id_metricas = g.id_metricas
  AND  m.likes > 1300000
  AND  g.vistas_ganadas > 2000000;

SELECT c.titulo, c.fecha_publicacion, ca.nombre_cantante
FROM   Cancion c, Interpreta i, Cantante ca
WHERE  c.link = i.link
  AND  i.id_cantante = ca.id_cantante
  AND  ca.nombre_cantante = 'Hatsune Miku';

SELECT   ca.nombre_cantante,
         COUNT(i.link) AS total_canciones,
         SUM(m.vistas) AS vistas_totales
FROM     Cantante ca, Interpreta i, Metricas m
WHERE    ca.id_cantante = i.id_cantante
  AND    i.link = m.link
GROUP BY ca.id_cantante, ca.nombre_cantante
HAVING   COUNT(i.link) >= 2;