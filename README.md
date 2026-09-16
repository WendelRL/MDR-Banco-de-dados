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

# 1.2 Regras de negócio gerais e clientes
Cadastro e Onboarding de Cliente (Pessoa Física e Jurídica)
O sistema de gestão da seguradora deve assegurar a integridade dos dados cadastrais desde a
entrada do lead ou proposta até a emissão da apólice, diferenciando o fluxo conforme o tipo
de cliente.
* Cadastro cliente geral : obrigatório o preenchimento de CPF válido, nome
completo, data de nascimento, endereço residencial completo, e-mail, telefone de contato e
dados socioeconômicos ou profissionais (quando exigido pelo perfil de risco do produto,
especialmente para Seguro Saúde). O sistema deve permitir o cadastro apenas mediante
CNPJ ativo e regular junto à Receita Federal. Os dados obrigatórios incluem razão social,
nome fantasia, CNAE, endereço fiscal e comercial, contatos do responsável legal/financeiro e
informações contábeis básicas para análise de risco empresarial (ex.: faturamento presumido
para seguros corporativos/saúde PME).
* Unicidade Cadastral: o sistema deve realizar validação em tempo real para evitar
duplicidade de CPFs ou CNPJs, vinculando todas as apólices ativas de saúde, residencial e
automóvel a um único ID de cliente centralizado (visão 360°).

# Análise de Risco, Crédito e Bloqueio de Apólices
A concessão, renovação ou emissão de coberturas para os ramos de Saúde, Residencial e
Automóvel está condicionada a rigorosas regras de subscrição de risco e adimplência
financeira.
* Análise de Crédito e Inadimplência: todo cliente (PF ou PJ) possui um perfil de crédito
e histórico financeiro atrelado. Caso haja parcelas de prêmio em atraso superior ao limite
de tolerância (ex.: 10 dias úteis) ou restrições ativas em órgãos de proteção ao crédito
(Serasa/SPC), o sistema deve sinalizar automaticamente o cadastro.
* Bloqueio de Novas Vendas e Renovações: clientes com pendências financeiras ativas ou
restrições cadastrais severas ficam impedidos de emitir novas apólices, realizar upgrades em
planos de saúde ou adicionar novos bens (veículos/imóveis) às apólices existentes até a
regularização do débito.
# Subscrição de Risco Automatizada:
* Auto: verificação automática de CEP de pernoite, histórico de sinistralidade da CNH e
restrições do veículo na base de dados de gravames/roubo.
* Residencial: validação do tipo de construção, localização de risco (áreas de alagamento
ou restrição de segurança) e valor segurado da edificação.
* Saúde: aplicação de questionário de saúde (Declaração de Saúde) obrigatório,
direcionando casos com comorbidades graves para análise manual da junta médica interna
antes da aceitação.

# Diretrizes de Atendimento e Gestão de Sinistros
O atendimento ao segurado deve seguir padrões de qualidade, agilidade e clareza, dividindo-se

# entre canais digitais e centrais de suporte especializado.
* Abertura de sinistro de emergência (Auto/Residencial): atendimento imediato em até 5
minutos na fila prioritária de assistência 24h.
* Autorização de procedimentos de saúde simples/ambulatoriais: até 24 horas úteis.
* Análise de indenização de sinistros materiais: conclusão da análise documental e parecer
em até 15 dias corridos (conforme regulamentação do setor).
* Tratativa de Cancelamentos e Reclamações: todo pedido de cancelamento de apólice deve
passar por uma régua de retenção automatizada, calculando prêmios a devolver (pro rata die)
e registrando o motivo principal para melhoria contínua dos produtos.

# 1.3 Entidades e atributos
# COLABORADORES (Equipe Comercial e Interna)
* id_colaborador (PK)
* nome
* cpf
* data_nascimento
* endereco
* email
* telefone
* comissao (percentual de comissão sobre o valor do contrato)
* susep_registro (registro profissional na SUSEP, aplicável para corretores parceiros ou
internos)
# CLIENTES_PJ (Segurados — Pessoa Jurídica)
* id_cliente (PK)
* razao_social
* cnpj (obrigatório e único)
* ie (Inscrição Estadual)
* endereco
* email
* telefone
* limite_credito (limite financeiro para emissão e faturamento de apólices corporativas, como
Saúde PME ou Frotas)
* cadastro_ativo (status: Ativo / Bloqueado por inadimplência ou restrição Serasa)

# CLIENTES_PF (Segurados — Pessoa Física)
* id_cliente (PK)
nome_completo
* cpf (obrigatório e único)
* rg (Registro Geral / Identidade)
* data_nascimento (essencial para cálculo de risco e prêmio em seguros de Vida, Auto ou
Saúde)
* endereco
* email
* telefone
* limite_credito (limite financeiro para parcelamento próprio ou financiamento de prêmios de
apólices)
* cadastro_ativo (status: Ativo / Bloqueado por inadimplência ou restrição cadastral)

# RAMOS_SEGURO (Categorias)
* id_ramo (PK)
* nome_ramo (ex.: Seguro Saúde, Seguro Automóvel, Seguro Residencial)

# PRODUTOS_SEGURO (Planos, Coberturas e Pacotes)
* id_produto (PK)
* codigo_plano (código único de identificação do plano/cobertura, equivalente ao SKU)
* descricao (detalhes do plano, limites máximos de indenização e franquias)
* premio_base (preço base do seguro/prêmio cobrado)
* id_ramo (FK) → relacionado à tabela de Ramos de Seguro

# APOLICES / PROPOSTAS
* id_apolice (PK)
* numero_apolice (número oficial da apólice registrada)
* data_emissao
* inicio_vigencia
* fim_vigencia
* valor_premio_total (valor total do seguro contratado)
* desconto_aplicado
* aprovacao_gerencial (S/N para descontos comerciais ou subscrições de risco acima da alçada
padrão)
* forma_pagamento (ex.: Boleto PJ, Cartão Corporativo, Débito em Conta)
* status_apolice (ex.: Em Análise de Risco/Underwriting, Vigente, Cancelada, Inadimplente)
* id_cliente (FK)
* id_colaborador (FK) (corretor ou vendedor interno responsável pela venda)

# PRESTADORES_SERVICO
No setor de seguros, os parceiros estratégicos são a rede credenciada de atendimento (oficinas
mecânicas para automóveis, prestadores de assistência residencial e hospitais/clínicas para
saúde).

* id_prestador (PK)
* razao_social
* cnpj
* ie
* especialidade (ex.: Oficina Credenciada Auto, Rede Hospitalar Saúde, Assistência 24h
* Residencial)
* email
* endereco
* telefone

# SINISTROS
Em vez de registrar compras de mercadorias para estoque, uma seguradora registra eventos de
sinistros (acionamentos de seguro, colisões, reparos residenciais ou pedidos de reembolso de
saúde).

* id_sinistro (PK)
* numero_sinistro
* data_ocorrencia
* data_registro
* id_apolice (FK)
* id_prestador (FK) (prestador ou oficina/clínica encarregada do atendimento)
* valor_indenizacao (custo financeiro do sinistro ou reembolso pago)
* status_sinistro (ex.: Aberto, Em Análise, Regulado, Pago, Encerrado)

# 1.4 Relacionamentos e cardinalidades CLIENTE faz PROPOSTA
Um Cliente pode fazer várias Propostas (1:N). Uma Proposta pertence a apenas um Cliente
(1:1).
# CORRETOR atende PROPOSTA
Um Corretor/Colaborador pode gerenciar várias Propostas (1:N). Uma Proposta é atendida por
apenas um Corretor (1:1).

# PRODUTO_SEGURO está em PROPOSTA
Um Produto de Seguro pode estar em vários Itens de Propostas (1:N). Um Item de Proposta
refere-se a apenas um Produto de Seguro (1:1).

# RAMO_SEGURO possui PRODUTOS_SEGURO
Um Ramo de Seguro possui vários Produtos (1:N). Um Produto de Seguro pertence a um Ramo
(1:1).

# SEGURADORA gera EXTRATO_COMISSAO
Uma Seguradora envia vários Extratos de Comissões (1:N). O repasse gera a movimentação
financeira da comissão do Produto (1:N).

## PARTE 2 — DICIONÁRIO DE DADOS

# 2.1 Modelo conceitual
Este modelo representa uma corretora de seguros (M.R.D Saúde Corretora de Seguros Ltda.) na
qual cada cliente, pessoa física ou jurídica, contrata uma ou mais apólices/propostas por
intermédio de um colaborador (corretor). Cada apólice reúne um ou mais produtos de seguro,
vinculados aos ramos de seguro oferecidos, e pode, ao longo da vigência, originar um ou mais
sinistros, atendidos por um prestador de serviço credenciado.























