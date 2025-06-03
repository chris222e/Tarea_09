CREATE DATABASE Aprende_peru;
USE Aprende_peru;

CREATE TABLE Estudiantes (
    id_estudiante	 	INT PRIMARY KEY,
    nom_estudiante 		VARCHAR(50) NOT NULL,
    ape_estudiante 		VARCHAR(50) NOT NULL
);
INSERT INTO Estudiantes (id_estudiante, nom_estudiante, ape_estudiante) VALUES
(1, 'Christian Jose', 'Espinoza Espinoza'),
(2, 'Robert Alexis', 'Gomez Bolaños'),
(3, 'Cristiano Jose', 'Ronaldo santos'),
(4, 'Luis Alberto', 'Farfan Rojas '),
(5, 'Estefany Valeria', 'Mendoza Rios'),
(6, 'Jessica Milagros', 'Ayon Mendez'),
(7, 'Roxana Belen', 'Uribe Mendoza'),
(8, 'Richard Jose', 'lautaro Martinez'),
(9, 'Antual Sven', 'Ayon Tapia'),
(10, 'Jesus Paolo', 'Aveiro Amoreti ');


CREATE TABLE Tipo_evaluacion (
    id_tipo 			INT PRIMARY KEY,
    nom_tipo 			VARCHAR(100) NOT NULL,
    id_estudiante 		INT,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante)
);
INSERT INTO Tipo_evaluacion (id_tipo, nom_tipo, id_estudiante) VALUES
(1, 'Java', 1),
(2, 'PHP', 2),
(3, 'Python', 3),
(4, 'C#', 4),
(5, 'JavaScript', 5);


CREATE TABLE Evaluacion (
    id_evaluacion 		INT PRIMARY KEY,
    nom_evaluacion 		VARCHAR(100) NOT NULL,
    fecha_inicio 		DATETIME NOT NULL,
    fecha_fin 			DATETIME NOT NULL,
    tiempo_min 			INT NOT NULL,
    id_tipo 			INT,
    FOREIGN KEY (id_tipo) REFERENCES Tipo_evaluacion(id_tipo)
);
INSERT INTO Evaluacion (id_evaluacion, nom_evaluacion, fecha_inicio, fecha_fin, tiempo_min, id_tipo) VALUES
(1, 'Evaluación Java ', '2025-06-01 08:00:00', '2025-06-01 09:00:00', 60, 1),
(2, 'Evaluación PHP ', '2025-06-02 08:00:00', '2025-06-02 09:00:00', 60, 2),
(3, 'Evaluación Python ', '2025-06-03 08:00:00', '2025-06-03 09:00:00', 60, 3),
(4, 'Evaluación C# ', '2025-06-04 08:00:00', '2025-06-04 09:00:00', 60, 4),
(5, 'Evaluación JS ', '2025-06-05 08:00:00', '2025-06-05 09:00:00', 60, 5);



CREATE TABLE Pregunta (
    id_pregunta 		INT PRIMARY KEY,
    enunciado 			TEXT NOT NULL,
    puntaje 			DECIMAL(5,2) NOT NULL,
    id_evaluacion 		INT,
    FOREIGN KEY (id_evaluacion) REFERENCES Evaluacion(id_evaluacion)
);
INSERT INTO Pregunta (id_pregunta, enunciado, puntaje, id_evaluacion) VALUES
(1, '¿Cuál es el tipo de dato para almacenar enteros en Java?', 4.00, 1),
(2, '¿Qué palabra clave se usa para definir una clase en Java?', 4.00, 1),
(3, '¿Qué método se ejecuta primero en un programa Java?', 4.00, 1),
(4, '¿Qué operador se usa para comparar igualdad en Java?', 4.00, 1),
(5, '¿Cuál de estas opciones es un bucle en Java?', 4.00, 1);

INSERT INTO Pregunta (id_pregunta, enunciado, puntaje, id_evaluacion) VALUES
(6, '¿Cómo se define una variable en PHP?', 4.00, 2),
(7, '¿Cuál es la extensión de archivo para scripts PHP?', 4.00, 2),
(8, '¿Qué función se usa para imprimir en pantalla en PHP?', 4.00, 2),
(9, '¿Cómo se inicia un bloque PHP en HTML?', 4.00, 2),
(10, '¿Cuál de las siguientes estructuras es un bucle en PHP?', 4.00, 2);

INSERT INTO Pregunta (id_pregunta, enunciado, puntaje, id_evaluacion) VALUES
(11, '¿Cómo se declara una función en Python?', 4.00, 3),
(12, '¿Cuál es el tipo de dato que representa texto en Python?', 4.00, 3),
(13, '¿Qué palabra se usa para crear un bucle en Python?', 4.00, 3),
(14, '¿Cuál de estos operadores es de comparación?', 4.00, 3),
(15, '¿Qué estructura se usa para tomar decisiones en Python?', 4.00, 3);

INSERT INTO Pregunta (id_pregunta, enunciado, puntaje, id_evaluacion) VALUES
(16, '¿Qué símbolo se usa para terminar una instrucción en C#?', 4.00, 4),
(17, '¿Cuál es el tipo de dato para números enteros en C#?', 4.00, 4),
(18, '¿Qué palabra se usa para declarar una variable en C#?', 4.00, 4),
(19, '¿Qué estructura se usa para tomar decisiones en C#?', 4.00, 4),
(20, '¿Cuál de estos no es un tipo de bucle en C#?', 4.00, 4);

INSERT INTO Pregunta (id_pregunta, enunciado, puntaje, id_evaluacion) VALUES
(21, '¿Con qué palabra se declara una variable en JavaScript moderna?', 4.00, 5),
(22, '¿Qué símbolo se usa para concatenar cadenas en JavaScript?', 4.00, 5),
(23, '¿Qué tipo de datos representa una lista de elementos?', 4.00, 5),
(24, '¿Qué método se usa para imprimir algo en consola?', 4.00, 5),
(25, '¿Cuál es el resultado de 2 + "2" en JavaScript?', 4.00, 5);


-- Tabla de alternativas
CREATE TABLE Alternativa (
    id_alternativa 		INT PRIMARY KEY,
    texto 				TEXT NOT NULL,
    es_correcta 		BOOLEAN NOT NULL,
    id_pregunta 		INT,
    FOREIGN KEY (id_pregunta) REFERENCES Pregunta(id_pregunta)
);
-- Pregunta 1
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(1, 'int', 1, 1),
(2, 'double', 0, 1),
(3, 'char', 0, 1),
(4, 'String', 0, 1);

-- Pregunta 2
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(5, 'class', 1, 2),
(6, 'define', 0, 2),
(7, 'struct', 0, 2),
(8, 'object', 0, 2);

-- Pregunta 3
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(9, 'main', 1, 3),
(10, 'start', 0, 3),
(11, 'run', 0, 3),
(12, 'init', 0, 3);

-- Pregunta 4
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(13, '==', 1, 4),
(14, '=', 0, 4),
(15, 'equals', 0, 4),
(16, '!=', 0, 4);

-- Pregunta 5
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(17, 'for', 1, 5),
(18, 'func', 0, 5),
(19, 'if', 0, 5),
(20, 'switch', 0, 5);


-- Pregunta 6
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(21, '$variable', 1, 6),
(22, 'var variable', 0, 6),
(23, 'int variable', 0, 6),
(24, '#variable', 0, 6);

-- Pregunta 7
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(25, '.php', 1, 7),
(26, '.html', 0, 7),
(27, '.js', 0, 7),
(28, '.py', 0, 7);

-- Pregunta 8
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(29, 'echo', 1, 8),
(30, 'printf', 0, 8),
(31, 'write', 0, 8),
(32, 'document.write', 0, 8);

-- Pregunta 9
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(33, '<?php', 1, 9),
(34, '<php>', 0, 9),
(35, '<?', 0, 9),
(36, '<script>', 0, 9);

-- Pregunta 10
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(37, 'while', 1, 10),
(38, 'loop', 0, 10),
(39, 'foreach()', 0, 10),
(40, 'run', 0, 10);

-- Pregunta 11
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(41, 'def mi_funcion():', 1, 11),
(42, 'function mi_funcion()', 0, 11),
(43, 'func mi_funcion()', 0, 11),
(44, 'declare mi_funcion()', 0, 11);

-- Pregunta 12
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(45, 'str', 1, 12),
(46, 'text', 0, 12),
(47, 'varchar', 0, 12),
(48, 'character', 0, 12);

-- Pregunta 13
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(49, 'for', 1, 13),
(50, 'loop', 0, 13),
(51, 'iterate', 0, 13),
(52, 'repeat', 0, 13);

-- Pregunta 14
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(53, '==', 1, 14),
(54, '=', 0, 14),
(55, '!=!', 0, 14),
(56, 'equals', 0, 14);

-- Pregunta 15
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(57, 'if', 1, 15),
(58, 'switch', 0, 15),
(59, 'when', 0, 15),
(60, 'case', 0, 15);

-- Pregunta 16
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(61, ';', 1, 16),
(62, '.', 0, 16),
(63, ':', 0, 16),
(64, ',', 0, 16);

-- Pregunta 17
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(65, 'int', 1, 17),
(66, 'integer', 0, 17),
(67, 'num', 0, 17),
(68, 'float', 0, 17);

-- Pregunta 18
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(69, 'int', 1, 18),
(70, 'declare', 0, 18),
(71, 'var', 0, 18),
(72, 'define', 0, 18);

-- Pregunta 19
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(73, 'if', 1, 19),
(74, 'select', 0, 19),
(75, 'case', 0, 19),
(76, 'test', 0, 19);

-- Pregunta 20
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(77, 'repeat', 1, 20),
(78, 'for', 0, 20),
(79, 'while', 0, 20),
(80, 'do-while', 0, 20);

-- Pregunta 21
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(81, 'let', 1, 21),
(82, 'var', 0, 21),
(83, 'const', 0, 21),
(84, 'int', 0, 21);

-- Pregunta 22
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(85, '+', 1, 22),
(86, '&', 0, 22),
(87, '.', 0, 22),
(88, ',', 0, 22);

-- Pregunta 23
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(89, 'Array', 1, 23),
(90, 'Object', 0, 23),
(91, 'Set', 0, 23),
(92, 'Map', 0, 23);

-- Pregunta 24
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(93, 'console.log()', 1, 24),
(94, 'print()', 0, 24),
(95, 'write()', 0, 24),
(96, 'show()', 0, 24);

-- Pregunta 25
INSERT INTO Alternativa (id_alternativa, texto, es_correcta, id_pregunta) VALUES
(97, '"22"', 1, 25),
(98, '4', 0, 25),
(99, 'undefined', 0, 25),
(100, 'error', 0, 25);


-- Tabla de asignación (evaluaciones asignadas a estudiantes)
CREATE TABLE Asignacion (
    id_asignacion 		INT PRIMARY KEY,
    id_evaluacion 		INT,
    id_estudiante 		INT,
    FOREIGN KEY (id_evaluacion) REFERENCES Evaluacion(id_evaluacion),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    UNIQUE(id_evaluacion, id_estudiante) -- Un estudiante no puede tener más de una asignación por evaluación
);
-

CREATE TABLE Intento (
    id_intento 			INT PRIMARY KEY,
    fecha_inicio 		DATETIME NOT NULL,
    fecha_fin 			DATETIME NOT NULL,
    puntaje_obtenido 	DECIMAL(5,2) CHECK (puntaje_obtenido <= 20), -- evaluación vigesimal
    id_asignacion 		INT UNIQUE, -- Solo un intento por asignación
    FOREIGN KEY (id_asignacion) REFERENCES Asignacion(id_asignacion)
);
-- Tabla de respuestas
CREATE TABLE Respuesta (
    id_respuesta 		INT PRIMARY KEY,
    id_intento 			INT,
    id_pregunta 		INT,
    id_alternativa 		INT,
    FOREIGN KEY (id_intento) REFERENCES Intento(id_intento),
    FOREIGN KEY (id_pregunta) REFERENCES Pregunta(id_pregunta),
    FOREIGN KEY (id_alternativa) REFERENCES Alternativa(id_alternativa)
);

INSERT INTO Respuesta (id_intento, id_pregunta, id_alternativa) VALUES (1, 1, 2);
INSERT INTO Respuesta (id_intento, id_pregunta, id_alternativa) VALUES (1, 2, 5);
INSERT INTO Respuesta (id_intento, id_pregunta, id_alternativa) VALUES (1, 3, 10);
INSERT INTO Respuesta (id_intento, id_pregunta, id_alternativa) VALUES (1, 4, 15);
INSERT INTO Respuesta (id_intento, id_pregunta, id_alternativa) VALUES (1, 5, 18);







