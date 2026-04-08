-- =============================================================
-- SCHEMA SQL — Sistema de Gestão de Projetos Sociais
-- Autor: Elvis P.C.
-- Versão: 1.0 | Data: 2025
-- Banco: PostgreSQL / MySQL compatível
-- =============================================================

-- -------------------------------------------------------------
-- TABELA: enderecos
-- -------------------------------------------------------------
CREATE TABLE enderecos (
    id_endereco     SERIAL PRIMARY KEY,
    cep             CHAR(8)         NOT NULL,
    logradouro      VARCHAR(150)    NOT NULL,
    numero          VARCHAR(10)     NOT NULL,
    complemento     VARCHAR(60),
    bairro          VARCHAR(80)     NOT NULL,
    cidade          VARCHAR(80)     NOT NULL,
    uf              CHAR(2)         NOT NULL,
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);

-- -------------------------------------------------------------
-- TABELA: colaboradores
-- -------------------------------------------------------------
CREATE TABLE colaboradores (
    id_colaborador  SERIAL PRIMARY KEY,
    nome_completo   VARCHAR(120)    NOT NULL,
    cargo           VARCHAR(80)     NOT NULL,
    email           VARCHAR(100)    NOT NULL UNIQUE,
    telefone        VARCHAR(15),
    data_admissao   DATE            NOT NULL,
    ativo           BOOLEAN         NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
);

-- -------------------------------------------------------------
-- TABELA: projetos
-- -------------------------------------------------------------
CREATE TABLE projetos (
    id_projeto          SERIAL PRIMARY KEY,
    nome_projeto        VARCHAR(200)        NOT NULL,
    descricao           TEXT,
    data_inicio         DATE                NOT NULL,
    data_fim_prevista   DATE                NOT NULL,
    data_fim_real       DATE,
    orcamento_total     DECIMAL(12, 2)      NOT NULL DEFAULT 0,
    id_coordenador      INT                 NOT NULL,
    status              VARCHAR(20)         NOT NULL
                            CHECK (status IN ('Em andamento','Concluído','Suspenso','Planejado')),
    fonte_recurso       VARCHAR(100),
    created_at          TIMESTAMP           DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_projetos_coordenador
        FOREIGN KEY (id_coordenador) REFERENCES colaboradores(id_colaborador)
);

-- -------------------------------------------------------------
-- TABELA: beneficiarios
-- -------------------------------------------------------------
CREATE TABLE beneficiarios (
    id_beneficiario SERIAL PRIMARY KEY,
    nome_completo   VARCHAR(120)    NOT NULL,
    cpf             CHAR(11)        NOT NULL UNIQUE,
    data_nascimento DATE            NOT NULL,
    sexo            CHAR(1)         CHECK (sexo IN ('M','F','O')),
    telefone        VARCHAR(15),
    email           VARCHAR(100),
    id_endereco     INT             NOT NULL,
    data_cadastro   DATE            NOT NULL DEFAULT CURRENT_DATE,
    ativo           BOOLEAN         NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_beneficiarios_endereco
        FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco)
);

-- -------------------------------------------------------------
-- TABELA: atendimentos
-- -------------------------------------------------------------
CREATE TABLE atendimentos (
    id_atendimento  SERIAL PRIMARY KEY,
    id_beneficiario INT             NOT NULL,
    id_projeto      INT             NOT NULL,
    id_colaborador  INT             NOT NULL,
    data_atendimento DATE           NOT NULL,
    tipo_atendimento VARCHAR(50)    NOT NULL
                        CHECK (tipo_atendimento IN ('Visita','Oficina','Individual','Grupo','Online')),
    descricao       TEXT,
    duracao_minutos INT,
    resultado       VARCHAR(20)
                        CHECK (resultado IN ('Positivo','Neutro','Negativo')),
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_atendimentos_beneficiario
        FOREIGN KEY (id_beneficiario) REFERENCES beneficiarios(id_beneficiario),
    CONSTRAINT fk_atendimentos_projeto
        FOREIGN KEY (id_projeto) REFERENCES projetos(id_projeto),
    CONSTRAINT fk_atendimentos_colaborador
        FOREIGN KEY (id_colaborador) REFERENCES colaboradores(id_colaborador)
);

-- =============================================================
-- ÍNDICES — Otimização de consultas frequentes
-- =============================================================
CREATE INDEX idx_beneficiarios_cpf         ON beneficiarios(cpf);
CREATE INDEX idx_beneficiarios_ativo       ON beneficiarios(ativo);
CREATE INDEX idx_atendimentos_data         ON atendimentos(data_atendimento);
CREATE INDEX idx_atendimentos_beneficiario ON atendimentos(id_beneficiario);
CREATE INDEX idx_atendimentos_projeto      ON atendimentos(id_projeto);
CREATE INDEX idx_projetos_status           ON projetos(status);

-- =============================================================
-- VIEWS — Consultas prontas para relatórios
-- =============================================================

-- Total de atendimentos por projeto
CREATE VIEW vw_atendimentos_por_projeto AS
SELECT
    p.nome_projeto,
    p.status,
    COUNT(a.id_atendimento)     AS total_atendimentos,
    COUNT(DISTINCT a.id_beneficiario) AS beneficiarios_unicos,
    MIN(a.data_atendimento)     AS primeiro_atendimento,
    MAX(a.data_atendimento)     AS ultimo_atendimento
FROM projetos p
LEFT JOIN atendimentos a ON a.id_projeto = p.id_projeto
GROUP BY p.id_projeto, p.nome_projeto, p.status
ORDER BY total_atendimentos DESC;

-- Histórico completo por beneficiário
CREATE VIEW vw_historico_beneficiario AS
SELECT
    b.nome_completo             AS beneficiario,
    b.cpf,
    p.nome_projeto              AS projeto,
    a.data_atendimento,
    a.tipo_atendimento,
    a.resultado,
    c.nome_completo             AS colaborador_responsavel
FROM atendimentos a
JOIN beneficiarios  b ON b.id_beneficiario = a.id_beneficiario
JOIN projetos       p ON p.id_projeto      = a.id_projeto
JOIN colaboradores  c ON c.id_colaborador  = a.id_colaborador
ORDER BY b.nome_completo, a.data_atendimento;

-- Resumo mensal de atendimentos
CREATE VIEW vw_resumo_mensal AS
SELECT
    DATE_TRUNC('month', data_atendimento) AS mes,
    tipo_atendimento,
    COUNT(*)                              AS total,
    COUNT(DISTINCT id_beneficiario)       AS beneficiarios_distintos,
    ROUND(AVG(duracao_minutos), 0)        AS duracao_media_min
FROM atendimentos
GROUP BY DATE_TRUNC('month', data_atendimento), tipo_atendimento
ORDER BY mes, tipo_atendimento;

-- =============================================================
-- DADOS DE EXEMPLO (seed)
-- =============================================================
INSERT INTO enderecos (cep, logradouro, numero, bairro, cidade, uf)
VALUES
    ('01310100','Av. Paulista','1000','Bela Vista','São Paulo','SP'),
    ('20040020','Av. Rio Branco','50','Centro','Rio de Janeiro','RJ'),
    ('30130110','Av. Afonso Pena','100','Centro','Belo Horizonte','MG');

INSERT INTO colaboradores (nome_completo, cargo, email, data_admissao)
VALUES
    ('Ana Coordenadora','Coordenadora de Projetos','ana@ong.org','2022-03-01'),
    ('Bruno Assistente','Assistente Social','bruno@ong.org','2023-01-10'),
    ('Carla Educadora','Educadora Social','carla@ong.org','2023-06-15');

INSERT INTO projetos (nome_projeto, data_inicio, data_fim_prevista, orcamento_total, id_coordenador, status, fonte_recurso)
VALUES
    ('Projeto Transformar 2025','2025-01-01','2025-12-31',180000.00,1,'Em andamento','Edital Federal'),
    ('Programa Juventude Ativa','2025-03-01','2025-11-30',95000.00,1,'Em andamento','Doação Institucional');
