## Relatório Técnico Final

### Integrantes

| Nome completo do aluno | RGM | Usuário do GitHub |
| :---- | :---- | :---- |
| César Augusto Mechi Zanin | 47305177 | CesarZanin-TI |
| Luiz Felipe da Silva Almeida | 04907315 | Luiz55555 |
| Isabely Toledo dos Santos | 46852760 | isabelytoledodossantos-prog |
| Vinicius dos Santos Maia | 47416301 | VINICIUS-MAIA2003 |
| Wendel Andrioli de Melo | 47411724 | WendelRL |
| Luana Silva Rocha dos Santos | 48828297 | Luana-Rocha |
| Júlio César Pereira da Silva | 48359904 | Juliotdpenna |

 

### 1.1 Revisão do Modelo Conceitual

**Caracterização da organização** 

- **Nome e natureza da organização:** A organização escolhida foi a M.R.D \- Saúde e corretora de Seguros Ltda.  
- **Contexto e porte:** Empresa privada com fins lucrativos; tamanho da operação; atuando há 20 anos no mercado com 24 funcionários focados nas vendas de seguro de saúde, seguro de vida, seguro de carro e residencial, sendo 20 corretores internos. Há também a equipe administrativa com 2 funcionários e 2 financeiros. Com a métrica operacional de: Aproximadamente 50 a 80 contratos/dia, estimativa de 1.000 a 1.200 contratos/mês e em torno de 25.000 a 30.000 clientes ativos.  
- **Problemas e necessidades identificados:** 
P1 - O banco de dados não estava ajustado e claro sobre a distribuição de tarefas na organização, fazendo com que algumas tarefas fossem encaminhadas a funcionários que não teriam que executar aquele tipo de serviço encaminhado.
P2 - Não havia também uma organização de tarefas, onde funcionários que não estavam aptos a atender aquele tipo de serviço, ocorrendo assim desencontro de informações e respostas erradas tanto ao cliente quanto a outros funcionários e setores
P3 - O cadastro de clientes não havia uma base a ser seguida, sendo feito fora de ordem e, na maioria das vezes, informações vinham faltando e/ou não eram imputadas na hora de passar para o sistema.
P4 - As propostas de apólices geravam sinistros que não haviam direcionamento na organização, as vezes caindo para o gestor, as vezes caindo para colaboradores que não estavam na área de controle de sinistros, ocasionando percas de rota na hora da distribuição.
P5 - O catalogo de produtos estava bagunçado, muitos com algumas informações que não lhes eram corretas, fazendo com que na hora de realizar uma venda de seguro fosse passado ao cliente algumas informações na qual o plano não cobria ou não pertencia ao grupo específico do seguro.
- **Escopo do sistema:** o banco de dados reune todos os dados da organização.  
- **Justificativa da escolha**: Escolhemos essa organização pelo devido fato de ser uma seguradora, onde apresenta casos de escolha no seguro de um cliente, sabendo que ela tem um banco de dados confuso, resolvemos escolher ela pelo fato de ver a oportunidade de ajustar estes problemas e também por ser algo que está ativamente no mercado. Um dos nossos integrantes do grupo, o Vinicius, trabalha na empresa, onde foi comprovado pela foto na pasta levantamento da entrevista.
- **Evidências da organização:**  
  **CNPJ:** 33.518.915/0001-42  
  **Endereço:** Av. Celso Garcia, 3798 \- CEP:03.064-000 \- Tatuapé, São Paulo  
  **Formas de Contato:** [mrdcorretora@gmail.com](mailto:mrdcorretora@gmail.com) \- (11) 2227-9120   
  [Pasta com fotos de comprovação da instituição](IMG/IMG).  
- **Responsável pela organização:** Marcio Roberto Diniz \- (11) 99847-5070 - diniz@mrdcorretora.com.

**Relato da entrevista**

**Resumo do Levantamento:** Quem: Márcio Roberto Diniz, sócio da empresa e responsável pela área financeira. A entrevista foi realizada por Vinicius, integrante do grupo de forma presencial no dia 11/09 (sexta-feira), na sala e mesa de trabalho do sócio, dentro da empresa.  
O que foi levantado: As vendas são registradas após o corretor enviar a documentação completa ao setor administrativo, que cadastra as propostas e apólices. O controle é feito por uma planilha Excel chamada “TAREFAS ADM”, organizando vendas por corretor, produto, data e cliente. Após a emissão da apólice, as informações são lançadas no sistema SIAV, utilizado para consultar clientes, registrar vendas e controlar comissões.  
Também foram abordados o repasse de comissões entre seguradora, empresa e colaboradores, a emissão de notas fiscais, os impostos e o IOF. As comissões são pagas nos dias 15 e 30 de cada mês, enquanto os salários são pagos todo dia 05\.  
Regras principais: Os colaboradores devem ser fiéis aos clientes, respeitar as datas de pagamento das comissões e nunca antecipar repasses. Nenhum cliente deve ficar sem atendimento, mesmo quando seu corretor responsável estiver ausente, desde que o atendimento seja posteriormente comunicado a ele. O setor administrativo deve manter o sigilo dos dados dos clientes.  
Volume de vendas: Segundo o entrevistado, as vendas variam conforme o período, apresentando uma tendência de queda no final do ano, quando clientes e empresas priorizam outros gastos.

**Levantamento da Entrevista:** [Levantamento](levantamento/levantamento.md)


**Processos de negócio** 

- **Processos típicos de uma corretora de seguros:** RN01 \- Prospecção de clientes \- Buscar novos clientes interessados em contratar seguros.  
- RN02 \- Atendimento ao cliente \- Receber clientes, esclarecer dúvidas e identificar suas necessidades.  
- RN03 \- Cadastro de clientes \- Registrar dados pessoais, contatos e informações necessárias para a contratação.  
- RN04 \- Análise de necessidades \- Identificar quais tipos de seguros e coberturas são adequados ao cliente.  
- RN05 \- Cotação de seguros \- Consultar diferentes seguradoras para comparar preços e coberturas.  
- RN06 \- Apresentação de propostas \- Apresentar ao cliente as opções disponíveis e seus respectivos valores.  
- RN07 \- Negociação e contratação \- Negociar condições e encaminhar a proposta escolhida para contratação.  
- RN08 \- Emissão de apólices	\- Acompanhar a emissão dos documentos que formalizam o seguro.  
- RN09 \- Gestão de pagamentos \- Acompanhar parcelas, vencimentos e eventuais pendências financeiras relacionadas ao seguro.  
- RN10 \- Renovação de seguros \- Entrar em contato com clientes antes do vencimento das apólices para oferecer a renovação.  
- RN11 \- Endosso de apólices \- Solicitar alterações nos dados ou nas condições de uma apólice já contratada.  
- RN12 \- Atendimento de sinistros \- Orientar o cliente quando ocorre um acidente, roubo ou outro evento coberto pelo seguro.  
- RN13 \- Pós-venda \- Manter relacionamento com o cliente e acompanhar sua satisfação.  
- RN14 \- Gestão administrativa \- Organizar documentos, contratos, comissões, relatórios e atividades internas.  
- **Processos que existem na organização** PR01 - Envio de documentação - O corretor envia ao setor administrativo a documentação completa do cliente (corretor, cliente, documentos, data de envio).
PR02 - Cadastro de proposta/apólice - Após receber os documentos, o administrativo cadastra a proposta ou apólice (cliente, produto, corretor, data).
PR03 - Controle de produção - O administrativo registra a venda na planilha "TAREFAS ADM" por corretor, tipo de produto, data e cliente, e acompanha a produção diária, semanal e mensal.
PR04 - Emissão da apólice e lançamento no SIAV - Com a apólice emitida, a venda é lançada no sistema SIAV, que também serve para consultar clientes e produção (apólice, data de emissão, status).
PR05 - Lançamento e repasse de comissões - A comissão tem percentual combinado entre seguradora, empresa e colaborador e é repassada nos dias 15 e 30 de cada mês, com emissão de nota fiscal e cálculo de imposto e IOF (colaborador, percentual, valor, data, nota fiscal). |
PR06 - Atendimento substituto - Na ausência do colaborador responsável, outro colaborador atende o cliente e repassa o atendimento ao responsável (cliente, quem atendeu, responsável, data). 
PR07 - Pagamento de salários - Os salários são pagos todo dia 05 (colaborador, data).  
- **Justificativa dos processos prováveis não incluídos:** Folha de pagamento e cálculo de salários - Os salários são pagos todo dia 05, mas o cálculo e o controle são rotina de RH e contabilidade, fora do banco de dados de seguros. 
Escrituração fiscal e apuração de impostos e IOF - Foi citada na entrevista, mas é feita pela contabilidade, fora deste banco. O banco guarda apenas o valor da comissão. 
Compras de fornecedores - A corretora vende serviços e não mantém estoque; compras administrativas (material de escritório, assinaturas) não fazem parte da gestão de seguros. 
Escala, ponto e férias da equipe - Não foi citado na entrevista e é rotina de RH, sem relação com a venda e a gestão das apólices. 
Marketing e divulgação (site, redes sociais) | Não é um problema de gestão de informações, que é o foco do banco de dados. 
Financeiro geral da empresa (contas a pagar e a receber, fluxo de caixa) - É tratado pelo sócio responsável pelo financeiro, em ferramentas próprias, e não envolve os dados de clientes, apólices e sinistros.

**Requisitos**

- **Requisitos Funcionais:** o que o sistema precisa **fazer**, com os dados envolvidos (ex.: "o sistema deve permitir registrar uma venda com data, cliente, vendedor, forma de pagamento e, para cada item, produto, quantidade e preço unitário"). Cada um com um código (`RF01`, `RF02`…).  
- **Requisitos Não Funcionais:** características de qualidade (ex.: desempenho, segurança, usabilidade, disponibilidade). Cada um com um código (`RNF01`, `RNF02`…).  
- **Requisitos típicos de uma corretora de seguros:** Requisitos típicos de uma corretora de seguros  
- Requisitos Funcionais (RF)  
- RF01: O sistema deve permitir cadastrar clientes com nome, CPF/CNPJ, telefone e endereço.  
- RF02: Deve permitir cadastrar corretores e colaboradores.  
- RF03: Deve registrar propostas e vendas de seguros.  
- RF04: Deve permitir anexar documentos necessários para contratação dos seguros.  
- RF05: Deve acompanhar o andamento das propostas e apólices.  
- RF06: Deve controlar as comissões dos corretores e colaboradores.  
- RF07: Deve registrar pagamentos de comissões e suas respectivas datas.  
- RF08: Deve permitir consultar o histórico de clientes e vendas.  
- RF09: Deve gerar relatórios de produção diária, semanal e mensal.  
- RF10: Deve permitir consultar seguradoras, produtos e tipos de seguros.  
- RF11: Deve controlar renovações e vencimentos de apólices.  
- RF12: Deve permitir consultar o status de cada cliente e atendimento.  
- **Requisitos Não Funcionais (RNF)**  
- RNF01 – Segurança: Proteger os dados dos clientes contra acessos não autorizados.  
- RNF02 – Privacidade: Cumprir a LGPD e manter o sigilo das informações.  
- RNF03 – Desempenho: Realizar consultas e registros rapidamente.  
- RNF04 – Usabilidade: Possuir interface simples e fácil de utilizar.  
- RNF05 – Disponibilidade: Manter o sistema disponível durante o expediente.  
- RNF06 – Confiabilidade: Garantir o armazenamento correto das informações.  
- RNF07 – Controle de acesso: Permitir que cada colaborador visualize apenas os dados autorizados.  
- RNF08 – Backup: Realizar cópias de segurança para evitar a perda de informações.  
- **Justificativa dos requisitos prováveis não incluídos:**   
  Controle de estoque: Não se aplica, pois a corretora comercializa seguros, não produtos físicos.  
- Controle de entregas: Não existe entrega de mercadorias.  
- Produção industrial: Não faz parte das atividades da corretora.  
- Controle de transporte: Não é necessário para os processos de venda e administração de seguros.  
- **Validação**  
- Os requisitos foram levantados considerando as atividades típicas de uma corretora de seguros e devem ser confirmados com o sócio responsável pela empresa..

**Regras de negócio**

- **Regras típicas de uma corretora de seguros:** As Regras Operacionais e de Processo  
- Regras que regem a execução diária das atividades e o fluxo das informações no sistema.  
- Integridade e Rastreabilidade de Pedidos:  
- Um pedido só pode ser preparado ou entregue se estiver formalmente registrado no sistema com status "Confirmado" ou "Pago".  
- Solicitantes ou atendentes não podem alterar itens de um pedido que já entrou em fase de preparação/produção.  
- Política de Cancelamento e Histórico:  
- O cancelamento de registros (pedidos, agendamentos ou cadastros) nunca apaga o dado do banco de dados; altera-se o status para "Cancelado" mantendo o histórico de auditoria (rastreabilidade).  
- Cancelamentos efetuados após determinado estágio do processo exigem justificativa obrigatória e/ou aprovação de um supervisor.  
- **Gestão de Estoque e Disponibilidade:**  
- Não é permitida a confirmação de venda/serviço para itens cujo estoque disponível seja zero ou insuficiente (ou bloqueio automático com aviso de backorder).  
- A reserva de estoque é válida por um tempo limite (ex.: 15 a 30 minutos) durante o checkout; se o pagamento não for confirmado, o item retorna ao estoque geral.  
- **Pagamentos e Recebimento:**  
- A liberação para entrega ou prestação do serviço depende da confirmação prévia do meio de pagamento (cartão, Pix, boleto compensado).
  
- **Restrições Legais, Regulatórias e Organizacionais**  
- Regras impostas por legislação externa ou por diretrizes de governança e controle interno.  
- **Proteção de Dados Pessoais (LGPD):**  
- Coleta restrita aos dados estritamente necessários para a execução do serviço/contrato.  
- Omissão/mascaramento de dados sensíveis (ex.: CPF, telefone, endereço) para usuários sem nível de permissão adequado.  
- Direito ao esquecimento/anonimização: a pedido do titular, dados pessoais identificáveis devem ser anonimizados, mantendo-se apenas registros fiscais/legais obrigatórios. 
- **Fiscal e Contábil:**  
- Emissão de Nota Fiscal (NFe/NFS-e): Toda transação financeira concluída deve obrigatoriamente gerar o arquivo XML/DANFE correspondente e ser enviada ao fisco e ao cliente.  
- O valor total da nota fiscal deve corresponder exatamente à soma dos itens, frete e descontos aplicados no pedido.  
- **Normas Sanitárias e de Segurança (Conforme o Setor):**  
- Controle obrigatório de validade e lote de insumos/produtos.  
- Registro de temperatura/condições de armazenamento quando aplicável (ex.: alimentação, farmácia).  
- **Idade Mínima e Capacidade Legal:**  
- Proibição de venda de produtos restritos (bebidas alcoólicas, medicamentos controlados, etc.) ou cadastro de usuários menores de idade sem consentimento dos pais/responsáveis legais.  
- **Controle de Acesso e Perfil de Usuário (RBAC):**  
- Acesso segregado por cargos/funções (ex.: operador visualiza pedidos; gerente autoriza descontos/reembolsos; administrador gerencia permissões e configurações de sistema).   
- **Justifique as regras prováveis não incluídas:**  
- Nem todas as regras comuns em organizações semelhantes se aplicam ao contexto específico da organização analisada. As exclusões são justificadas a seguir:  
- Regra Comum no Setor / Tipo de Organização \- Motivo da Não Inclusão / Exclusão do Escopo  
- Venda/Atendimento para Menores de Idade (Restrição de Idade) \-	Não se aplica à natureza do negócio: A organização opera exclusivamente no modelo B2B (Business-to-Business) ou comercializa produtos/serviços de uso geral sem restrição etária legal.  
- Normas Sanitárias Complexas / Controle de Lote e Temperatura \-	Fora do escopo operacional: A organização atua no setor de prestação de serviços digitais/software ou comércio de bens não perecíveis, não manipulando insumos físicos que exijam vigilância sanitária.  
- Reserva Temporal de Estoque em Carrinho	Diferença no modelo de processo: A organização trabalha sob encomenda (make-to-order) ou prestação de serviço sob agendamento prévio, não havendo o conceito de concorrência por estoque físico limitado em tempo real.  
- Integração com Logística de Terceiros / Frete Dinâmico \- Não realiza o processo correspondente: O cliente realiza a retirada no local (pick-up) ou a entrega é feita por frota própria com taxa fixa, dispensando cálculos de frete de transportadoras externas.  
- Multi Aprovação Hierárquica de Descontos \- Incompatível com o porte: Trata-se de uma organização de pequeno/médio porte com estrutura enxuta, onde a política de preço é fixa e os atendentes têm autonomia limitada sem necessidade de fluxos complexos de alçada. 


**Notação do DER conceitual**

[Diagrama de Entidade-Relacionamento (DER)](Modelo-Diagrama.png).

O software utilizado para a criação do modelo DER foi o BRModelo.

| Apontamento da correção da E1 | O que mudou no trabalho | Por quê |
| :---- | :---- | :---- |
| *ex.: N:N entre PEDIDO e PRODUTO sem quantidade* | *criada a entidade associativa ITEM\_PEDIDO com quantidade e preço praticado* | *sem ela não é possível saber quanto de cada produto foi vendido* |
| *ex.: chaves estrangeiras desenhadas no DER* | *removidas — passam a aparecer só no modelo lógico (seção 2\)* | *FK é decisão do modelo lógico, não do conceitual* |



### 1.2 Conversão do Modelo Conceitual para o Modelo Lógico


- **Entidades → Tabelas:** Cada entidade virou uma tabela, com chave primária substituta `INT AUTO_INCREMENT`.   
- **Atributos → Colunas:** Regras de conversão aplicadas:  
* Atributos identificadores viraram `INT AUTO_INCREMENT PRIMARY KEY`.  
* Textos curtos viraram `VARCHAR` com tamanho por uso (nome 100/150, e-mail 100, CPF/CNPJ 20).  
* Valores monetários viraram `DECIMAL(10,2)` ou `DECIMAL(12,2)`, com `CHECK (… >= 0)`.  
* Datas viraram `DATE`.  
* Atributos com domínio fechado viraram `ENUM`: `tipo_cliente` (PF, PJ), `tipo_registro` (Proposta, Apólice Ativa, Cancelada, Renovada), `status_sinistro` (Aberto, Em Análise, Pago, Negado) e `status_colaborador` (Ativo, Inativo).  
* Atributos obrigatórios receberam `NOT NULL`. Ficaram opcionais: `telefone`, `email`, `cidade`, `estado`, `descricao` e `premio_item`.  
* Atributos únicos receberam `UNIQUE`: `email` do colaborador, `cpf_cnpj`, `nome_ramo`, `numero_apolice` e `numero_sinistro`.  
* `valor_pago` tem `DEFAULT 0.00`.  
   
- **Relacionamentos → Chaves:** *Cada relacionamento 1:N virou uma FK na tabela do lado N. .*  
- **Cardinalidades:** Todas as relações são 1:N. O mínimo (1,1) do lado N vem do `NOT NULL` na FK. O (0,n) do lado 1 existe porque nada obriga o pai a ter filhos.  
- **Generalização/especialização:** O que o script mostra: não há tabelas de especialização. Cliente PF/PJ foi tratado com **tabela única** (`clientes`) e a coluna discriminadora `tipo_cliente`.     

### 1.3 Definição de Chaves Primárias e Estrangeiras

CHAVES PRIMARIAS
CLIENTES            ID_CLIENTES            SIMPLES
COLABORADORES       ID_COLABORADORES       SIMPLES
RAMO_SEGURO         ID_RAMO                SIMPLES
PRODUTOS_SEGURO     ID_PRODUTOS            SIMPLES
APOLICES_PROPOSTAS  ID_APOLICE             SIMPLES
SINISTROS           ID_SINISTRO            SIMPLES
ITEM_COBERTURA      ID_APOLICE+ID_PRODUTO  COMPOSTO

CHAVES ESTRANGEIRAS
PRODUTOS_SEGURO   ID_RAMO   RAMOS_SEGURO   ID_RAMO   CLASSIFICA
APOLICES_PROPOSTAS   ID_CLIENTE   CLIENTES   ID_CLIENTE   CONTRATA
APOLICES_PROPOSTAS   ID_COLABORADOR   COLABORADORES   ID_COLABORADOR   ATENDE_APOLICE
ITEM_COBERTURA   ID_APOLICE   APOLICE_PROPOSTAS   ID_APOLICE   ITEM_COBERTURA
ITEM_COBERTURA   ID_PRODUTO   PRODUTOS_SEGURO   ID_PRODUTO   ITEM_COBERTURA
SINISTROS   ID_APOLICE   APOLICE_PROPOSTAS   ID_COLABORADOR   GERA
SINISTROS   ID_COLABORADOR   COLABORADORES   ID_COLABORADOR   ATENDE_SINISTRO

### 1.4 Processo de Normalização (1FN, 2FN e 3FN)


- **1FN:** Eliminação de grupos repetitivos e atributos multivalorados: Todos os atributos contêm apenas valores atómicos (indivisíveis). Por exemplo, os contactos telefónicos e os endereços de correio eletrónico foram isolados nas respetivas colunas de clientes e colaboradores. Os itens de cobertura de uma apólice, que poderiam gerar repetição de colunas numa tabela única, foram isolados numa tabela associativa dedicada (item_cobertura), garantindo que cada registo represente um único valor por célula.  
- **2FN:** Eliminação de dependências parciais: A base de dados encontra-se em 1FN e todas as colunas não-chave dependem inteiramente da chave primária (composta ou simples). Em tabelas com chaves primárias auto-incrementais (id_colaborador, id_cliente, id_apolice), todos os atributos não-chave dependem funcionalmente e por completo da respetiva chave primária, não existindo dependências parciais em chaves compostas.  
- **3FN:** Eliminação de dependências transitivas: A base de dados encontra-se em 2FN e nenhum atributo não-chave depende de outro atributo não-chave. Por exemplo, na tabela de apólices (apolices_propostas), os dados referentes ao cliente, ao produto e ao colaborador não são armazenados diretamente como texto redundante, mas sim através de chaves estrangeiras (id_cliente, id_produto, id_colaborador). Os detalhes do produto (como o nome da seguradora ou o ramo) residem exclusivamente nas respetivas tabelas dimensionais (produtos_seguro e ramos_seguro), impedindo que alterações em atributos descritivos criem inconsistências sistémicas.  
- **Justificativa do processo:** A aplicação da normalização foi necessária para espelhar as regras de negócio complexas da corretora (gestão de prémios, comissões divididas, sinistros e auditoria de clientes sem compras).
Ao separar entidades críticas como Clientes, Produtos, Apólices e Sinistros, evitou-se a duplicação de dados cadastrais e assegurou-se que as restrições de integridade (FOREIGN KEY com RESTRICT e CASCADE) e as validações financeiras (CHECK para valores monetários positivos) operassem de forma limpa, auditável e sem risco de corrupção de dados administrativos.

### 1.5 Justificativas Técnicas das Decisões

Chaves primárias
- **`ID_*` (cliente, colaborador, ramo, produto, apólice, sinistro):** identificadores internos, estáveis e sem significado de negócio. São mais seguros que CPF/CNPJ ou número da apólice, que podem ser corrigidos ou mudar de formato.
- **`ITEM_COBERTURA` (`ID_APOLICE` + `ID_PRODUTO`):** a chave composta identifica cada linha e impede repetir o mesmo produto na mesma apólice.

Chaves estrangeiras e relacionamentos
A FK fica sempre no lado "(1,1)", na tabela que depende da outra.

| FK | Regra que implementa |
|---|---|
| `APOLICES_PROPOSTAS.ID_CLIENTE` | Toda apólice pertence a um cliente (CONTRATA) |
| `APOLICES_PROPOSTAS.ID_COLABORADOR` | Toda apólice é atendida por um colaborador (ATENDE_APOLICE) |
| `SINISTROS.ID_APOLICE` | Todo sinistro nasce de uma apólice (GERA) |
| `SINISTROS.ID_COLABORADOR` | Todo sinistro é atendido por um colaborador (ATENDE_SINISTRO) |
| `PRODUTOS_SEGURO.ID_RAMO` | Todo produto pertence a um ramo (CLASSIFICA) |
| `ITEM_COBERTURA.ID_APOLICE` / `ID_PRODUTO` | Relação N:N entre apólices e produtos, com o valor da cobertura |

Todas as FKs são `NOT NULL`, pois a participação mínima do lado dependente é 1.

Restrições aplicadas
- **`UNIQUE`:** `ID_CPF_CNPJ`, `ID_CPF`, `ID_SUSEP`, `ID_NUMERO_APOLICE` e `ID_NUMERO_SINISTRO`, para evitar duplicidade de documentos e números de negócio.
- **`NULL` permitido:** `DT_NASCIMENTO` (clientes), `ID_SUSEP` (colaboradores) e `QT_VALOR_INDENIZACAO` (a indenização pode ser calculada depois do registro do sinistro).
- **`NOT NULL`:** todos os demais campos, conforme o diagrama.
- **`DEFAULT 0`:** `QT_DESCONTO_APLICADO`, para apólice sem desconto.
- **Campos de tipo e indicador:** `TP_CLIENTE` (F/J), `IN_CADASTRO_ATIVO` e `IN_APROVACAO_GERENCIAL` (S/N) usam `CHAR(1)`.

Decisões arquiteturais
- **Chave substituta (`ID_*`):** FKs menores e proteção contra mudança de dados naturais, que continuam protegidos por `UNIQUE`.
- **Uma tabela por entidade:** evita repetição de dados, como o nome do ramo em cada produto.
- **Tabela associativa apenas no N:N:** os demais relacionamentos são 1:N e viram só uma FK.
- **`COLABORADORES` única:** o mesmo colaborador atende apólices e sinistros, sem cadastro duplicado.
- **Mínimo 1 em `ITEM_COBERTURA`:** o SQL padrão não garante que toda apólice tenha ao menos um item. Isso fica a cargo de trigger ou da aplicação.
  
### 1.6 Proposta de Arquitetura Analítica para BI e IA

**1\.   Informações Estratégicas para a Gestão da Organização**    
 

* ***Desempenho por Ramo e Produto:** Identificação de quais produtos e ramos (vida, auto e residencial) geram mais contratos e receita.*    
     
*  ***Desempenho por Seguradora e Corretor:** Acompanhamento das vendas por seguradora (SulAmérica, Bradesco, Porto Seguro) e por correto.*    
     
* ***Gargalos no Setor de Documentação:** Monitoramento do tempo em que as propostas ficam paradas no setor de documentação.*    
     
* ***Perfil e Retenção de Clientes:** Mapeamento do perfil dos clientes (PF e PJ) e acompanhamento da taxa de renovação.*

   **2\.   Indicadores e Métricas Gerenciais (KPIs)**  

*  ***Contratos Fechados:** Volume total de contratos fechados por dia e por mês.*    
     
*  ***Taxa de Conversão:** Percentual de cotações convertidas em apólices emitidas.*    
     
* ***Tempo Médio de Emissão:** Tempo médio decorrido para a emissão final da apólice.*    
     
* ***Propostas Pendentes:** Quantidade de propostas paradas por falta de documentação.*    
     
* ***Ticket Médio por Produto:** Valor médio gerado por cada produto/ramo de seguro.*    
     
* ***Taxa de Renovação e Cancelamento:** Percentual de contratos renovados versus cancelados.*  
    
* ***Sinistros por Ramo:** Frequência e volume de sinistros por ramo de atuação.*  

**3\.   Potencial dos Dados para BI (Business Intelligence)**   
   
 *O modelo dimensional separa colaboradores, clientes, produtos, apólices e sinistros em tabelas de Fatos e Dimensões. Isso permite cruzar dimensões (tempo, corretor, seguradora, ramo) em dashboards executivos de vendas, pendências e carteira de clientes.*   
   
 **4\.   Aplicações Analíticas e de Inteligência Artificial (IA)**    
 

*  *Previsão de Cancelamento (Churn) e Renovação: Modelos preditivos para identificar apólices com risco de não renovação.*    
     
* *Recomendação de Produtos (Cross-selling): Sistema de recomendação para oferecer novos produtos (ex.: seguro automotivo para quem já possui residencial).*    
     
*  ***Classificação de Risco de Pendência:** Classificação automática de propostas com risco de ficarem travadas na documentação.*  
    
* ***Previsão de Demanda:** Modelos para prever o volume de propostas e dimensionar a equipe de atendimento.* 

*  ***Previsão de Demanda:** Modelos para prever o volume de propostas e dimensionar a equipe de Atendimento.*   
    
    


 **5\.      Tabela de Rastreabilidade**

| Problema Declarado na Caracterização |     KPI Proposto | Tabelas Envolvidas |      Consulta SQL          (Código da seção 3\) |
| :---- | :---- | :---- | :---- |
| *Documentação sempre pendente e gargalo operacional* | *PROPOSTAS PENDENTES; TEMPO DE EMISSÃO* | *Apólices, propostas, colaboradoras* |  *C01* |
| *Falta de visão analitica por produto e ramo* | *CONTRATOS FECHADOS; TICKET MÉDIO POR PRODUTO* | *Produtos\_seguro, ramos\_seguro, apólices* | *C02* |
| *Dependência e falta de controle sobre sistemas das seguradoras* | *CONTRATOS POR  SEGURADORAS; LEAD TIME DE EMISSÃO* | *Apólices, produtos\_seguro, seguradora* | *C03* |
| *Dificuldade em mensurar o desempenho da equipe* | *CONTRATOS POR CORRETOR; TAXA DE CONVERSÃO* | *Colaboradores, apolices* | *C04* |
| *Publico de classes C e D sem oferta e produto adequado* | *PERFIL DE CLIENTE; CONVERSÃO POR TIPO DE CLIENTE* | *Clientes\_pf, clientes\_pj, apolices*   | *C05* |

---

## 2\. Modelo Lógico Relacional

*(diagrama separado — vale 10% na Dimensão Procedimental)*

O modelo lógico deve seguir a **notação visual do brModelo** para o modelo lógico, como no exemplo abaixo. Informe no README **em qual software ou aplicativo ele foi criado**.

![Exemplo de modelo lógico na notação do brModelo](Exemplo_Logico.png)

| Elemento | Como aparece | No exemplo |
| :---- | :---- | :---- |
| **Tabela** | retângulo com o nome da tabela no topo e uma linha por coluna | `Entity 1`, `Entity 5` |
| **Coluna** | nome da coluna, à esquerda, com o tipo de dado à direita | `Attribute 30` — `INT` |
| **Chave primária** | marca `PK` ao lado do tipo | `Chave 1`, em `Entity 1`; `Chave 50` \+ `Chave 51`, em `Entity 5` (chave primária composta) |
| **Chave estrangeira** | marca `FK` ao lado do tipo | `Chave 3`, em `Entity 4` |
| **Coluna que é chave primária e estrangeira** | marcas `PK, FK` | `Chave 1`, em `Entity 2` |
| **Ligação entre tabelas** | linha entre a tabela da FK e a tabela referenciada, com a cardinalidade `(mín, máx)` em cada ponta | `Entity 3` — `Entity 4`: `(1, 1)` e `(0, n)` |

 

Deve apresentar claramente:

- Tabelas  
- Atributos (colunas), com seus tipos de dados  
- Chaves primárias  
- Chaves estrangeiras  
- Cardinalidades já convertidas

As **demais restrições de integridade** — obrigatoriedade (`NOT NULL`), unicidade (`UNIQUE`), valores permitidos (`CHECK`), valores padrão (`DEFAULT`) — não aparecem no diagrama do brModelo e devem ser documentadas no **dicionário de dados** (seção 5\) e implementadas no **script SQL** (seção 3).

---

## 3\. Script SQL Completo e Massa de Dados

[Script SQL](docs/script.sql) 


## 6\. Uso de Inteligência Artificial

| Item | O que registrar |
| :---- | :---- |
| **Ferramenta e etapa** | Claude, na etapa 1.2, Conversão do Modelo Conceitual para o Modelo Lógico. O Claude leu o script SQL do grupo e levantou como cada entidade, atributo, relacionamento e cardinalidade foi convertido.   |
| **Motivação** | O grupo já tinha o script SQL implementado e precisava descrever, na seção 1.2, como o modelo conceitual virou modelo lógico (entidades → tabelas, atributos → colunas, relacionamentos → chaves, cardinalidades, generalização). Recorreram à IA para extrair essas informações do script de forma organizada, no formato exigido pelo esqueleto, e para comparar o script com o dicionário de dados do README.  |
| **Prompt(s) utilizados** | preciso levantar essas informações, caso precise do script, está em anexo  |
| **Resposta recebida** | A IA listou 7 tabelas, 6 chaves estrangeiras (com ON DELETE RESTRICT, e CASCADE em `item_cobertura`) e cardinalidades 1:N em (mín, máx). Informou que não há N:N, 1:1 nem tabela associativa, e que PF/PJ usa tabela única com `tipo_cliente`. Apontou conflitos entre o script e o dicionário do README: apólice × produto (N:N no README, 1:N no script), sinistro sem FK para colaborador/prestador, SGBD e collation diferentes, e DELETE de apólice contra a regra do §6.  |
| **Fontes consultadas e verificadas** | A IA não citou fontes externas; toda a resposta partiu do script SQL do próprio grupo. O grupo conferiu **\[CONFIRMAR: como\]**. Sugestão de conferência: comparar cada tabela, FK e `ON DELETE` do texto com o script, e rodar o script do zero no MySQL para ver que executa sem erro.  |
|  **Trechos rejeitados ou corrigidos** | Preencham com o que realmente mudaram. Exemplos possíveis: o que foi ajustado no texto da seção 1.2 depois da conferência, se o dicionário ou o DER foram alterados para bater com o script, e se o texto de generalização foi trocado conforme o DER real (a IA não viu a imagem do DER e deixou duas versões possíveis).  |
| **Justificativa da escolha final** | **\[CONFIRMAR\]** Base sugerida: o grupo adotou o script SQL como fonte de verdade por ser o que executa, e atualizou o dicionário e o DER para refletir o script (ou o inverso, se decidirem manter o N:N). Justifiquem a decisão sobre apólice × produto, porque ela muda o modelo.  |
| **Reflexão crítica** | A IA trabalhou só com o script, sem ver o DER, e por isso não confirmou a parte de generalização. Os mínimos de cardinalidade (1,1) e (0,n) foram deduzidos dos `NOT NULL` do script, não de regras de negócio documentadas, então precisam bater com as regras RNxx do grupo. A IA descreveu o modelo implementado, que divergia do dicionário do README. Isso mostra que o texto gerado só é confiável se o grupo checar contra os próprios artefatos. Também apontou ausência de CHECKs (datas, valor pago) e volume pequeno da massa de dados frente ao porte real da empresa, o que o grupo precisa decidir se corrige.  |

 

| Item | O que registrar |
| :---- | :---- |
| **Ferramenta e etapa** | *Gemini, usei para etapa 1.2 para os requisitos funcionais e não funcionais, a IA também foi eficaz para assimilar as regras de negócio e regras típicas.* |
| **Motivação** | *Eu usei a IA por que intensificou minha procura e pesquisa. Atualizando e completando dados.* |
| **Prompt(s) utilizados** | Levante as regras típicas do tipo de organização. Assim como nos processos e nos requisitos, é recomendável usar pesquisas e ferramentas de IA para descobrir quais regras são comuns em organizações semelhantes e conferir se elas valem na organização escolhida — o que pode exigir confirmação com o responsável. |
| **Resposta recebida** | **Integridade e Rastreabilidade de Pedidos:** Um pedido só pode ser preparado ou entregue se estiver formalmente registrado no sistema com status "Confirmado" ou "Pago". Solicitantes ou atendentes não podem alterar itens de um pedido que já entrou em fase de preparação/produção. |
| **Fontes consultadas e verificadas** | Foram fundamentadas na legislação brasileira vigente,nas diretrizes dos órgãos reguladores do setor securitário e em boas práticas corporativas de gestão e segurança da informação |
| **Trechos rejeitados ou corrigidos** | *Não foi rejeitado.* |
| **Justificativa da escolha final** | Fundamentam-se no equilíbrio exato entre **eficiência operacional**, **conformidade regulatória** e **segurança da informação**, respeitando o porte enxuto e o alto volume de operações da empresa. |
| **Reflexão crítica** | A especificação de requisitos e regras de negócio para a **M.R.D. Corretora de Seguros** revela um alinhamento direto entre a teoria da Engenharia de Requisitos e os desafios práticos de uma operação de médio porte com alto volume diário de transações. A análise crítica dessa definição destaca três dimensões fundamentais: |

| Item  | O que registrar |
| :---- | :---- |
| **Ferramenta e etapa** | Usei o Gemini para fazer a parte 1.6 fazendo a parte de Arquitetura Analitica para BI e IA, e me auxiliar na montagem da tabela  de Rastreabilidade |
| **Motivação** | Não compreendia a forma de montar a tabela e pedi ajuda da IA para me explicar e ajudar na montagem |
| **Prompt(s) utilizados** | Inicei solicitando o conteúdo detalhado para a seção "1.6 Proposta de Arquitetura Analítica para BI e IA”, cobrindo informações estratégicas, KPIs, potencial de BI, aplicações de IA e a tabela de rastreabilidade. Dúvida sobre a Tabela de Rastreabilidade: Pediu uma explicação clara e prática de como montar essa tabela relacionando os problemas, KPIs, tabelas de banco de dados e os códigos das consultas SQL. Exemplo Prático: Solicitou um exemplo apenas para preenchimento e, em seguida, pediu que o conteúdo fosse disponibilizado em um formato que pudesse ser aberto no Microsoft Word. Contextualização com o Caso M.R.D Saúde: Identificou o contexto acadêmico/estudo de caso da corretora M.R.D Saúde (ramos de seguros, controle de propostas/documentação, corretores fixos e freelancers, seguradoras parceiras, etc.) e apresentou um rascunho com os problemas, KPIs, BI, IA e mapeamento de tabelas. Geração de Arquivos e Formatação Final: Pediu a montagem definitiva da tabela e o arquivo formatado em Word (.docx) contendo toda a proposta analítica estruturada para este cenário.  |
| **Resposta recebida** | **Conteúdo e Estrutura:** Elaborei a Seção 1.6 completa (KPIs, BI, IA e informações estratégicas).  **Explicação da Tabela:** Esclareci a lógica de rastreabilidade passo a passo.  **Caso M.R.D Saúde:** Estruturei os dados e a tabela final adaptados para a corretora de seguros.  **Geração de Arquivos: Criei e disponibilizei para download os arquivos `.docx` prontos para o Word.**  |
| **Fontes consultadas e verificadas** | Conteúdo e Estrutura: Criei o texto completo da Seção 1.6 (informações estratégicas, KPIs com fórmulas, BI e IA). Explicação da Tabela: Expliquei de forma simples como funciona a rastreabilidade entre os problemas, KPIs, tabelas e consultas SQL. Adaptação para a M.R.D Saúde: Estruturei os dados e a tabela final com base no seu rascunho focado no setor de seguros. Ficheiros Word: Gerei e disponibilizei para download os ficheiros .docx (.docx) prontos para abrir no Microsoft Word.  |
| **Trechos rejeitados ou corrigidas** | Após uma análise não foi rejeitado nenhum trecho ou corrigida |
| **Justificativa da escolha final**  | A IA escolhida foi o Gemini, por familiaridade da IA e pela facilidade que tenho um usar |
| **Reflexão crítica** | O processo de criação da proposta analítica de BI, IA e da tabela de rastreabilidade evidencia que a automação e a geração de artefatos técnicos — como a dedução de cardinalidades por restrições de script e não por regras de negócio documentadas (RNxx) — geram divergências perigosas face à documentação oficial e ao DER. Isso demonstra que a documentação gerada só é confiável mediante uma checagem cruzada rigorosa da equipa. Além disso, falhas como a ausência de restrições lógicas (`CHECK`) e o uso de massas de dados desproporcionais ao porte real da organização comprometem a fiabilidade dos relatórios e modelos, exigindo curadoria humana constante para garantir que a arquitetura analítica reflita a realidade do negócio  |

| **Ferramenta e etapa** | Utilizei o Claude para que ele fizesse uma conferência do diagrama que fiz a mão no BrModelo
| **Motivação** | Analisar e verificar se havia algum campo ou erro na hora da digitação e, também, se houve algum tipo de falha de direcionamento.
| **Prompt(s) utilizados** | Utilizei o prompt - realizar a análise do DER em anexo e verificar se existe algum tipo de erro ortográfico e, também, se há alguma falha na estruturação do diagrama em anexo.
| **Resposta recebida** | Ele informou que havia uma ligação que estava diferente do que estava descrito no diagrama e também informou alguns erros de ortografias solicitando a correção.
