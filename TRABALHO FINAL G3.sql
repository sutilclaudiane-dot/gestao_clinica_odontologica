--- Após criar o database Clínica, criando o esquema de Gestão para que o mesmo não vá para o esquema públic.

create schema gestao_clinica;

--Tabelas para a Gestão da Clínica Odontológica

CREATE TABLE gestao_clinica.paciente (
  id_paciente SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(11) UNIQUE,
  nascimento DATE,
  telefone VARCHAR(15),
  email VARCHAR(100),
  endereco TEXT 
);

CREATE TABLE gestao_clinica.dentista (
  id_dentista SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  cpf VARCHAR(11) UNIQUE,
  cro VARCHAR(20),
  especialidade VARCHAR(50)
);

CREATE TABLE gestao_clinica.consulta (
  id_consulta SERIAL PRIMARY KEY,
  id_paciente INT REFERENCES gestao_clinica.paciente(id_paciente),
  id_dentista INT REFERENCES gestao_clinica.dentista(id_dentista),
  data DATE,
  hora TIME,
  descricao TEXT,
  prescricao TEXT
);

CREATE TABLE gestao_clinica.procedimento (
  id_procedimento SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT,
  duracao_media INT
);

CREATE TABLE gestao_clinica.consulta_procedimento (
  id_consulta INT REFERENCES gestao_clinica.consulta(id_consulta),
  id_procedimento INT REFERENCES gestao_clinica.procedimento(id_procedimento),
  PRIMARY KEY (id_consulta, id_procedimento)
);

CREATE TABLE gestao_clinica.Horario_Dentista (
  id_horario SERIAL PRIMARY KEY,
  id_dentista INT REFERENCES gestao_clinica.dentista(id_dentista),
  dia_semana VARCHAR (10),
  hora_inicio TIME,
  hora_fim TIME
);

--Inserir um mínimo de 10 registros em cada tabela (INSERT)

--Pacientes

INSERT INTO gestao_clinica.paciente (nome, cpf, nascimento, telefone, email, endereco) 
VALUES
('Ana Souza', '12345678900', '1990-05-10', '21999999999', 'ana@email.com', 'Rua A, 123'),
('Bruno Lima', '23456789011', '1985-03-22', '21988887777', 'bruno@email.com', 'Rua B, 456'),
('Carla Mendes', '34567890122', '1992-07-15', '21977776666', 'carla@email.com', 'Rua C, 789'),
('Daniel Rocha', '45678901233', '1988-11-30', '21966665555', 'daniel@email.com', 'Rua D, 321'),
('Eduarda Silva', '56789012344', '1995-09-05', '21955554444', 'eduarda@email.com', 'Rua E, 654'),
('Felipe Torres', '67890123455', '1991-01-18', '21944443333', 'felipe@email.com', 'Rua F, 987'),
('Gabriela Costa', '78901234566', '1987-06-25', '21933332222', 'gabriela@email.com', 'Rua G, 147'),
('Henrique Alves', '89012345677', '1993-12-12', '21922221111', 'henrique@email.com', 'Rua H, 258'),
('Isabela Freitas', '90123456788', '1996-04-08', '21911110000', 'isabela@email.com', 'Rua I, 369'),
('João Pedro', '01234567899', '1989-08-20', '21900009999', 'joao@email.com', 'Rua J, 741');

--Dentistas

INSERT INTO gestao_clinica.dentista (nome, cpf, cro, especialidade) 
VALUES
('Dr. Carlos Lima', '11122233344', 'CRO12345', 'Ortodontia'),
('Dra. Fernanda Souza', '22233344455', 'CRO23456', 'Endodontia'),
('Dr. Rafael Costa', '33344455566', 'CRO34567', 'Periodontia'),
('Dra. Juliana Mendes', '44455566677', 'CRO45678', 'Odontopediatria'),
('Dr. Lucas Rocha', '55566677788', 'CRO56789', 'Cirurgia'),
('Dra. Marina Torres', '66677788899', 'CRO67890', 'Ortodontia'),
('Dr. Thiago Silva', '77788899900', 'CRO78901', 'Endodontia'),
('Dra. Patrícia Freitas', '88899900011', 'CRO89012', 'Periodontia'),
('Dr. André Alves', '99900011122', 'CRO90123', 'Odontopediatria'),
('Dra. Bianca Costa', '00011122233', 'CRO01234', 'Cirurgia');

--Procedimentos

INSERT INTO gestao_clinica.procedimento (nome, descricao, duracao_media)
VALUES
('Limpeza', 'Limpeza dental completa', 30),
('Extração', 'Extração de dente', 45),
('Obturação', 'Tratamento de cárie com resina', 40),
('Canal', 'Tratamento endodôntico', 90),
('Aplicação de flúor', 'Prevenção de cáries', 20),
('Restauração', 'Reconstrução de dente', 50),
('Profilaxia', 'Remoção de placa bacteriana', 25),
('Radiografia', 'Imagem para diagnóstico', 15),
('Clareamento', 'Clareamento dental', 60),
('Ortodontia', 'Ajuste de aparelho', 30);

SELECT id_procedimento, nome, descricao 
FROM gestao_clinica.procedimento 
ORDER BY id_procedimento;

--Consultas (exemplo de 10 registros com id_paciente e id_dentista variados)

INSERT INTO gestao_clinica.consulta (id_paciente, id_dentista, data, hora, descricao, prescricao) 
VALUES
(1, 1, '2025-08-01', '09:00', 'Consulta de avaliação', 'Nenhuma'),
(2, 2, '2025-08-02', '10:00', 'Tratamento de canal', 'Amoxicilina'),
(3, 3, '2025-08-03', '11:00', 'Limpeza dental', 'Nenhuma'),
(4, 4, '2025-08-04', '12:00', 'Consulta pediátrica', 'Ibuprofeno'),
(5, 5, '2025-08-05', '13:00', 'Extração de dente', 'Dipirona'),
(6, 6, '2025-08-06', '14:00', 'Ajuste de aparelho', 'Nenhuma'),
(7, 7, '2025-08-07', '15:00', 'Tratamento de cárie', 'Nenhuma'),
(8, 8, '2025-08-08', '16:00', 'Restauração', 'Nenhuma'),
(9, 9, '2025-08-09', '17:00', 'Consulta pediátrica', 'Nenhuma'),
(10, 10, '2025-08-10', '18:00', 'Cirurgia de dente', 'Antibiótico');

SELECT id_consulta
FROM gestao_clinica.consulta
ORDER BY id_consulta;



--Consulta_Procedimento (associações entre consultas e procedimentos)
DELETE FROM gestao_clinica.consulta_procedimento 
WHERE id_consulta BETWEEN 11 AND 20 
OR id_procedimento BETWEEN 11 AND 20;
   
INSERT INTO gestao_clinica.consulta_procedimento (id_consulta, id_procedimento)
VALUES
(1, 1), (2, 4), (3, 1), (4, 5), (5, 2),
(6, 2), (7, 3), (8, 6), (9, 5), (1, 2);

--Horários dos dentistas
INSERT INTO gestao_clinica.Horario_Dentista (id_dentista, dia_semana, hora_inicio, hora_fim) VALUES
(1, 'Segunda', '08:00', '12:00'),
(2, 'Terça', '09:00', '13:00'),
(3, 'Quarta', '10:00', '14:00'),
(4, 'Quinta', '11:00', '15:00'),
(5, 'Sexta', '12:00', '16:00'),
(6, 'Segunda', '13:00', '17:00'),
(7, 'Terça', '14:00', '18:00'),
(8, 'Quarta', '15:00', '19:00'),
(9, 'Quinta', '16:00', '20:00'),
(10, 'Sexta', '17:00', '21:00');

--ÍNDICES

CREATE INDEX idx_especialidade ON gestao_clinica.dentista(especialidade);
CREATE INDEX idx_data_consulta ON gestao_clinica.consulta(data);

--ATUALIZAÇÕES

UPDATE gestao_clinica.paciente SET telefone = '21988887777' WHERE id_paciente = 11;
UPDATE gestao_clinica.dentista SET especialidade = 'Endodontia' WHERE cro = 'CRO12345';
UPDATE gestao_clinica.consulta SET descricao = 'Consulta de rotina com avaliação' WHERE id_consulta = 11;

--- EXCLUSÕES

--- DELETE FROM Paciente WHERE cpf = '123.456.789-00';
--- DELETE FROM Consulta WHERE data < '2025-01-10'
--- DELETE FROM Dentista WHERE especialidade = 'Endodontia' and CRO like 'CRO67890'

--- CINCO CONSULTAS CONTEXTUALIZADA
--- Cinco consultas contextualizadas:
--- Quantidade de consultas por especialidade

SELECT 
    d.especialidade,
    COUNT(c.id_consulta) AS total_consultas
FROM gestao_clinica.dentista d
LEFT JOIN gestao_clinica.consulta c ON d.id_dentista = c.id_dentista
GROUP BY d.especialidade
ORDER BY total_consultas;

--- Quantidade de consultas realizadas por cada dentista 
SELECT 
    d.nome AS dentista,
    d.especialidade,
    d.cro,
    COUNT(c.id_consulta) AS quantidade_consultas
FROM gestao_clinica.dentista d
LEFT JOIN gestao_clinica.Consulta c ON d.id_dentista = c.id_dentista
GROUP BY d.id_dentista, d.nome, d.especialidade, d.cro
ORDER BY quantidade_consultas DESC;

--- Pacientes com maior número de consultas/quantidade por paciente
SELECT 
    p.nome AS paciente,
    p.cpf,
    p.telefone,
    COUNT(c.id_consulta) AS quantidade_consultas
FROM gestao_clinica.paciente p
LEFT JOIN gestao_clinica.consulta c ON p.id_paciente = c.id_paciente
GROUP BY p.id_paciente, p.nome, p.cpf, p.telefone
ORDER BY quantidade_consultas DESC;

--- Lista de consultas ordenadas por data

CREATE VIEW gestao_clinica.vw_consultas_ordenadas AS
SELECT 
    c.id_consulta,
    p.nome AS nome_paciente,
    d.nome AS nome_dentista,
    c.data AS data_consulta,
    STRING_AGG(pr.nome, ', ' ORDER BY pr.nome) AS procedimentos_realizados
FROM gestao_clinica.consulta c
INNER JOIN gestao_clinica.paciente p ON c.id_paciente = p.id_paciente
INNER JOIN gestao_clinica.dentista d ON c.id_dentista = d.id_dentista
LEFT JOIN gestao_clinica.consulta_Procedimento cp ON c.id_consulta = cp.id_consulta
LEFT JOIN gestao_clinica.procedimento pr ON cp.id_procedimento = pr.id_procedimento
GROUP BY c.id_consulta, p.nome, d.nome, c.data
ORDER BY c.data DESC;

--- Média de consultas por dentista
SELECT 
    d.nome AS dentista,
    d.especialidade,
    COUNT(c.id_consulta) AS total_consultas,
    (SELECT ROUND(AVG(total_cons), 2) 
     FROM (SELECT COUNT(id_consulta) AS total_cons 
           FROM gestao_clinica.consulta 
           GROUP BY id_dentista) AS sub) AS media_geral
FROM gestao_clinica.dentista d
LEFT JOIN gestao_clinica.consulta c ON d.id_dentista = c.id_dentista
GROUP BY d.id_dentista, d.nome, d.especialidade
ORDER BY total_consultas DESC;

--- Após analisar, pensamos que alguns campos devem obrigatoriamente ser preeenchidos, campos que analisamos ser importante para a gestão da clínica, precisando assim alterar algumas tabelas.

-- Alterar tabela Paciente
ALTER TABLE gestao_clinica.paciente
ALTER COLUMN nome SET NOT NULL,
ALTER COLUMN cpf SET NOT NULL,
ALTER COLUMN nascimento SET NOT NULL,
ALTER COLUMN telefone SET NOT NULL,
ALTER COLUMN endereco SET NOT NULL;

-- Alterar tabela Dentista
ALTER TABLE gestao_clinica.dentista
ALTER COLUMN nome SET NOT NULL,
ALTER COLUMN cpf SET NOT NULL,
ALTER COLUMN cro SET NOT NULL,
ALTER COLUMN especialidade SET NOT NULL;

-- Alterar tabela Consulta
ALTER TABLE gestao_clinica.consulta
ALTER COLUMN id_paciente SET NOT NULL,
ALTER COLUMN id_dentista SET NOT NULL,
ALTER COLUMN data SET NOT NULL,
ALTER COLUMN hora SET NOT NULL;

-- Alterar tabela Procedimento
ALTER TABLE gestao_clinica.procedimento
ALTER COLUMN nome SET NOT NULL,
ALTER COLUMN duracao_media SET NOT NULL;

-- Alterar tabela Horario_Dentista
ALTER TABLE gestao_clinica.Horario_Dentista
ALTER COLUMN id_dentista SET NOT NULL,
ALTER COLUMN dia_semana SET NOT NULL,
ALTER COLUMN hora_inicio SET NOT NULL,
ALTER COLUMN hora_fim SET NOT NULL;

--- Corrigindo ID's 

ALTER SEQUENCE gestao_clinica.paciente_id_paciente_seq RESTART WITH 1;
ALTER SEQUENCE gestao_clinica.dentista_id_dentista_seq RESTART WITH 1;
ALTER SEQUENCE gestao_clinica.consulta_id_consulta_seq RESTART WITH 1;
ALTER SEQUENCE gestao_clinica.procedimento_id_procedimento_seq RESTART WITH 1;
ALTER SEQUENCE gestao_clinica.horario_dentista_id_horario_seq RESTART WITH 1;

DELETE FROM gestao_clinica.consulta_procedimento;
DELETE FROM gestao_clinica.consulta;
DELETE FROM gestao_clinica.horario_dentista;

INSERT INTO gestao_clinica.consulta (id_paciente, id_dentista, data, hora, descricao, prescricao) 
VALUES
('2025-08-01', '09:00', 'Consulta de avaliação', 'Nenhuma'),
('2025-08-02', '10:00', 'Tratamento de canal', 'Amoxicilina'),
( '2025-08-03', '11:00', 'Limpeza dental', 'Nenhuma'),
( '2025-08-04', '12:00', 'Consulta pediátrica', 'Ibuprofeno'),
( '2025-08-05', '13:00', 'Extração de dente', 'Dipirona'),
( '2025-08-06', '14:00', 'Ajuste de aparelho', 'Nenhuma'),
( '2025-08-07', '15:00', 'Tratamento de cárie', 'Nenhuma'),
( '2025-08-08', '16:00', 'Restauração', 'Nenhuma'),
( '2025-08-09', '17:00', 'Consulta pediátrica', 'Nenhuma'),
( '2025-08-10', '18:00', 'Cirurgia de dente', 'Antibiótico');

--- Precisamos refazer algumas partes dos códigos, usando o delete.