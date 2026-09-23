# MDR-Banco-de-dados

## M.R.D Saúde Corretora de Seguros Ltda.
Modelo Entidade-Relacionamento (MER) e Dicionário de Dados

# PARTE 1 — MODELO ENTIDADE-RELACIONAMENTO (MER)1.1 Apresentação da empresa
A M.R.D Saúde Corretora de Seguros Ltda. é uma empresa privada atuando há 20 anos no
mercado, com 24 funcionários focados nas vendas de seguro de saúde, seguro de vida, seguro
de carro e residencial, sendo 20 corretores para essas vendas (trabalha também com
freelancers, em média 8 a 10 pessoas). Há ainda a equipe administrativa, com 2 funcionários,
e a equipe financeira, com 2 funcionários.
A empresa oferece 6 serviços prestados, com aproximadamente 90 a 110 contratos por dia
(estimativa de 1.500 a 1.900 contratos por mês), e cerca de 25.000 a 30.000 mil clientes
ativos.


## 1.2 Regras de negócio gerais e clientes

**Cadastro e Onboarding de Cliente (Pessoa Física e Jurídica)**

O sistema de gestão da seguradora deve assegurar a integridade dos dados cadastrais desde a
entrada do lead ou proposta até a emissão da apólice, diferenciando o fluxo conforme o tipo
de cliente.

- **Cadastro de Pessoa Física (PF):** obrigatório o preenchimento de CPF válido, nome
  completo, data de nascimento, endereço residencial completo, e-mail, telefone de contato e
  dados socioeconômicos ou profissionais (quando exigido pelo perfil de risco do produto,
  especialmente para Seguro Saúde).
- **Cadastro de Pessoa Jurídica (PJ):** o sistema deve permitir o cadastro apenas mediante
  CNPJ ativo e regular junto à Receita Federal. Os dados obrigatórios incluem razão social,
  nome fantasia, CNAE, endereço fiscal e comercial, contatos do responsável legal/financeiro e
  informações contábeis básicas para análise de risco empresarial (ex.: faturamento presumido
  para seguros corporativos/saúde PME).
- **Unicidade Cadastral:** o sistema deve realizar validação em tempo real para evitar
  duplicidade de CPFs ou CNPJs, vinculando todas as apólices ativas de saúde, residencial e
  automóvel a um único ID de cliente centralizado (visão 360°).

**Análise de Risco, Crédito e Bloqueio de Apólices**

A concessão, renovação ou emissão de coberturas para os ramos de Saúde, Residencial e
Automóvel está condicionada a rigorosas regras de subscrição de risco e adimplência
financeira.

- **Análise de Crédito e Inadimplência:** todo cliente (PF ou PJ) possui um perfil de crédito
  e histórico financeiro atrelado. Caso haja parcelas de prêmio em atraso superior ao limite
  de tolerância (ex.: 10 dias úteis) ou restrições ativas em órgãos de proteção ao crédito
  (Serasa/SPC), o sistema deve sinalizar automaticamente o cadastro.
- **Bloqueio de Novas Vendas e Renovações:** clientes com pendências financeiras ativas ou
  restrições cadastrais severas ficam impedidos de emitir novas apólices, realizar upgrades em
  planos de saúde ou adicionar novos bens (veículos/imóveis) às apólices existentes até a
  regularização do débito.
- **Subscrição de Risco Automatizada:**
  - *Auto:* verificação automática de CEP de pernoite, histórico de sinistralidade da CNH e
    restrições do veículo na base de dados de gravames/roubo.
  - *Residencial:* validação do tipo de construção, localização de risco (áreas de alagamento
    ou restrição de segurança) e valor segurado da edificação.
  - *Saúde:* aplicação de questionário de saúde (Declaração de Saúde) obrigatório,
    direcionando casos com comorbidades graves para análise manual da junta médica interna
    antes da aceitação.

**Diretrizes de Atendimento e Gestão de Sinistros**

O atendimento ao segurado deve seguir padrões de qualidade, agilidade e clareza, dividindo-se
entre canais digitais e centrais de suporte especializado.

- **Omnichannel e Roteirização:** o atendimento deve integrar os canais de voz (ligação),
  presencial e por chat (WhatsApp). O sistema deve direcionar o segurado com base no produto:
  - *Seguro Auto e Residencial:* foco em emergências, assistência 24h e abertura rápida de
    sinistro (colisão, guincho, encanador, eletricista).
  - *Seguro Saúde:* foco em rede credenciada, autorização de exames/procedimentos e
    orientações de reembolso.
- **SLA (Service Level Agreement) de Resposta:**
  - Abertura de sinistro de emergência (Auto/Residencial): atendimento imediato em até 5
    minutos na fila prioritária de assistência 24h.
  - Autorização de procedimentos de saúde simples/ambulatoriais: até 24 horas úteis.
  - Análise de indenização de sinistros materiais: conclusão da análise documental e parecer
    em até 15 dias corridos (conforme regulamentação do setor).
- **Tratativa de Cancelamentos e Reclamações:** todo pedido de cancelamento de apólice deve
  passar por uma régua de retenção automatizada, calculando prêmios a devolver (pro rata die)
  e registrando o motivo principal para melhoria contínua dos produtos.

## 1.3 Entidades e atributos

**COLABORADORES** (Equipe Comercial e Interna)
- id_colaborador (PK)
- nome
- cpf
- data_nascimento
- endereco
- email
- telefone
- comissao (percentual de comissão sobre o valor do contrato)
- susep_registro (registro profissional na SUSEP, aplicável para corretores parceiros ou
  internos)

**CLIENTES_PJ** (Segurados — Pessoa Jurídica)
- id_cliente (PK)
- razao_social
- cnpj (obrigatório e único)
- ie (Inscrição Estadual)
- endereco
- email
- telefone
- limite_credito (limite financeiro para emissão e faturamento de apólices corporativas, como
  Saúde PME ou Frotas)
- cadastro_ativo (status: Ativo / Bloqueado por inadimplência ou restrição Serasa)

**CLIENTES_PF** (Segurados — Pessoa Física)
- id_cliente (PK)
- nome_completo
- cpf (obrigatório e único)
- rg (Registro Geral / Identidade)
- data_nascimento (essencial para cálculo de risco e prêmio em seguros de Vida, Auto ou
  Saúde)
- endereco
- email
- telefone
- limite_credito (limite financeiro para parcelamento próprio ou financiamento de prêmios de
  apólices)
- cadastro_ativo (status: Ativo / Bloqueado por inadimplência ou restrição cadastral)

**RAMOS_SEGURO** (Categorias)
- id_ramo (PK)
- nome_ramo (ex.: Seguro Saúde, Seguro Automóvel, Seguro Residencial)

**PRODUTOS_SEGURO** (Planos, Coberturas e Pacotes)
- id_produto (PK)
- codigo_plano (código único de identificação do plano/cobertura, equivalente ao SKU)
- descricao (detalhes do plano, limites máximos de indenização e franquias)
- premio_base (preço base do seguro/prêmio cobrado)
- id_ramo (FK) → relacionado à tabela de Ramos de Seguro

**APOLICES / PROPOSTAS**
- id_apolice (PK)
- numero_apolice (número oficial da apólice registrada)
- data_emissao
- inicio_vigencia
- fim_vigencia
- valor_premio_total (valor total do seguro contratado)
- desconto_aplicado
- aprovacao_gerencial (S/N para descontos comerciais ou subscrições de risco acima da alçada
  padrão)
- forma_pagamento (ex.: Boleto PJ, Cartão Corporativo, Débito em Conta)
- status_apolice (ex.: Em Análise de Risco/Underwriting, Vigente, Cancelada, Inadimplente)
- id_cliente (FK)
- id_colaborador (FK) (corretor ou vendedor interno responsável pela venda)

**PRESTADORES_SERVICO**

No setor de seguros, os parceiros estratégicos são a rede credenciada de atendimento (oficinas
mecânicas para automóveis, prestadores de assistência residencial e hospitais/clínicas para
saúde).
- id_prestador (PK)
- razao_social
- cnpj
- ie
- especialidade (ex.: Oficina Credenciada Auto, Rede Hospitalar Saúde, Assistência 24h
  Residencial)
- email
- endereco
- telefone

**SINISTROS**

Em vez de registrar compras de mercadorias para estoque, uma seguradora registra eventos de
sinistros (acionamentos de seguro, colisões, reparos residenciais ou pedidos de reembolso de
saúde).
- id_sinistro (PK)
- numero_sinistro
- data_ocorrencia
- data_registro
- id_apolice (FK)
- id_prestador (FK) (prestador ou oficina/clínica encarregada do atendimento)
- valor_indenizacao (custo financeiro do sinistro ou reembolso pago)
- status_sinistro (ex.: Aberto, Em Análise, Regulado, Pago, Encerrado)

## 1.4 Relacionamentos e cardinalidades

**CLIENTE faz PROPOSTA**
Um Cliente pode fazer várias Propostas (1:N). Uma Proposta pertence a apenas um Cliente
(1:1).

**CORRETOR atende PROPOSTA**
Um Corretor/Colaborador pode gerenciar várias Propostas (1:N). Uma Proposta é atendida por
apenas um Corretor (1:1).

**PROPOSTA contém ITEM_COBERTURA**
Uma Proposta possui um ou vários Itens de Cobertura (1:N). Um Item de Cobertura pertence a
uma única Proposta (1:1).

**PRODUTO_SEGURO está em PROPOSTA**
Um Produto de Seguro pode estar em vários Itens de Propostas (1:N). Um Item de Proposta
refere-se a apenas um Produto de Seguro (1:1).

**RAMO_SEGURO possui PRODUTOS_SEGURO**
Um Ramo de Seguro possui vários Produtos (1:N). Um Produto de Seguro pertence a um Ramo
(1:1).

**SEGURADORA gera EXTRATO_COMISSAO**
Uma Seguradora envia vários Extratos de Comissões (1:N). O repasse gera a movimentação
financeira da comissão do Produto (1:N).

---

# PARTE 2 — DICIONÁRIO DE DADOS

## 2.1 Modelo conceitual

Este modelo representa uma corretora de seguros (M.R.D Saúde Corretora de Seguros Ltda.) na
qual cada cliente, pessoa física ou jurídica, contrata uma ou mais apólices/propostas por
intermédio de um colaborador (corretor). Cada apólice reúne um ou mais produtos de seguro,
vinculados aos ramos de seguro oferecidos, e pode, ao longo da vigência, originar um ou mais
sinistros, atendidos por um prestador de serviço credenciado.

| Entidade | Relaciona-se com | Cardinalidade |
|---|---|---|
| CLIENTES_PF / CLIENTES_PJ | APOLICES_PROPOSTAS | 1:N — um cliente pode contratar várias apólices/propostas; uma apólice/proposta pertence a um único cliente |
| COLABORADORES | APOLICES_PROPOSTAS | 1:N — um colaborador (corretor) pode atender várias apólices/propostas; uma apólice/proposta é atendida por apenas um colaborador |
| APOLICES_PROPOSTAS | PRODUTOS_SEGURO | N:N, resolvida pelo grupo repetitivo ITEM_COBERTURA — uma apólice pode reunir vários produtos/coberturas; um produto pode estar presente em várias apólices |
| RAMOS_SEGURO | PRODUTOS_SEGURO | 1:N — um ramo de seguro possui vários produtos; um produto pertence a um único ramo |
| APOLICES_PROPOSTAS | SINISTROS | 1:N — uma apólice pode gerar vários sinistros ao longo da vigência; um sinistro está vinculado a uma única apólice |
| PRESTADORES_SERVICO | SINISTROS | 1:N — um prestador credenciado pode atender vários sinistros; um sinistro é atendido por um único prestador |

APOLICES_PROPOSTAS é a entidade associativa entre CLIENTE, COLABORADOR e PRODUTO_SEGURO (um
colaborador atende várias apólices, um cliente contrata várias apólices ao longo do tempo, e
cada apólice pode reunir uma ou mais coberturas contratadas por meio do grupo repetitivo
ITEM_COBERTURA).

**Cliente (PF ou PJ)** é a pessoa física ou jurídica que contrata um ou mais seguros junto à
corretora.
**Colaborador** é o funcionário da corretora responsável pela venda e pelo acompanhamento das
propostas e apólices, incluindo corretores internos e parceiros freelance com registro na
SUSEP.
**Ramo de Seguro** é a categoria geral de cobertura oferecida pela corretora (ex.: Saúde, Vida,
Automóvel, Residencial).
**Produto de Seguro** é o plano ou pacote específico de cobertura, vinculado a um único ramo de
seguro.
**Apólice/Proposta** é o contrato de seguro firmado entre o cliente e a corretora, podendo
reunir uma ou mais coberturas contratadas.
**Prestador de Serviço** é a empresa da rede credenciada (oficina mecânica, hospital, clínica ou
assistência 24h) que atende o cliente em caso de sinistro.
**Sinistro** é o evento de acionamento do seguro (colisão, sinistro residencial, pedido de
reembolso de saúde etc.) que gera análise e, quando procedente, indenização ao cliente.

## 2.2 Fluxo de dados (visão de DFD)

Cliente (PF ou PJ) procura a corretora ou é abordado por um Colaborador → cadastro ou
atualização em CLIENTES_PF ou CLIENTES_PJ, com validação de unicidade de CPF/CNPJ →
o Colaborador monta a proposta, selecionando um ou mais PRODUTOS_SEGURO vinculados aos
RAMOS_SEGURO contratados → o sistema registra o contrato em APOLICES_PROPOSTAS, junto
com os itens de cobertura escolhidos (ITEM_COBERTURA) → durante a vigência da apólice, a
ocorrência de um evento coberto gera um registro em SINISTROS, vinculando a apólice ao
PRESTADOR_SERVICO responsável pelo atendimento (oficina, hospital ou assistência) →
toda leitura ou escrita nessas tabelas é registrada pelo log de acesso do SGBD (§2.3), o que
sustenta auditoria e conformidade com a LGPD (§2.6).

## 2.3 Convenções do dicionário

**SGBD:** MySQL 8, mecanismo de armazenamento InnoDB — cuida da persistência dos arquivos de
dados, do log de transações (redo/undo) e mantém o índice primário clusterizado por chave.

**Codificação de caracteres:** utf8mb4 com collation utf8mb4_0900_ai_ci. Escolhida em vez de
latin1 por cobrir acentuação do português sem perda em campos de nome, endereço e texto livre,
e por ser compatível com qualquer caractere Unicode que apareça em observações de sinistro ou
descrições de produto.

**Notação formal (símbolos usados neste dicionário):**

| Símbolo | Significado |
|---|---|
| = | é composto de |
| + | e (conecta elementos obrigatórios) |
| ( ) | opcional |
| { }, n{ }m | iteração, com limite mínimo n e máximo m |
| [ \| ] | escolha obrigatória entre alternativas |
| / / | rótulo de um grupo repetitivo |
| @ | identificador (chave primária) |
| * * | comentário, fora da estrutura formal |

**Prefixos:** NM_ nome, DT_ data, ID_ identificador (não sofre operação matemática), CD_ código
de domínio, QT_ quantidade/valor numérico, TP_ tipo (categorização), IN_ indicador booleano.
Este caso também usa DS_ (descrição/texto livre) — não está entre os sete prefixos-padrão, mas
segue o mesmo princípio e é aplicado aos campos de contato e endereço (e-mail, telefone,
endereço), tratados como texto livre sem validação estrutural neste modelo.

**Versão deste dicionário:** v1.0, 15/setembro/2026. Qualquer alteração de estrutura deve gerar
nova revisão registrada nesta seção; a prática atende, ela própria, ao princípio de
rastreabilidade exigido pela LGPD (art. 6º, X).

## 2.4 Dicionário de dados por entidade

### COLABORADORES

COLABORADORES = @ID_COLABORADOR + NM_COLABORADOR + ID_CPF + DT_NASCIMENTO + DS_ENDERECO +
DS_EMAIL + DS_TELEFONE + QT_COMISSAO_PERCENTUAL + (ID_SUSEP)

Leitura: @ID_COLABORADOR é o identificador único; os sete campos seguintes conectados por +
são obrigatórios; (ID_SUSEP) vem entre ( ) porque o registro profissional na SUSEP é
aplicável apenas a corretores parceiros ou internos habilitados, não a todo colaborador
administrativo.

| Atributo | Tipo físico | Obrigatório | Significado e relevância |
|---|---|---|---|
| ID_COLABORADOR | integer | Sim (PK) | Código de localização do registro; não sofre operação matemática. |
| NM_COLABORADOR | varchar(120) | Sim | Nome completo do colaborador; identifica o responsável pela venda no contrato e nos relatórios de comissão. |
| ID_CPF | char(11) | Sim (único) | Documento de identificação civil; usado para validação cadastral e emissão de recibo de comissão. |
| DT_NASCIMENTO | date | Sim | Data de nascimento, usada para cálculo de tempo de casa e elegibilidade a benefícios internos. |
| DS_ENDERECO | varchar(200) | Sim | Endereço residencial de contato administrativo. |
| DS_EMAIL | varchar(120) | Sim | Canal de contato eletrônico e de acesso ao sistema. |
| DS_TELEFONE | varchar(20) | Sim | Canal de contato telefônico. |
| QT_COMISSAO_PERCENTUAL | decimal(5,2) | Sim | Percentual de comissão aplicado sobre o valor do contrato vendido; base do cálculo do extrato de comissão. |
| ID_SUSEP | varchar(20) | Não | Registro profissional na SUSEP, exigido por regulação do setor para corretores parceiros ou internos habilitados à venda. |

Índices: PK ID_COLABORADOR (clusterizado); índice único em ID_CPF; índice secundário em
NM_COLABORADOR (busca por nome nos relatórios de comissão).

### CLIENTES_PF (Segurados — Pessoa Física)

CLIENTES_PF = @ID_CLIENTE + NM_CLIENTE + ID_CPF + ID_RG + DT_NASCIMENTO + DS_ENDERECO +
DS_EMAIL + DS_TELEFONE + QT_LIMITE_CREDITO + IN_CADASTRO_ATIVO

Leitura: ID_CPF obrigatório e único garante a unicidade cadastral exigida na regra de negócio;
os demais campos são obrigatórios e conectados por +; não há campos opcionais nesta entidade
porque o cadastro completo é condição para emissão de apólice.

| Atributo | Tipo físico | Obrigatório | Significado e relevância |
|---|---|---|---|
| ID_CLIENTE | integer | Sim (PK) | Identificador único do cliente, centralizado para a visão 360° de todas as apólices ativas (saúde, residencial, automóvel). |
| NM_CLIENTE | varchar(120) | Sim | Nome completo do segurado; identifica o cliente no contrato e no atendimento. |
| ID_CPF | char(11) | Sim (único) | Documento de identificação civil; validado em tempo real para evitar duplicidade cadastral. |
| ID_RG | varchar(20) | Sim | Registro Geral (identidade), complementar ao CPF na análise cadastral. |
| DT_NASCIMENTO | date | Sim | Essencial para cálculo de risco e prêmio em seguros de Vida, Auto ou Saúde. |
| DS_ENDERECO | varchar(200) | Sim | Endereço residencial completo, exigido no onboarding. |
| DS_EMAIL | varchar(120) | Sim | Canal de contato eletrônico e de envio de apólice/boleto. |
| DS_TELEFONE | varchar(20) | Sim | Canal de contato telefônico, usado inclusive no atendimento de sinistro. |
| QT_LIMITE_CREDITO | decimal(10,2) | Sim | Limite financeiro para parcelamento próprio ou financiamento de prêmios de apólices. |
| IN_CADASTRO_ATIVO | boolean | Sim | Indica se o cadastro está Ativo ou Bloqueado por inadimplência ou restrição cadastral (Serasa/SPC); cliente bloqueado não emite novas apólices. |

*Quando o produto contratado for Seguro Saúde, o cadastro é complementado por dados
socioeconômicos/profissionais e pela Declaração de Saúde exigidos na subscrição de risco,
tratados como informação sensível (ver §2.6).*

Índices: PK ID_CLIENTE (clusterizado); índice único em ID_CPF (garante a unicidade cadastral e
acelera a busca de "todas as apólices do cliente X").

### CLIENTES_PJ (Segurados — Pessoa Jurídica)

CLIENTES_PJ = @ID_CLIENTE + NM_RAZAO_SOCIAL + ID_CNPJ + ID_IE + DS_ENDERECO + DS_EMAIL +
DS_TELEFONE + QT_LIMITE_CREDITO + IN_CADASTRO_ATIVO

Leitura: ID_CNPJ obrigatório e único garante a unicidade cadastral e a validação de CNPJ ativo
e regular junto à Receita Federal; a estrutura espelha a de CLIENTES_PF, trocando os
documentos de pessoa física pelos de pessoa jurídica.

| Atributo | Tipo físico | Obrigatório | Significado e relevância |
|---|---|---|---|
| ID_CLIENTE | integer | Sim (PK) | Identificador único do cliente, centralizado na mesma visão 360° usada para CLIENTES_PF. |
| NM_RAZAO_SOCIAL | varchar(150) | Sim | Razão social da empresa segurada; identifica o cliente no contrato. |
| ID_CNPJ | char(14) | Sim (único) | Documento de identificação da pessoa jurídica; validado como ativo e regular na Receita Federal antes do cadastro. |
| ID_IE | varchar(20) | Sim | Inscrição Estadual, complementar ao CNPJ na análise cadastral e fiscal. |
| DS_ENDERECO | varchar(200) | Sim | Endereço fiscal e comercial da empresa. |
| DS_EMAIL | varchar(120) | Sim | Canal de contato eletrônico do responsável legal/financeiro. |
| DS_TELEFONE | varchar(20) | Sim | Canal de contato telefônico do responsável legal/financeiro. |
| QT_LIMITE_CREDITO | decimal(12,2) | Sim | Limite financeiro para emissão e faturamento de apólices corporativas, como Saúde PME ou Frotas. |
| IN_CADASTRO_ATIVO | boolean | Sim | Indica se o cadastro está Ativo ou Bloqueado por inadimplência ou restrição Serasa. |

*Dados contábeis básicos (ex.: faturamento presumido) são exigidos para análise de risco
empresarial em seguros corporativos/saúde PME, mas ficam fora deste dicionário por não
compor a estrutura mínima de cadastro.*

Índices: PK ID_CLIENTE (clusterizado); índice único em ID_CNPJ.

### RAMOS_SEGURO

RAMOS_SEGURO = @ID_RAMO + NM_RAMO

Leitura: entidade simples de domínio, sem campos opcionais; cada ramo (Saúde, Vida,
Automóvel, Residencial) é cadastrado uma única vez e referenciado por vários produtos.

| Atributo | Tipo físico | Obrigatório | Significado e relevância |
|---|---|---|---|
| ID_RAMO | integer | Sim (PK) | Identificador do ramo de seguro. |
| NM_RAMO | varchar(60) | Sim | Nome do ramo (ex.: Seguro Saúde, Seguro Automóvel, Seguro Residencial, Seguro de Vida). |

Índices: PK ID_RAMO; índice único em NM_RAMO (evita duplicidade de ramo).

### PRODUTOS_SEGURO (Planos, Coberturas e Pacotes)

PRODUTOS_SEGURO = @ID_PRODUTO + CD_PLANO + DS_DESCRICAO + QT_PREMIO_BASE + ID_RAMO

Leitura: CD_PLANO usa o prefixo de código de domínio por equivaler ao SKU do produto (código
único de identificação do plano/cobertura); ID_RAMO é obrigatório e garante o 1:N com
RAMOS_SEGURO.

| Atributo | Tipo físico | Obrigatório | Significado e relevância |
|---|---|---|---|
| ID_PRODUTO | integer | Sim (PK) | Identificador do produto de seguro. |
| CD_PLANO | varchar(30) | Sim (único) | Código único do plano/cobertura, equivalente ao SKU. |
| DS_DESCRICAO | text | Sim | Detalhes do plano, limites máximos de indenização e franquias. |
| QT_PREMIO_BASE | decimal(10,2) | Sim | Preço base do seguro/prêmio cobrado antes de descontos comerciais. |
| ID_RAMO | integer | Sim (FK) | Referência ao ramo de seguro ao qual o produto pertence. |

Índices: PK ID_PRODUTO; índice único em CD_PLANO; índice em ID_RAMO (listar produtos por
ramo).

### APOLICES_PROPOSTAS

APOLICES_PROPOSTAS = @ID_APOLICE + ID_NUMERO_APOLICE + DT_EMISSAO + DT_INICIO_VIGENCIA +
DT_FIM_VIGENCIA + QT_PREMIO_TOTAL + QT_DESCONTO_APLICADO + IN_APROVACAO_GERENCIAL +
[TP_BOLETO | TP_CARTAO_CORPORATIVO | TP_DEBITO_CONTA] + TP_STATUS_APOLICE + ID_CLIENTE +
ID_COLABORADOR + 1{/ITEM_COBERTURA/ = ID_PRODUTO + QT_VALOR_COBERTURA}10

Leitura: ID_NUMERO_APOLICE usa o prefixo de identificador por ser um número oficial de
registro externo da apólice, não um código interno de domínio; [TP_BOLETO |
TP_CARTAO_CORPORATIVO | TP_DEBITO_CONTA] exige escolher exatamente uma forma de pagamento;
1{ /ITEM_COBERTURA/ }10 é a iteração que permite de uma a dez coberturas/produtos por apólice,
cada uma com seu próprio grupo de campos rotulado por / /; ID_CLIENTE e ID_COLABORADOR ligam
a apólice ao cliente e ao colaborador responsável, sem detalhar essas entidades associativas
novamente aqui.

| Atributo | Tipo físico | Obrigatório | Significado e relevância |
|---|---|---|---|
| ID_APOLICE | integer | Sim (PK) | Identificador interno da apólice/proposta. |
| ID_NUMERO_APOLICE | varchar(30) | Sim (único) | Número oficial da apólice registrada; usado em comunicações externas e no SUSEP. |
| DT_EMISSAO | date | Sim | Data de emissão da apólice. |
| DT_INICIO_VIGENCIA | date | Sim | Início da cobertura contratada. |
| DT_FIM_VIGENCIA | date | Sim | Fim da cobertura contratada; base do cálculo de renovação. |
| QT_PREMIO_TOTAL | decimal(10,2) | Sim | Valor total do seguro contratado. |
| QT_DESCONTO_APLICADO | decimal(10,2) | Sim | Valor de desconto comercial aplicado sobre o prêmio total. |
| IN_APROVACAO_GERENCIAL | boolean | Sim | Indica S/N se descontos comerciais ou subscrições de risco acima da alçada padrão foram aprovados pela gerência. |
| TP_BOLETO \| TP_CARTAO_CORPORATIVO \| TP_DEBITO_CONTA | varchar(20) | Sim (escolha) | Forma de pagamento contratada (Boleto, Cartão Corporativo ou Débito em Conta). |
| TP_STATUS_APOLICE | varchar(30) | Sim | Situação da apólice (Em Análise de Risco/Underwriting, Vigente, Cancelada, Inadimplente). |
| ID_CLIENTE | integer | Sim (FK) | Referência ao cliente titular (CLIENTES_PF ou CLIENTES_PJ), entidade associativa não detalhada novamente aqui. |
| ID_COLABORADOR | integer | Sim (FK) | Referência ao corretor/colaborador responsável pela venda. |
| ID_PRODUTO (por item) | integer | Sim | Produto/cobertura contratado dentro da apólice. |
| QT_VALOR_COBERTURA (por item) | decimal(10,2) | Sim | Valor de prêmio correspondente àquele item de cobertura dentro da apólice. |

Índices: PK ID_APOLICE; índice único em ID_NUMERO_APOLICE; índice em ID_CLIENTE (listar
apólices do cliente); índice em ID_COLABORADOR (relatório de comissão); índice em
DT_FIM_VIGENCIA (fila de renovação).

### PRESTADORES_SERVICO

PRESTADORES_SERVICO = @ID_PRESTADOR + NM_RAZAO_SOCIAL + ID_CNPJ + ID_IE + TP_ESPECIALIDADE +
DS_EMAIL + DS_ENDERECO + DS_TELEFONE

Leitura: entidade cadastral da rede credenciada (oficinas, hospitais/clínicas e assistências
24h); todos os campos são obrigatórios e conectados por +, sem opcionais, pois o
credenciamento exige cadastro completo antes do vínculo com um sinistro.

| Atributo | Tipo físico | Obrigatório | Significado e relevância |
|---|---|---|---|
| ID_PRESTADOR | integer | Sim (PK) | Identificador do prestador credenciado. |
| NM_RAZAO_SOCIAL | varchar(150) | Sim | Razão social do prestador (oficina, hospital, clínica ou assistência). |
| ID_CNPJ | char(14) | Sim (único) | Documento de identificação da pessoa jurídica prestadora. |
| ID_IE | varchar(20) | Sim | Inscrição Estadual do prestador. |
| TP_ESPECIALIDADE | varchar(60) | Sim | Categoriza o tipo de credenciamento (Oficina Credenciada Auto, Rede Hospitalar Saúde, Assistência 24h Residencial). |
| DS_EMAIL | varchar(120) | Sim | Canal de contato eletrônico para acionamento. |
| DS_ENDERECO | varchar(200) | Sim | Endereço de atendimento do prestador. |
| DS_TELEFONE | varchar(20) | Sim | Canal de contato telefônico para acionamento em emergência. |

Índices: PK ID_PRESTADOR; índice único em ID_CNPJ; índice em TP_ESPECIALIDADE (roteirização
do sinistro para o prestador correto).

### SINISTROS

SINISTROS = @ID_SINISTRO + ID_NUMERO_SINISTRO + DT_OCORRENCIA + DT_REGISTRO + ID_APOLICE +
ID_PRESTADOR + QT_VALOR_INDENIZACAO + TP_STATUS_SINISTRO

Leitura: ID_APOLICE liga o sinistro à apólice acionada, sem detalhar essa entidade associativa
novamente; ID_PRESTADOR é obrigatório e identifica o responsável pelo atendimento (oficina,
clínica ou assistência); não há campos opcionais porque todo sinistro registrado já nasce com
prestador designado e valor estimado.

| Atributo | Tipo físico | Obrigatório | Significado e relevância |
|---|---|---|---|
| ID_SINISTRO | integer | Sim (PK) | Identificador interno do sinistro. |
| ID_NUMERO_SINISTRO | varchar(30) | Sim (único) | Número oficial do sinistro, usado na comunicação com o cliente e o prestador. |
| DT_OCORRENCIA | date | Sim | Data em que o evento coberto ocorreu; base para cálculo de SLA. |
| DT_REGISTRO | date | Sim | Data em que o sinistro foi registrado no sistema. |
| ID_APOLICE | integer | Sim (FK) | Referência à apólice acionada (entidade associativa, não detalhada aqui). |
| ID_PRESTADOR | integer | Sim (FK) | Prestador ou oficina/clínica encarregada do atendimento. |
| QT_VALOR_INDENIZACAO | decimal(10,2) | Sim | Custo financeiro do sinistro ou reembolso pago. |
| TP_STATUS_SINISTRO | varchar(30) | Sim | Situação do sinistro (Aberto, Em Análise, Regulado, Pago, Encerrado). |

Índices: PK ID_SINISTRO; índice único em ID_NUMERO_SINISTRO; índice em ID_APOLICE (histórico
de sinistros da apólice); índice em DT_OCORRENCIA (relatórios de SLA por período).

## 2.5 Log de acesso (metadado operacional)

Todas as tabelas ficam sob o mesmo mecanismo de auditoria do SGBD: o plugin audit_log do
MySQL, configurado para gravar em formato JSON no caminho definido por audit_log_file
(variável de sistema, sob $HOME neste ambiente). Na ausência do plugin, a alternativa é o log
geral (general_log=ON, log_output=TABLE), consultável em mysql.general_log. Retenção e
rotação do log seguem política própria, independente da retenção dos dados de negócio.

## 2.6 Acesso por operação e conformidade com a LGPD (metadado administrativo)

| Tabela | LER | INSERIR | ATUALIZAR | APAGAR |
|---|---|---|---|---|
| CLIENTES_PF | Corretor, Financeiro, Auditoria | Corretor | Corretor, Financeiro | Nenhum papel — apenas anonimização ao fim da retenção |
| CLIENTES_PJ | Corretor, Financeiro, Auditoria | Corretor | Corretor, Financeiro | Nenhum papel — mesma regra de CLIENTES_PF |
| COLABORADORES | Administrativo/RH, Financeiro, Auditoria | Administrativo/RH | Administrativo/RH | Administrativo/RH (desligamento) |
| RAMOS_SEGURO / PRODUTOS_SEGURO | Corretor, Gerência, Auditoria | Gerência de Produtos | Gerência de Produtos | Nenhum papel — produto é descontinuado, não apagado |
| APOLICES_PROPOSTAS | Corretor, Financeiro, Gerência, Auditoria | Corretor | Corretor, Financeiro (mediante aprovação gerencial para desconto) | Nenhum papel — apólice não se apaga, apenas muda para TP_STATUS_APOLICE = Cancelada |
| PRESTADORES_SERVICO | Central de Sinistros, Auditoria | Administrativo | Administrativo | Administrativo (descredenciamento) |
| SINISTROS | Central de Sinistros, Financeiro, Auditoria | Central de Sinistros | Central de Sinistros | Nenhum papel |

CLIENTES_PF carrega dado sensível de saúde (LGPD art. 5º, II) quando o cliente contrata
Seguro Saúde, em razão da Declaração de Saúde e dos dados socioeconômicos exigidos na
subscrição de risco. O tratamento se ampara na execução do contrato de prestação do serviço;
o acesso é restrito aos papéis envolvidos na venda e no atendimento mais a auditoria, e toda
consulta fica registrada no log de acesso (§2.5), o que sustenta o princípio de
responsabilização (art. 6º, X). A retenção segue o prazo legal aplicável a contratos de
seguro; encerrado o prazo, os dados são anonimizados — nunca apagados fisicamente —
preservando estatística sem identificar o cliente. CLIENTES_PJ, COLABORADORES,
PRESTADORES_SERVICO, RAMOS_SEGURO, PRODUTOS_SEGURO, APOLICES_PROPOSTAS e SINISTROS são dados
cadastrais e contratuais comuns (não sensíveis), sujeitos às mesmas regras gerais de acesso e
log.
