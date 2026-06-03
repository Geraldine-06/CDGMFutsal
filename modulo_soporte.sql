-- ============================================================
--  BASE DE DATOS: CDGMFutsal
--  Sistema de Gestión de Torneos

-- ============================================================


USE CDGMFutsal;

-- ============================================================
--  ESTRUCTURA DE TABLAS
-- ============================================================

CREATE TABLE NOTIFICACIONES (
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario      INT          NOT NULL,
    titulo          VARCHAR(200) NOT NULL,
    mensaje         TEXT         NOT NULL,
    tipo            VARCHAR(50)  NOT NULL DEFAULT 'info',
    leida           TINYINT(1)   NOT NULL DEFAULT 0,
    fecha_envio     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_not_usr FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);

CREATE TABLE MENSAJES_INTERNOS (
    id_mensaje      INT AUTO_INCREMENT PRIMARY KEY,
    id_remitente    INT          NOT NULL,
    asunto          VARCHAR(200) NOT NULL,
    cuerpo          TEXT         NOT NULL,
    fecha_envio     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_msg_rem FOREIGN KEY (id_remitente) REFERENCES USUARIOS(id_usuario)
);

CREATE TABLE DESTINATARIOS_MENSAJE (
    id_destinatario INT AUTO_INCREMENT PRIMARY KEY,
    id_mensaje      INT          NOT NULL,
    id_usuario      INT          NOT NULL,
    leido           TINYINT(1)   NOT NULL DEFAULT 0,
    fecha_lectura   DATETIME,
    CONSTRAINT fk_des_msg FOREIGN KEY (id_mensaje)  REFERENCES MENSAJES_INTERNOS(id_mensaje),
    CONSTRAINT fk_des_usr FOREIGN KEY (id_usuario)  REFERENCES USUARIOS(id_usuario),
    UNIQUE (id_mensaje, id_usuario)
);

-- ============================================================
-- DML – DATOS DE PRUEBA
-- ============================================================

INSERT INTO NOTIFICACIONES (id_usuario, titulo, mensaje, tipo, leida)
VALUES (1, 'Bienvenido a CDGMFutsal',
        'Tu cuenta de administrador ha sido activada exitosamente. ¡Bienvenido al sistema!',
        'info', 0);

INSERT INTO MENSAJES_INTERNOS (id_remitente, asunto, cuerpo)
VALUES (1, 'Reunión de organización torneo apertura',
        'Hola equipo, recordamos que la reunión de organización del torneo apertura es el viernes 29 de mayo a las 3 PM.');

INSERT INTO DESTINATARIOS_MENSAJE (id_mensaje, id_usuario, leido)
VALUES (1, 1, 0);

-- ============================================================
--  FIN DEL MÓDULO 9
-- ============================================================
