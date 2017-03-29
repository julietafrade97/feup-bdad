--
-- File generated with SQLiteStudio v3.1.1 on qua mar 29 16:03:34 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Cidade
CREATE TABLE Cidade (
    id     INTEGER PRIMARY KEY,
    idPa�s INTEGER REFERENCES Pa�s (id) 
                   NOT NULL
);


-- Table: Concerto
CREATE TABLE Concerto (
    idConcerto   INTEGER PRIMARY KEY,
    data         DATE    NOT NULL,
    idInt�rprete INTEGER REFERENCES Int�rprete (id) 
                         NOT NULL,
    idCidade     INTEGER REFERENCES Cidade (id) 
                         NOT NULL
);


-- Table: Dispositvo
CREATE TABLE Dispositvo (
    idDispositivo     INTEGER PRIMARY KEY,
    nome              STRING  NOT NULL,
    idTipoDispositivo INTEGER REFERENCES TipoDispositivo (idTipoDispositivo) 
                              NOT NULL,
    idUser            INTEGER REFERENCES Utilizador (id) 
                              NOT NULL
);


-- Table: Envia
CREATE TABLE Envia (
    id     INTEGER PRIMARY KEY
                   REFERENCES Mensagem (conte�do),
    idUser INTEGER REFERENCES Utilizador (id) 
                   NOT NULL
);


-- Table: G�nero
CREATE TABLE G�nero (
    idG�nero INTEGER PRIMARY KEY,
    nome     STRING  NOT NULL
                     UNIQUE
);


-- Table: Int�rprete
CREATE TABLE Int�rprete (
    id         INTEGER PRIMARY KEY,
    nome       STRING  NOT NULL
                       UNIQUE,
    verificado BOOLEAN NOT NULL,
    fotoPerfil,
    fotoCapa,
    biografia  STRING,
    idCidade   INTEGER REFERENCES Cidade (id) 
                       NOT NULL
);


-- Table: Mensagem
CREATE TABLE Mensagem (
    id        INTEGER PRIMARY KEY,
    conte�do  STRING  NOT NULL,
    dataEnvio DATE    NOT NULL
);


-- Table: M�sica
CREATE TABLE M�sica (
    id          INTEGER PRIMARY KEY,
    nome        STRING  NOT NULL,
    dura��o     TIME    NOT NULL,
    reprodu��es INTEGER NOT NULL
);


-- Table: M�sicaAlbum
CREATE TABLE M�sicaAlbum (
    idM�sica INTEGER PRIMARY KEY
                     REFERENCES M�sica (id),
    idAlbum  INTEGER REFERENCES �lbum (id) 
                     NOT NULL,
    indice   INTEGER NOT NULL
);


-- Table: M�sicaPlaylist
CREATE TABLE M�sicaPlaylist (
    idMusica           REFERENCES M�sica (id) 
                       PRIMARY KEY,
    idPlaylist INTEGER REFERENCES Playlist (id) 
                       NOT NULL
);


-- Table: Pa�s
CREATE TABLE Pa�s (
    id   INTEGER PRIMARY KEY,
    nome STRING  UNIQUE
                 NOT NULL
);


-- Table: Playlist
CREATE TABLE Playlist (
    id        INTEGER PRIMARY KEY,
    nome      STRING  NOT NULL,
    imagem,
    dura��o   TIME    NOT NULL,
    descri��o STRING,
    idDono    INTEGER REFERENCES Utilizador (id) 
                      NOT NULL
);


-- Table: Recebe
CREATE TABLE Recebe (
    id     INTEGER PRIMARY KEY
                   REFERENCES Mensagem (id) 
                   NOT NULL,
    idUser INTEGER REFERENCES Utilizador (id) 
                   NOT NULL
);


-- Table: SegueInt�rprete
CREATE TABLE SegueInt�rprete (
    idUser       INTEGER PRIMARY KEY
                         REFERENCES Utilizador (id),
    idInt�rprete INTEGER REFERENCES Int�rprete (id) 
                         NOT NULL
);


-- Table: SeguePlaylist
CREATE TABLE SeguePlaylist (
    idUser     INTEGER REFERENCES Utilizador (id) 
                       PRIMARY KEY,
    idPlaylist INTEGER REFERENCES Playlist (id) 
                       NOT NULL
);


-- Table: SegueUtilizador
CREATE TABLE SegueUtilizador (
    idUser        INTEGER PRIMARY KEY
                          REFERENCES Utilizador (id),
    idUserSeguido INTEGER NOT NULL
                          REFERENCES Utilizador (id) 
);


-- Table: TipoDispositivo
CREATE TABLE TipoDispositivo (
    idTipoDispositivo INTEGER PRIMARY KEY,
    tipoNome          STRING  NOT NULL
                              UNIQUE
);


-- Table: Tipo�lbum
CREATE TABLE Tipo�lbum (
    idTipoAlbum INTEGER PRIMARY KEY,
    tipoNome    STRING  NOT NULL
                        UNIQUE
);


-- Table: Top
CREATE TABLE Top (
    idM�sica INTEGER REFERENCES M�sica (id) 
                     PRIMARY KEY,
    posi��o  INTEGER NOT NULL,
    idCidade INTEGER REFERENCES Cidade (id) 
);


-- Table: Utilizador
CREATE TABLE Utilizador (
    id             INTEGER PRIMARY KEY,
    nome           STRING  NOT NULL,
    username       STRING  NOT NULL,
    password       STRING  NOT NULL,
    fotoPerfil,
    dataNascimento DATE    NOT NULL,
    email          STRING  NOT NULL,
    idade          INTEGER NOT NULL
);


-- Table: UtilizadorFree
CREATE TABLE UtilizadorFree (
    id          INTEGER REFERENCES Utilizador (id) 
                        PRIMARY KEY,
    tempoLimite INTEGER NOT NULL
);


-- Table: UtilizadorPremium
CREATE TABLE UtilizadorPremium (
    id          INTEGER PRIMARY KEY
                        REFERENCES Utilizador (id),
    mensalidade DOUBLE  NOT NULL
);


-- Table: �lbum
CREATE TABLE �lbum (
    id           INTEGER PRIMARY KEY,
    nome         STRING  NOT NULL,
    capa                 NOT NULL,
    ano          INTEGER NOT NULL,
    idTipoAlbum  INTEGER REFERENCES Tipo�lbum (idTipoAlbum) 
                         NOT NULL,
    idInt�rprete INTEGER REFERENCES Int�rprete (id) 
                         NOT NULL
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
