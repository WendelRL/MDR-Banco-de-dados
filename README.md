Caso: Dicionário de Dados da MRD Saúde Corretora de Seguros Ltda.

1. Modelo conceitual
Este modelo representa uma corretora de seguros (MRD Saúde Corretora de Seguros Ltda.) em que cada cliente, pessoa física ou jurídica, contrata uma ou mais apólices/propostas por meio de um colaborador (corretor). Cada apólice reúne um ou mais produtos de seguro, vinculados aos ramos de seguro oferecidos, e pode, ao longo da vigência, originar um ou mais sinistros, atendidos por um prestador de serviço credenciado.

Entidade	Relaciona-se com	Cardinalidade
CLIENTES_PF / CLIENTES_PJ	APOLICES_PROPOSTAS	1:N — um cliente pode contratar várias apólices/propostas; uma apólice/proposta pertence a um único cliente
COLABORADORES	APOLICES_PROPOSTAS	1:N — um colaborador (corretor) pode atender várias apólices/propostas; uma apólice/proposta foi atendida por apenas um colaborador
APOLICES_PROPOSTAS	PRODUTOS_SEGURO	N:N, resolvido pelo grupo repetitivo ITEM_COBERTURA — uma apólice pode reunir vários produtos/coberturas; um produto pode estar presente em várias apólices
RAMOS_SEGURO	PRODUTOS_SEGURO	1:N — um ramo de seguro possui vários produtos; um produto pertence a um único ramo
APOLICES_PROPOSTAS	SINISTROS	1:N — uma polícia pode gerar vários sinistros ao longo da vigência; um sinistro está vinculado a uma única polícia
PRESTADORES_SERVICO	SINISTROS	1:N — um prestador credenciado pode atender vários sinistros; um sinistro é atendido por um único prestador
APOLICES_PROPOSTAS é uma entidade associativa entre CLIENTE, COLABORADOR e PRODUTO_SEGURO (um colaborador atende várias apólices, um cliente contrata várias apólices ao longo do tempo, e cada apólice pode reunir uma ou mais coberturas contratadas por meio do grupo repetitivo ITEM_COBERTURA).

Cliente que contrata um ou mais seguros junto à corretora. Colaborador é o funcionário da corretora responsável pela venda e pelo acompanhamento das propostas e apólices, incluindo corretores internos e parceiros freelance com registro na SUSEP. Ramo de Seguro é uma categoria geral de cobertura oferecida pela corretora (ex.: Saúde, Vida, Automóvel, Residencial). Produto de Seguro é o plano ou pacote específico de cobertura, vinculado a um único ramo de seguro. Apólice/Proposta é o contrato de seguro firmado entre o cliente e a corretora, podendo reunir uma ou mais coberturas contratadas. Prestador de Serviço é uma empresa da rede credenciada (oficina mecânica, hospital, clínica ou assistência 24h) que atende o cliente em caso de sinistro. Sinistro é o evento de acionamento de seguro (colisão, sinistro residencial, pedido de reembolso de saúde etc.) que gera análise e, quando procedente, indenização ao cliente.

2. Fluxo de dados (visão de DFD)
O Cliente procura a corretora ou é abordado por um Colaborador → cadastro ou atualização em CLIENTES, com validação de unicidade por CPF ou CNPJ → o Colaborador monta a proposta, selecionando um ou mais PRODUTOS_SEGURO vinculados aos RAMOS_SEGURO contratados → o sistema registra o contrato em APOLICES_PROPOSTAS, junto com os itens de cobertura escolhidos (ITEM_COBERTURA) → durante a vigilância da apólice, a ocorrência de um evento coberto gera um registro no SINISTROS, vinculando a apólice ao PRESTADOR_SERVICO responsável pelo atendimento (oficina, hospital ou assistência) → toda leitura ou escrita nessas tabelas é registrada pelo log de acesso do SGBD (§5), o que sustenta auditorias e conformidade com a LGPD (§6).

3. Convenções do dicionário
SGBD: MySQL 8, mecanismo de armazenamento InnoDB — cuida da persistência dos arquivos de dados, do log de transações (refazer/desfazer) e mantém o índice primário clusterizado por chave.

Codificação de caracteres: utf8mb4 com agrupamento utf8mb4_0900_ai_ci. Escolhida em vez de latin1 por cobrir acentuação do português sem perda em campos de nome, endereço e texto livre, e por ser compatível com qualquer caractere Unicode que aborde em observações de sinistro ou política de produto.

Notação formal (símbolos usados ​​neste dicionário):

Símbolo	Significado
=	é composto de
+	e (conecta elementos obrigatórios)
( )	‡
{ }, n{ }m	interação, com limite mínimo n e máximo m
[ | ]	escolha obrigatória entre alternativas
/ /	rótulo de um grupo repetitivo
@	identificador (chave primária)
* *	comentário, fora da estrutura formal
Prefixos: NM_ nome, DT_ data, ID_ identificador (não sofre operação matemática), CD_ código de domínio, QT_ quantidade/valor numérico, TP_ tipo (categorização), IN_ indicador booleano. Este caso também usa DS_ (descrição/texto livre) — não está entre os sete prefixos-padrão, mas segue o mesmo princípio e é aplicado aos campos de contato e endereço (e-mail, telefone, endereço), tratados como texto livre sem validação estrutural neste modelo.

Versão deste dicionário: v1.0, 15/setembro/2026. Qualquer alteração de estrutura deverá gerar nova revisão registrada nesta seção; a prática atende, ela própria, ao princípio de rastreabilidade exigido pela LGPD (art. 6º, X).

4. Dicionário de dados por entidade
COLABORADORES
COLABORADORES = @ID_COLABORADOR + NM_COLABORADOR + ID_CPF + DT_NASCIMENTO + DS_ENDERECO + DS_EMAIL + DS_TELEFONE + QT_COMISSAO_PERCENTUAL + (ID_SUSEP)

Leitura: @ID_COLABORADOR é o identificador único; os sete campos seguintes conectados por + são obrigatórios; (ID_SUSEP) vem entre ( ) porque o registro profissional na SUSEP é aplicável apenas a corretores parceiros ou internos habilitados, não a todo colaborador administrativo.

Atribuição	Tipo físico	Obrigatório	bloco e
ID_COLABORADOR	inteiro	Sim (PK)	Código de localização do registro; não sofre operação matemática.
NM_COLABORADOR	varchar(120)	Sim	Nome completo do colaborador; identifica o responsável pela venda no contrato e nos relatórios de comissão.
ID_CPF	caractere(11)	Sim (único)	Documento de identificação civil; usado para validação cadastral e emissão de recibo de comissão.
DT_NASCIMENTO	data	Sim	Dados de nascimento, usados ​​para cálculo de tempo de casa e elegibilidade a benefícios internos.
DS_ENDERECO	varchar(200)	Sim	Endereço residencial de contato administrativo.
DS_EMAIL	varchar(120)	Sim	Canal de contato eletrônico e de acesso ao sistema.
DS_TELEFONE	varchar(20)	Sim	Canal de contato telefônico.
QT_COMISSÃO_PERCENTUAL	decimal(5,2)	Sim	Percentual de comissão aplicada sobre o valor do contrato vendido; base do cálculo do extrato de comissão.
ID_SUSEP	varchar(20)	Não	Registro profissional na SUSEP, exigido por regulação do setor para corretores parceiros ou internos habilitados à venda.
Índices: PK ID_COLABORADOR (clusterizado); índice único em ID_CPF; índice secundário em NM_COLABORADOR (busca por nome nos relatórios de comissão).

CLIENTES (Segurados — Pessoa Física ou Pessoa jurídica)
CLIENTES = @ID_CLIENTE + NM_CLIENTE + ID_CPF + ID_RG + DT_NASCIMENTO + DS_ENDERECO + DS_EMAIL + DS_TELEFONE + QT_LIMITE_CREDITO + IN_CADASTRO_ATIVO

Leitura: ID_CLIENTES obrigatório e único garante a unicidade cadastral Ordinariamente na regra de negócio; os demais campos são obrigatórios e conectados por +; não há campos adicionais nesta entidade porque o cadastro completo é condição para emissão de apólice.

Atribuição	Tipo físico	Obrigatório	bloco e
ID_CLIENTE	inteiro	Sim (PK)	Identificador único do cliente, centralizado para a visão 360° de todas as apólices ativas (saúde, residencial, automóvel).
NM_CLIENTE	varchar(120)	Sim	Nome completo do seguro; identifica o cliente no contrato e no atendimento.
ID_CPF	caractere(11)	Sim (único)	Documento de identificação civil; validado em tempo real para evitar duplicidade cadastral.
ID_RG	varchar(20)	Sim	Registro Geral (identidade), complementar ao CPF na análise cadastral.
DT_NASCIMENTO	data	Sim	Essencial para cálculo de risco e prêmio em seguros de Vida, Auto ou Saúde.
DS_ENDERECO	varchar(200)	Sim	Endereço residencial completo, exigido sem onboarding.
DS_EMAIL	varchar(120)	Sim	Canal de contato eletrônico e de envio de apólice/boleto.
DS_TELEFONE	varchar(20)	Sim	Canal de contato telefônico, usado inclusive no atendimento de sinistro.
QT_LIMITE_CREDITO	decimal(10,2)	Sim	Limite financeiro para parcelamento próprio ou financiamento de prêmios de apólices.
EM_CADASTRÓ_ATIVO	booleano	Sim	Indicar se o cadastro está ativo ou bloqueado por inadimplência ou restrição cadastral (Serasa/SPC); cliente bloqueado não emite novas apólices.
Quando o produto é contratado pela Seguro Saúde, o cadastro é complementado por dados socioeconômicos/profissionais e pela Declaração de Saúde exigida na subscrição de risco, tratada como informação sensível (ver §6).

Índices: PK ID_CLIENTE (clusterizado); índice único em ID_CLIENTE (garante a unicidade cadastral e acelera a busca de "todas as apólices do cliente X").

RAMOS_SEGURO
RAMOS_SEGURO = @ID_RAMO + NM_RAMO

Leitura: entidade simples de domínio, sem campos adicionais; cada ramo (Saúde, Vida, Automóvel, Residencial) é cadastrado uma única vez e referenciado por vários produtos.

Atribuição	Tipo físico	Obrigatório	bloco e
ID_RAMO	inteiro	Sim (PK)	Identificador do ramo de seguro.
NM_RAMO	varchar(60)	Sim	Nome do ramo (ex.: Seguro Saúde, Seguro Automóvel, Seguro Residencial, Seguro de Vida).
Índices: PK ID_RAMO; índice único em NM_RAMO (evita duplicidade de ramo).

PRODUTOS_SEGURO (Planos, Coberturas e Pacotes)
PRODUTOS_SEGURO = @ID_PRODUTO + CD_PLANO + DS_DESCRICAO + QT_PREMIO_BASE + ID_RAMO

Leitura: CD_PLANOS utiliza o prefixo de código de domínio por equivalente ao SKU do produto (código único de identificação do plano/cobertura); ID_RAMO é obrigatório e garantido o 1:N com RAMOS_SEGURO.

Atribuição	Tipo físico	Obrigatório	bloco e
ID_PRODUTO	inteiro	Sim (PK)	Identificador do produto de seguro.
CD_PLANOS	varchar(30)	Sim (único)	Código único do plano/cobertura, equivalente ao SKU.
DS_DESCRIÇÃO	texto	Sim	Detalhes do plano, limites máximos de indenização e franquias.
QT_PREMIO_BASE	decimal(10,2)	Sim	Preço base do seguro/prêmio cobrado antes de descontos comerciais.
ID_RAMO	inteiro	Sim (FK)	Referência ao ramo de seguro ao qual o produto pertence.
Índices: PK ID_PRODUTO; índice único em CD_PLANOS; índice em ID_RAMO (listar produtos por ramo).

APOLICES_PROPOSTAS
APOLICES_PROPOSTAS = @ID_APOLICE + ID_NUMERO_APOLICE + DT_EMISSAO + DT_INICIO_VIGENCIA + DT_FIM_VIGENCIA + QT_PREMIO_TOTAL + QT_DESCONTO_APLICADO + IN_APROVACAO_GERENCIAL + [TP_BOLETO | TP_CARTAO_CORPORATIVO | TP_DEBITO_CONTA] + TP_STATUS_APOLICE + ID_CLIENTE + ID_COLABORADOR + 1{/ITEM_COBERTURA/ = ID_PRODUTO + QT_VALOR_COBERTURA}10

Leitura: ID_NUMERO_APOLICE usa o prefixo de identificador por ser um número oficial de registro externo da apólice, não um código interno de domínio; [TP_BOLETO | TP_CARTAO_CORPORATIVO | TP_DEBITO_CONTA] exige escolher exatamente uma forma de pagamento; 1{ /ITEM_COBERTURA/ }10 é uma iteração que permite de uma a dez coberturas/produtos por polícia, cada uma com seu próprio grupo de campos rotulados por / /; ID_CLIENTE e ID_COLABORADOR ligam a apólice ao cliente e ao colaborador responsável, sem detalhar essas entidades associativas novamente aqui.

Atribuição	Tipo físico	Obrigatório	bloco e
ID_APOLÍCIA	inteiro	Sim (PK)	Identificador interno da polícia/proposta.
ID_NUMERO_APOLÍCIA	varchar(30)	Sim (único)	Número oficial da polícia registrada; usado em comunicações externas e na SUSEP.
DT_EMISSÃO	data	Sim	Data de emissão da.
DT_INICIO_VIGENCIA	data	Sim	Início da cobertura contratada.
DT_FIM_VIGENCIA	data	Sim	Fim da cobertura contratada; base do cálculo de renovação.
QT_PREMIO_TOTAL	decimal(10,2)	Sim	Valor total do seguro contratado.
QT_DESCONTO_APLICADO	decimal(10,2)	Sim	Valor de desconto comercial aplicado sobre o prêmio total.
IN_APROVACAO_GERENCIAL	booleano	Sim	Indica S/N se descontos comerciais ou subscrições de risco acima da alçada padrão foram aprovados pela gerência.
TP_BOLETO | TP_CARTAO_CORPORATIVO | TP_DEBITO_CONTA	varchar(20)	Sim (escolha)	Forma de pagamento contratada (Boleto, Cartão Corporativo ou Débito em Conta).
TP_STATUS_APOLÍCIA	varchar(30)	Sim	Situação da apólice (Em Análise de Risco/Underwriting, Vigente, Cancelada, Inadimplente).
ID_CLIENTE	inteiro	Sim (FK)	Referência ao cliente titular (CLIENTES_PF ou CLIENTES_PJ), entidade associativa não detalhada novamente aqui.
ID_COLABORADOR	inteiro	Sim (FK)	Referência ao corretor/colaborador responsável pela venda.
ID_PRODUTO (por item)	inteiro	Sim	Produto/cobertura contratado dentro da polícia.
QT_VALOR_COBERTURA (por item)	decimal(10,2)	Sim	Valor de prêmio correspondente ao item de cobertura dentro da polícia.
Índices: PK ID_APOLICE; índice único em ID_NUMERO_APOLICE; índice em ID_CLIENTE (listar apólices do cliente); índice em ID_COLABORADOR (relatório de comissão); índice em DT_FIM_VIGENCIA (fila de renovação).

PRESTADORES
PRESTADORES = @ID_PRESTADOR + NM_RAZAO_SOCIAL + ID_CNPJ + ID_IE + TP_ESPECIALIDADE + DS_EMAIL + DS_ENDERECO + DS_TELEFONE

Leitura: entidade cadastral da rede credenciada (oficinas, hospitais/clínicas e assistências 24h); todos os campos são obrigatórios e conectados por +, sem qualquer complemento, pois o credenciamento exige cadastro completo antes do vínculo com um sinistro.

Atribuição	Tipo físico	Obrigatório	bloco e
ID_PRESTADOR	inteiro	Sim (PK)	Identificador do prestador credenciado.
NM_RAZAO_SOCIAL	varchar(150)	Sim	Razão social do prestador (oficina, hospital, clínica ou assistência).
ID_CNPJ	char(14)	Sim (único)	Documento de identificação da pessoa jurídica prestada.
TP_ESPECIALIDADE	varchar(60)	Sim	Categoriza o tipo de credenciamento (Oficina Credenciada Auto, Rede Hospitalar Saúde, Assistência 24h Residencial).
DS_EMAIL	varchar(120)	Sim	Canal de contato eletrônico para acionamento.
DS_ENDERECO	varchar(200)	Sim	Endereço de atendimento do prestador.
DS_TELEFONE	varchar(20)	Sim	Canal de contato telefônico para acionamento em emergência.
Índices: PK ID_PRESTADOR; índice único em ID_CNPJ; índice em TP_ESPECIALIDADE (roteirização do sinistro para o prestador correto).

SINISTROS
SINISTROS = @ID_SINISTRO + ID_NUMERO_SINISTRO + DT_OCORRENCIA + DT_REGISTRO + ID_APOLICE + ID_PRESTADOR + QT_VALOR_INDENIZACAO + TP_STATUS_SINISTRO

Leitura: ID_APOLICE liga o sinistro à polícia acionada, sem detalhar essa entidade associativa novamente; ID_PRESTADOR é obrigatório e identifica o responsável pelo atendimento (oficina, clínica ou assistência); não há campos indicados porque todo sinistro registrado já nasceu com prestador designado e valor estimado.

Atribuição	Tipo físico	Obrigatório	bloco e
ID_SINISTRO	inteiro	Sim (PK)	Identificador interno do sinistro.
ID_NUMERO_SINISTRO	varchar(30)	Sim (único)	Número oficial do sinistro, usado na comunicação com o cliente e o prestador.
DT_OCORRENCIA	data	Sim	Dados em que o evento coberto ocorreu; base para cálculo de SLA.
DT_REGISTRO	data	Sim	Dados em que o sinistro foi registrado no sistema.
ID_APOLÍCE	inteiro	Sim (FK)	Referência à polícia acionada (entidade associativa, não especificada aqui).
ID_PRESTADOR	inteiro	Sim (FK)	Prestador ou oficina/clínica cobrada do atendimento.
QT_VALOR_INDENIZAÇÃO	decimal(10,2)	Sim	Custo financeiro do sinistro ou reembolso pago.
TP_STATUS_SINISTRO	varchar(30)	Sim	Situação do sinistro (Aberto, Em Análise, Regulado, Pago, Encerrado).
Índices: PK ID_SINISTRO; índice único em ID_NUMERO_SINISTRO; índice em ID_APOLICE (histórico de sinistros da polícia); índice em DT_OCORRENCIA (relatórios de SLA por período).

5. Log de acesso (metadado operacional)
Todas as tabelas ficam sob o mesmo mecanismo de auditoria do SGBD: o plugin audit_log do MySQL, configurado para gravar em formato JSON no caminho definido por audit_log_file (variável de sistema, sob $HOME neste ambiente). Na ausência do plugin, a alternativa é o log geral (general_log=ON, log_output=TABLE), consultável em mysql.general_log. Retenção e rotação do log Segue política própria, independente da retenção dos dados de negócio.

6. Acesso por operação e conformidade com a LGPD (metado administrativo)
Tabela	LER	INSERIR	ATUALIZAR	APAGAR
CLIENTES	Corretor, Financeiro, Auditoria	Corretor	Corretor, Financeiro	Nenhum papel — apenas anonimização ao fim da retenção
COLABORADORES	Administrativo, Financeiro, 
RAMOS_SEGURO / PRODUTOS_SEGURO	Corretor, Auditoria,	Gerência de Produtos	Nenhum produto de papel — está descontinuado, não desligado
APOLICES_PROPOSTAS	Corretor, Financeiro, Gerência, Auditoria	Corretor, Financeiro (mediante aprovação gerencial para desconto)	Nenhum papel — apólice não se apaga, apenas muda para TP_STATUS_APOLICE = Cancelada
SINISTROS	Central de Sinistros, Financeiro, Auditoria	Central de Sinistros	Central de Sinistros	Nenhum papel
CLIENTES_PF carrega dado sensível de saúde (LGPD art. 5º, II) quando o cliente contrata Seguro Saúde, na razão da Declaração de Saúde e dos dados socioeconômicos exigidos na subscrição de risco. O tratamento é amparado na celebração do contrato de prestação de serviço; o acesso é restrito aos papéis envolvidos na venda e no atendimento mais a auditorias, e toda consulta fica registrada no log de acesso (§5), o que sustenta o princípio de responsabilização (art. 6º, X). A retenção segue o prazo legal aplicável aos contratos de seguro; encerrado o prazo, os dados são anonimizados — nunca apagados fisicamente — preservando estatística sem identificar o cliente. CLIENTES_PJ, COLABORADORES, PRESTADORES_SERVICO, RAMOS_SEGURO, PRODUTOS_SEGURO, APOLICES_PROPOSTAS e SINISTROS são dados cadastrais e contratuais comuns (não sensíveis), sujeitos às mesmas regras gerais de acesso e log.
