# ESTRUTURA MER (MODELO ENTIDADE RELACIONAMENTO)
## M.R.D - SAÚDE E CORRETORA DE SEGUROS

---

## 1. Dados da Empresa

* **Proprietário:** Marcio Roberto Diniz
* **Razão Social:** M.R.D - Saúde e corretora de Seguros Ltda.
* **CNPJ:** 33.518.915/0001-42
* **Endereço:** Av. Celso Garcia, 3798 — CEP: 03.064-000 — Bairro: Tatuapé — UF: SP
* **E-mail:** mrdcorretora@gmail.com
* **Telefone:** (11) 2227-9120
* **Data de Inscrição do CNPJ:** 03/05/2019
* **Código e Descrição da Atividade Econômica Principal:**
  * `66.22-3-00` - Corretores e agentes de seguros de planos de previdência complementar.

### Conheça a M.R.D - Saúde e Corretora de Seguros Ltda.
Empresa privada atuando há 20 anos no mercado com 24 funcionários focados nas vendas de seguro de saúde, seguro de vida, seguro de carro e residencial, sendo 20 corretores internos. Há também a equipe administrativa com 2 funcionários e 2 financeiros.

A empresa oferece 3 serviços prestados, sendo eles:
1. Seguro Residencial
2. Seguro Automotivo
3. Seguro de Vida

**Métricas Operacionais:**
* **Contratos diários:** Aprox. 50 a 80 contratos/dia
* **Contratos mensais:** Estimativa de 1.000 a 1.200 contratos/mês
* **Clientes ativos:** Em torno de 25.000 a 30.000 clientes ativos

---

## 2. Regras de Negócio Gerais e Clientes

### 2.1 Cadastro e Onboarding de Cliente (Pessoa Física e Jurídica)
O sistema de gestão da seguradora deve assegurar a integridade dos dados cadastrais desde a entrada do lead ou proposta até a emissão da apólice, diferencando o fluxo conforme o tipo de cliente:

* **Cadastro de Pessoa Física (PF):** Obrigatório o preenchimento de CPF válido, nome completo, data de nascimento, endereço residencial completo, e-mail, telefone de contato e dados socioeconômicos ou profissionais (quando exigido pelo perfil de risco do produto, especialmente para Seguro Vida).
* **Cadastro de Pessoa Jurídica (PJ):** O sistema deve permitir o cadastro apenas mediante CNPJ ativo e regular junto à Receita Federal. Os dados obrigatórios incluem razão social, nome fantasia, CNAE, endereço comercial, contatos do responsável legal/financeiro e informações contábeis básicas para análise de risco empresarial (ex: faturamento presumido para seguros corporativos).
* **Unicidade Cadastral:** O sistema deve realizar validação em tempo real para evitar duplicidade de CPFs ou CNPJs, vinculando todas as apólices ativas de vida, residencial e automotiva a um único ID de cliente centralizado.

### 2.2 Análise de Risco, Crédito e Bloqueio de Apólices
A concessão, renovação ou emissão de coberturas para os ramos Residencial, Automotivo e Seguro Vida está condicionada a rigorosas regras de subscrição de risco e adimplência financeira.

* **Análise de Crédito e Inadimplência:** Todo cliente (PF ou PJ) possui um perfil de crédito e histórico financeiro atrelado. Caso haja parcelas de prêmio em atraso superior ao limite de tolerância (ex: 10 dias úteis) ou restrições ativas em órgãos de proteção ao crédito (Serasa/SPC), o sistema deve sinalizar automaticamente o cadastro.
* **Bloqueio de Novas Vendas e Renovações:** Clientes com pendências financeiras ativas ou restrições cadastrais severas ficam impedidos de emitir novas apólices, realizar upgrades em planos de saúde ou adicionar novos bens (veículos/imóveis) às apólices existentes até a regularização do débito.
* **Subscrição de Risco Automatizada:**
  * **Auto:** Verificação automática de CEP de pernoite, histórico de sinistralidade da CNH e restrições do veículo na base de dados de gravames/roubo.
  * **Residencial:** Validação do tipo de construção, localização de risco (áreas de alagamento ou restrição de segurança) e valor segurado da edificação.
  * **Vida:** Aplicação de questionário de saúde (Declaração de Saúde) obrigatório, direcionando casos com comorbidades graves para análise manual da junta médica interna antes da aceitação.

### 2.3 Diretrizes de Atendimento e Gestão de Sinistros
O atendimento ao segurado deve seguir padrões de qualidade, agilidade e clareza, dividindo-se entre canais digitais e centrais de suporte especializado.

* **Roteirização de Atendimento:** O atendimento deve integrar os canais de voz (ligação), presencial e por chat (WhatsApp). O sistema deve direcionar o segurado com base no produto:
  * *Seguro Auto e Residencial:* Foco em emergências, assistência 24h e abertura rápida de sinistro (colisão, guincho, encanador, eletricista, etc).
  * *Seguro de Vida:* Serviço de proteção financeira ao segurado e sua família, em situações como falecimento, invalidez ou doenças graves, conforme as coberturas contratadas.
* **SLA (Service Level Agreement / Contrato de Nível de Serviço) de Resposta:**
  * *Abertura de sinistro de emergência (Auto/Residencial):* Atendimento imediato em até 5 minutos na fila prioritária de assistência 24h.
  * *Autorização de procedimentos de IML:* Até 24 horas úteis.
  * *Análise de indenização de sinistros materiais:* Conclusão da análise documental e parecer em até 15 dias corridos (conforme regulamentação do setor).
* **Tratativa de Cancelamentos e Reclamações:** Todo pedido de cancelamento de apólice deve passar por uma régua de retenção automatizada, calculando prêmios a devolver e registrando o motivo principal, para melhoria contínua dos produtos.

---

## 3. Modelo de Dados (Entidades e Atributos)

### COLABORADORES / FUNCIONARIOS (Equipe Comercial e Interna)
* `id_colaborador` *(PK)*
* `nome`
* `cpf`
* `data_nascimento`
* `endereco`
* `email`
* `telefone`
* `comissao` *(Percentual de comissão sobre o valor do contrato)*
* `susep_registro` *(Registro profissional na SUSEP, aplicável para corretores internos)*

### CLIENTES (Segurados - Pessoa Jurídica e Pessoa Física)
* `id_cliente` *(PK)*
* `nome_completo_ou_razao_social`
* `cnpj_ou_cpf`
* `endereco`
* `email`
* `telefone`
* `limite_credito` *(Limite financeiro para emissão e faturamento de apólices corporativas, como Saúde PME ou Frotas)*
* `cadastro_ativo` *(Status: Ativo / Bloqueado por inadimplência ou restrição Serasa)*

### RAMOS_SEGURO (Categorias)
* `id_ramo` *(PK)*
* `nome_ramo` *(Ex: Seguro Vida, Seguro Automóvel, Seguro Residencial)*

### PRODUTOS_SEGURO (Planos, Coberturas e Pacotes)
* `id_produto` *(PK)*
* `codigo_plano` *(Código único de identificação do plano/cobertura, equivalente ao SKU)*
* `descricao` *(Detalhes do plano, limites máximos de indenização e franquias)*
* `premio_base` *(Preço base do seguro/prêmio cobrado, substituindo o preço de venda)*
* `id_ramo` *(FK -> RAMOS_SEGURO)*

### APOLICES / PROPOSTAS
* `id_apolice` *(PK)*
* `numero_apolice` *(Número oficial da apólice registrada)*
* `data_emissao`
* `inicio_vigencia`
* `fim_vigencia`
* `valor_premio_total` *(Valor total do seguro contratado)*
* `desconto_aplicado`
* `aprovacao_gerencial` *(Para descontos comerciais ou subscrições de risco acima da alçada padrão)*
* `forma_pagamento` *(Ex: Boleto, Pix, Cartão de Crédito, Débito Automático)*
* `status_apolice` *(Ex: Em Análise, Ativa, Cancelada, Devolvida, Apólice Emitida)*
* `id_cliente` *(FK -> CLIENTES)*
* `id_colaborador` *(FK -> COLABORADORES)*

### SINISTROS
Acionamentos de seguro, colisões, reparos residenciais ou pedidos de reembolso.
* `id_sinistro` *(PK)*
* `numero_sinistro`
* `data_ocorrencia`
* `data_registro`
* `id_apolice` *(FK -> APOLICES)*
* `id_prestador` *(FK -> Prestador ou oficina encarregada do atendimento)*
* `valor_indenizacao` *(Custo financeiro do sinistro ou reembolso pago)*
* `status_sinistro` *(Ex: Aberto, Em Análise, Regulado, Pago, Encerrado)*

---

## 4. Relacionamentos e Cardinalidades

* **CLIENTE faz PROPOSTA**
  * Um Cliente pode fazer várias Propostas (`1:N`).
  * Uma Proposta pertence a apenas um Cliente (`1:1`).

* **CORRETOR atende PROPOSTA**
  * Um Corretor pode gerenciar várias Propostas (`1:N`).
  * Uma Proposta é atendida por apenas um Corretor (`1:1`).

* **PRODUTO_SEGURO está em PROPOSTA**
  * Um Produto de Seguro pode estar em várias Propostas (`1:N`).
  * Uma Proposta refere-se a apenas um Produto de Seguro (`1:1`).

* **RAMO_SEGURO possui PRODUTOS_SEGURO**
  * Um Ramo de Seguro possui vários Produtos (`1:N`).
  * Um Produto de Seguro pertence a um Ramo (`1:1`).