CREATE DATABASE IF NOT EXISTS mrd_saude_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE mrd_saude_db;

-- ---------------------------------------------------------------------
-- 1 & 2. CREATE TABLE & CONSTRAINTS (PK, FK, NOT NULL, UNIQUE, CHECK)
-- ---------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS colaboradores (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_admissao DATE NOT NULL,
    status_colaborador ENUM('Ativo', 'Inativo') DEFAULT 'Ativo'
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf_cnpj VARCHAR(20) UNIQUE NOT NULL,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    cidade VARCHAR(60),
    estado CHAR(2)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS ramos_seguro (
    id_ramo INT AUTO_INCREMENT PRIMARY KEY,
    nome_ramo VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS produtos_seguro (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_ramo INT NOT NULL,
    nome_produto VARCHAR(100) NOT NULL,
    seguradora_parceira VARCHAR(100) NOT NULL,
    descricao TEXT,
    CONSTRAINT fk_ramo FOREIGN KEY (id_ramo) REFERENCES ramos_seguro(id_ramo) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS apolices_propostas (
    id_apolice INT AUTO_INCREMENT PRIMARY KEY,
    numero_apolice VARCHAR(50) UNIQUE NOT NULL,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    id_colaborador INT NOT NULL,
    tipo_registro ENUM('Proposta', 'Apólice Ativa', 'Cancelada', 'Renovada') NOT NULL,
    premio_liquido DECIMAL(10, 2) NOT NULL CHECK (premio_liquido >= 0),
    premio_total DECIMAL(10, 2) NOT NULL CHECK (premio_total >= 0),
    comissao_estimada DECIMAL(10, 2) NOT NULL CHECK (comissao_estimada >= 0),
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE RESTRICT,
    CONSTRAINT fk_produto FOREIGN KEY (id_produto) REFERENCES produtos_seguro(id_produto) ON DELETE RESTRICT,
    CONSTRAINT fk_colaborador FOREIGN KEY (id_colaborador) REFERENCES colaboradores(id_colaborador) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS item_cobertura (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_apolice INT NOT NULL,
    descricao_cobertura VARCHAR(150) NOT NULL,
    importancia_segurada DECIMAL(12, 2) NOT NULL CHECK (importancia_segurada >= 0),
    premio_item DECIMAL(10, 2) CHECK (premio_item >= 0),
    CONSTRAINT fk_apolice_item FOREIGN KEY (id_apolice) REFERENCES apolices_propostas(id_apolice) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS sinistros (
    id_sinistro INT AUTO_INCREMENT PRIMARY KEY,
    id_apolice INT NOT NULL,
    numero_sinistro VARCHAR(50) UNIQUE NOT NULL,
    data_ocorrencia DATE NOT NULL,
    data_aviso DATE NOT NULL,
    valor_estimado DECIMAL(12, 2) NOT NULL CHECK (valor_estimado >= 0),
    valor_pago DECIMAL(12, 2) DEFAULT 0.00 CHECK (valor_pago >= 0),
    status_sinistro ENUM('Aberto', 'Em Análise', 'Pago', 'Negado') NOT NULL,
    CONSTRAINT fk_apolice_sinistro FOREIGN KEY (id_apolice) REFERENCES apolices_propostas(id_apolice) ON DELETE RESTRICT
) ENGINE=InnoDB;


-- ---------------------------------------------------------------------
-- 3. INSERT INTO — MASSA DE DADOS (Com Variedade: Clientes sem compras, Cancelados, etc.)
-- ---------------------------------------------------------------------

INSERT INTO ramos_seguro (id_ramo, nome_ramo) VALUES
(1, 'Saúde'),
(2, 'Automotivo'),
(3, 'Vida'),
(4, 'Residencial');

INSERT INTO colaboradores (id_colaborador, nome, cargo, email, data_admissao) VALUES
(1, 'Ana Souza', 'Corretora Sênior', 'ana.souza@mrdsaude.com', '2022-03-15'),
(2, 'Carlos Silva', 'Gerente Comercial', 'carlos.silva@mrdsaude.com', '2020-01-10'),
(3, 'Beatriz Lima', 'Analista de Atendimento', 'beatriz.lima@mrdsaude.com', '2023-06-01');

-- Inclui clientes ativos E um cliente sem compras (exigência de variedade)
INSERT INTO clientes (id_cliente, nome, cpf_cnpj, tipo_cliente, telefone, email, cidade, estado) VALUES
(1, 'Tech Solutions Ltda', '12.345.678/0001-99', 'PJ', '(11) 98888-1111', 'contato@techsolutions.com', 'São Paulo', 'SP'),
(2, 'Mariana Oliveira', '123.456.789-00', 'PF', '(11) 97777-2222', 'mariana@email.com', 'Campinas', 'SP'),
(3, 'Roberto Carlos Souza', '987.654.321-11', 'PF', '(21) 96666-3333', 'roberto@email.com', 'Rio de Janeiro', 'RJ'),
(4, 'Juliana Mendes (Lead sem compras)', '444.333.222-11', 'PF', '(11) 95555-4444', 'juliana@email.com', 'Santos', 'SP');

INSERT INTO produtos_seguro (id_produto, id_ramo, nome_produto, seguradora_parceira, descricao) VALUES
(1, 1, 'Plano Saúde Empresarial PME', 'Amil', 'Cobertura nacional para empresas'),
(2, 2, 'Seguro Auto Frota', 'Porto Seguro', 'Cobertura completa para veículos corporativos'),
(3, 3, 'Seguro Vida em Grupo', 'Bradesco Seguros', 'Proteção familiar e acidentes pessoais'),
(4, 4, 'Residencial Premium', 'SulAmérica', 'Cobertura contra incêndio e roubo');

-- Inclui apólices ativas, canceladas e em formato de proposta
INSERT INTO apolices_propostas (id_apolice, numero_apolice, id_cliente, id_produto, id_colaborador, tipo_registro, premio_liquido, premio_total, comissao_estimada, data_inicio, data_fim) VALUES
(1, 'AP-2026-001', 1, 1, 1, 'Apólice Ativa', 15000.00, 16500.00, 3000.00, '2026-01-01', '2027-01-01'),
(2, 'AP-2026-002', 2, 2, 2, 'Apólice Ativa', 3500.00, 3800.00, 700.00, '2026-02-10', '2027-02-10'),
(3, 'AP-2026-003', 3, 4, 3, 'Cancelada', 1200.00, 1300.00, 240.00, '2026-03-01', '2026-04-01'),
(4, 'PROP-2026-004', 2, 3, 1, 'Proposta', 2500.00, 2700.00, 500.00, '2026-04-01', '2027-04-01');

INSERT INTO item_cobertura (id_item, id_apolice, descricao_cobertura, importancia_segurada, premio_item) VALUES
(1, 1, 'Assistência Médica Hospitalar Completa', 500000.00, 15000.00),
(2, 2, 'Cobertura Colisão, Roubo e Incêndio', 80000.00, 3500.00),
(3, 3, 'Danos Elétricos e Vendaval', 250000.00, 1200.00),
(4, 4, 'Morte Acidental e Invalidez', 100000.00, 2500.00);

-- Sinistros variados (Pago e Em Análise)
INSERT INTO sinistros (id_sinistro, id_apolice, numero_sinistro, data_ocorrencia, data_aviso, valor_estimado, valor_pago, status_sinistro) VALUES
(1, 2, 'SIN-2026-001', '2026-03-15', '2026-03-16', 4500.00, 4200.00, 'Pago'),
(2, 1, 'SIN-2026-002', '2026-04-02', '2026-04-03', 12000.00, 0.00, 'Em Análise');


-- ---------------------------------------------------------------------
-- 4. SELECT com JOIN
-- ---------------------------------------------------------------------
SELECT 
    a.numero_apolice,
    c.nome AS nome_cliente,
    p.nome_produto,
    r.nome_ramo,
    a.tipo_registro,
    a.premio_total
FROM apolices_propostas a
JOIN clientes c ON a.id_cliente = c.id_cliente
JOIN produtos_seguro p ON a.id_produto = p.id_produto
JOIN ramos_seguro r ON p.id_ramo = r.id_ramo;

SET SQL_SAFE_UPDATES = 0;

-- ---------------------------------------------------------------------
-- 5. UPDATE e DELETE
-- ---------------------------------------------------------------------
UPDATE apolices_propostas 
SET tipo_registro = 'Renovada' 
WHERE numero_apolice = 'AP-2026-002';

DELETE FROM item_cobertura 
WHERE id_apolice IN (SELECT id_apolice FROM apolices_propostas WHERE tipo_registro = 'Cancelada');

DELETE FROM apolices_propostas 
WHERE tipo_registro = 'Cancelada';


-- ---------------------------------------------------------------------
-- 6. CONSULTAS GERENCIAIS E DE AUDITORIA (Com Cabeçalho Exigido)
-- ---------------------------------------------------------------------

-- G01 — Qual o volume total de prémios e comissões geradas por ramo de seguro?
-- Atende: KPI de desempenho de vendas por linha de negócio
SELECT 
    r.nome_ramo,
    COUNT(a.id_apolice) AS total_contratos,
    SUM(a.premio_total) AS premio_total_arrecadado,
    SUM(a.comissao_estimada) AS comissao_total_estimada
FROM apolices_propostas a
JOIN produtos_seguro p ON a.id_produto = p.id_produto
JOIN ramos_seguro r ON p.id_ramo = r.id_ramo
GROUP BY r.nome_ramo;

-- A01 — Quais clientes cadastrados nunca contrataram nenhum seguro ou proposta?
-- Verifica: Clientes sem compras ativas ou propostas na base
SELECT 
    c.id_cliente,
    c.nome,
    c.cpf_cnpj,
    c.tipo_cliente
FROM clientes c
LEFT JOIN apolices_propostas a ON c.id_cliente = a.id_cliente
WHERE a.id_apolice IS NULL;

-- G02 — Quais são os sinistros em aberto / em análise e o seu impacto financeiro estimado?
-- Atende: Gestão de riscos e provisões financeiras
SELECT 
    s.numero_sinistro,
    c.nome AS cliente,
    s.data_ocorrencia,
    s.valor_estimado,
    s.status_sinistro
FROM sinistros s
JOIN apolices_propostas a ON s.id_apolice = a.id_apolice
JOIN clientes c ON a.id_cliente = c.id_cliente
WHERE s.status_sinistro IN ('Aberto', 'Em Análise');
