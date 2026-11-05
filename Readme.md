## 1\. Relatório Técnico Final

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

*(obrigatória, sem peso próprio — mas todo o restante da entrega é construído e avaliado sobre este modelo: um erro que permanecer no DER revisado se propaga para a conversão, a normalização, o modelo lógico e o script SQL)*

**Caracterização da organização** 

- **Nome e natureza da organização:** A organização escolhida foi a M.R.D \- Saúde e corretora de Seguros Ltda.  
- **Contexto e porte:** Empresa privada com fins lucrativos; tamanho da operação; atuando há 20 anos no mercado com 24 funcionários focados nas vendas de seguro de saúde, seguro de vida, seguro de carro e residencial, sendo 20 corretores internos. Há também a equipe administrativa com 2 funcionários e 2 financeiros. Com a métrica operacional de: Aproximadamente 50 a 80 contratos/dia, estimativa de 1.000 a 1.200 contratos/mês e em torno de 25.000 a 30.000 clientes ativos.  
- **Problemas e necessidades identificados:** qual é a "crise operacional" — o que está desorganizado hoje (planilhas soltas, papel, falta de controle de estoque/doações/cadastros etc.)? Numere cada problema (`P1`, `P2`…). **Todo problema declarado aqui precisa ser resolvido pelo modelo:** deve aparecer no DER e ter ao menos uma consulta gerencial no script SQL (ver a tabela de rastreabilidade da seção 1.6). O problema deve ser de **gestão de informações** — refazer o site ou melhorar a divulgação da organização, por exemplo, não é um problema que um banco de dados resolva.  
- **Escopo do sistema:** o banco de dados deve reunir **todos os dados da organização**, não só os de um setor ou processo. Mesmo que os problemas declarados se concentrem em uma área, o modelo não pode servir somente a um recorte (ex.: só o estoque de uma clínica, deixando de fora pacientes e atendimentos).  
- **Justificativa da escolha:** por que essa organização foi escolhida e por que ela é um bom caso para o projeto? Se algum integrante trabalha na organização ou tem vínculo familiar com os responsáveis, declare isso — o vínculo não gera desconto, mas **não dispensa a comprovação da entrevista com o responsável, realizada no ambiente da organização**.  
- **Evidências da organização:**  
  **CNPJ:** 33.518.915/0001-42  
  **Endereço:** Av. Celso Garcia, 3798 \- CEP:03.064-000 \- Tatuapé, São Paulo  
  **Formas de Contato:** [mrdcorretora@gmail.com](mailto:mrdcorretora@gmail.com) \- (11) 2227-9120   
  comprove que a organização existe e que o grupo teve acesso a ela — fotos do local/da visita, link da organização no Google, endereço completo e forma de contato. **Prefira o perfil da organização no Google Meu Negócio (Google Business Profile)**, que é a comprovação mais direta; site e redes sociais complementam. As fotos só são aceitas como **arquivos JPG ou PNG dentro do repositório** — fotos hospedadas fora dele (Google Drive, Imgur, anexos colados no editor do GitHub etc.) não são consideradas.  
- **Responsável pela organização:** Marcio Roberto Diniz \- **telefone** de quem atendeu o grupo — o professor pode entrar em contato para confirmar as informações.

**Relato da entrevista (todos os grupos)**

**Resumo do Levantamento:** Quem: Márcio Roberto Diniz, sócio da empresa e responsável pela área financeira. A entrevista foi realizada por Vinicius, integrante do grupo de forma presencial no dia 11/09 (sexta-feira), na sala e mesa de trabalho do sócio, dentro da empresa.  
O que foi levantado: As vendas são registradas após o corretor enviar a documentação completa ao setor administrativo, que cadastra as propostas e apólices. O controle é feito por uma planilha Excel chamada “TAREFAS ADM”, organizando vendas por corretor, produto, data e cliente. Após a emissão da apólice, as informações são lançadas no sistema SIAV, utilizado para consultar clientes, registrar vendas e controlar comissões.  
Também foram abordados o repasse de comissões entre seguradora, empresa e colaboradores, a emissão de notas fiscais, os impostos e o IOF. As comissões são pagas nos dias 15 e 30 de cada mês, enquanto os salários são pagos todo dia 05\.  
Regras principais: Os colaboradores devem ser fiéis aos clientes, respeitar as datas de pagamento das comissões e nunca antecipar repasses. Nenhum cliente deve ficar sem atendimento, mesmo quando seu corretor responsável estiver ausente, desde que o atendimento seja posteriormente comunicado a ele. O setor administrativo deve manter o sigilo dos dados dos clientes.  
Volume de vendas: Segundo o entrevistado, as vendas variam conforme o período, apresentando uma tendência de queda no final do ano, quando clientes e empresas priorizam outros gastos.

**Levantamento da Entrevista:** [Foto Entrevista](levantamento/Foto_entrevista.jpg)

**Nível de detalhe — processos, requisitos e regras de negócio (todos os grupos)**

*Frases genéricas como "o sistema deve permitir cadastrar cliente" são **superficiais** e não bastam. Em processos, requisitos e regras, indique **quais dados** estão envolvidos — todos os campos que aparecem no trabalho (DER, dicionário de dados, modelo lógico):*

| Superficial | Detalhado |
| :---- | :---- |
| *O sistema deve permitir cadastrar cliente.* | *RF03 — O sistema deve permitir cadastrar cliente com nome completo, CPF, telefone, e-mail e endereço (logradouro, número, bairro, CEP).* |
| *O cliente faz o pedido.* | *O garçom anota no pedido a mesa, o número da pulseira do cliente e, para cada item, o produto, a quantidade e as observações.* |
| *O cliente precisa estar cadastrado.* | *RN05 — Todo cliente deve ter CPF válido e único; telefone e nome completo são obrigatórios.* |

 

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
- **Inclua os processos que existem na organização**, mesmo os que não estão ligados aos problemas declarados — o banco de dados reúne todos os dados da organização (ver *Escopo do sistema* acima).  
- **Justifique os processos prováveis não incluídos:** se um processo comum nesse tipo de organização ficou de fora (ex.: compras de fornecedores, cancelamentos, escala da equipe), explique por quê — por exemplo, a organização não o realiza, ou ele é feito por terceiros.

**Requisitos (todos os grupos)**

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

**Regras de negócio (todos os grupos)**

- **Regras típicas de uma corretora de seguros:** As Regras Operacionais e de Processo  
- Regras que regem a execução diária das atividades e o fluxo das informações no sistema.  
- Integridade e Rastreabilidade de Pedidos:  
- Um pedido só pode ser preparado ou entregue se estiver formalmente registrado no sistema com status "Confirmado" ou "Pago".  
- Solicitantes ou atendentes não podem alterar itens de um pedido que já entrou em fase de preparação/produção.  
- Política de Cancelamento e Histórico:  
- O cancelamento de registros (pedidos, agendamentos ou cadastros) nunca apaga o dado do banco de dados; altera-se o status para "Cancelado" mantendo o histórico de auditoria (rastreabilidade).  
- Cancelamentos efetuados após determinado estágio do processo exigem justificativa obrigatória e/ou aprovação de um supervisor.  
- **Gestão de Estoque e Disponibilidade:**  
- **Não é permitida a confirmação de venda/serviço para itens cujo estoque disponível seja zero ou insuficiente (ou bloqueio automático com aviso de backorder).**  
- **A reserva de estoque é válida por um tempo limite (ex.: 15 a 30 minutos) durante o checkout; se o pagamento não for confirmado, o item retorna ao estoque geral.**  
- **Pagamentos e Recebimento:**  
- **A liberação para entrega ou prestação do serviço depende da confirmação prévia do meio de pagamento (cartão, Pix, boleto compensado).**  
- **B. Restrições Legais, Regulatórias e Organizacionais**  
- **Regras impostas por legislação externa ou por diretrizes de governança e controle interno.**  
- **Proteção de Dados Pessoais (LGPD):**  
- **Coleta restrita aos dados estritamente necessários para a execução do serviço/contrato.**  
- **Omissão/mascaramento de dados sensíveis (ex.: CPF, telefone, endereço) para usuários sem nível de permissão adequado.**  
- **Direito ao esquecimento/anonimização: a pedido do titular, dados pessoais identificáveis devem ser anonimizados, mantendo-se apenas registros fiscais/legais obrigatórios.**  
- **Fiscal e Contábil:**  
- **Emissão de Nota Fiscal (NFe/NFS-e): Toda transação financeira concluída deve obrigatoriamente gerar o arquivo XML/DANFE correspondente e ser enviada ao fisco e ao cliente.**  
- **O valor total da nota fiscal deve corresponder exatamente à soma dos itens, frete e descontos aplicados no pedido.**  
- **Normas Sanitárias e de Segurança (Conforme o Setor):**  
- **Controle obrigatório de validade e lote de insumos/produtos.**  
- **Registro de temperatura/condições de armazenamento quando aplicável (ex.: alimentação, farmácia).**  
- **Idade Mínima e Capacidade Legal:**  
- **Proibição de venda de produtos restritos (bebidas alcoólicas, medicamentos controlados, etc.) ou cadastro de usuários menores de idade sem consentimento dos pais/responsáveis legais.**  
- **Controle de Acesso e Perfil de Usuário (RBAC):**  
- **Acesso segregado por cargos/funções (ex.: operador visualiza pedidos; gerente autoriza descontos/reembolsos; administrador gerencia permissões e configurações de sistema).**   
- **Justifique as regras prováveis não incluídas:**  
- Nem todas as regras comuns em organizações semelhantes se aplicam ao contexto específico da organização analisada. As exclusões são justificadas a seguir:  
- Regra Comum no Setor / Tipo de Organização \- Motivo da Não Inclusão / Exclusão do Escopo  
- Venda/Atendimento para Menores de Idade (Restrição de Idade) \-	Não se aplica à natureza do negócio: A organização opera exclusivamente no modelo B2B (Business-to-Business) ou comercializa produtos/serviços de uso geral sem restrição etária legal.  
- Normas Sanitárias Complexas / Controle de Lote e Temperatura \-	Fora do escopo operacional: A organização atua no setor de prestação de serviços digitais/software ou comércio de bens não perecíveis, não manipulando insumos físicos que exijam vigilância sanitária.  
- Reserva Temporal de Estoque em Carrinho	Diferença no modelo de processo: A organização trabalha sob encomenda (make-to-order) ou prestação de serviço sob agendamento prévio, não havendo o conceito de concorrência por estoque físico limitado em tempo real.  
- Integração com Logística de Terceiros / Frete Dinâmico \- Não realiza o processo correspondente: O cliente realiza a retirada no local (pick-up) ou a entrega é feita por frota própria com taxa fixa, dispensando cálculos de frete de transportadoras externas.  
- Multi Aprovação Hierárquica de Descontos \- Incompatível com o porte: Trata-se de uma organização de pequeno/médio porte com estrutura enxuta, onde a política de preço é fixa e os atendentes têm autonomia limitada sem necessidade de fluxos complexos de alçada. 


**Notação do DER conceitual (todos os grupos — Caso A e Caso B)**

*O DER deve seguir a notação do **brModelo**, como no exemplo abaixo:*

[Diagrama de Entidade-Relacionamento (DER)](Modelo-Diagrama.png).

O software utilizado para a criação do modelo DER foi o BRModelo.

**Caso A — mesma organização da Entrega 1**

*Apresente o **DER conceitual revisado**, na notação descrita acima. A revisão parte da correção da Entrega 1 recebida pelo grupo — o DER e os demais itens acima. Para cada apontamento da correção, registre o que foi feito:*

| Apontamento da correção da E1 | O que mudou no trabalho | Por quê |
| :---- | :---- | :---- |
| *ex.: N:N entre PEDIDO e PRODUTO sem quantidade* | *criada a entidade associativa ITEM\_PEDIDO com quantidade e preço praticado* | *sem ela não é possível saber quanto de cada produto foi vendido* |
| *ex.: chaves estrangeiras desenhadas no DER* | *removidas — passam a aparecer só no modelo lógico (seção 2\)* | *FK é decisão do modelo lógico, não do conceitual* |


*Se o grupo discordar de algum apontamento e mantiver o modelo como estava, registre isso na tabela com a justificativa. Apontamento não citado na tabela é tratado como não corrigido.*

### 1.2 Conversão do Modelo Conceitual para o Modelo Lógico

*(vale 7,5%)*

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
-   
- **Relacionamentos → Chaves:** *Cada relacionamento 1:N virou uma FK na tabela do lado N. .*  
- **Cardinalidades:** Todas as relações são 1:N. O mínimo (1,1) do lado N vem do `NOT NULL` na FK. O (0,n) do lado 1 existe porque nada obriga o pai a ter filhos.  
- **Generalização/especialização:** O que o script mostra: não há tabelas de especialização. Cliente PF/PJ foi tratado com **tabela única** (`clientes`) e a coluna discriminadora `tipo_cliente`.  
* Se o DER **não** tem generalização, escrevam: “O DER não possui generalização/especialização; não houve conversão desse tipo.”  
* Se o DER mostra PF e PJ como especializações de Cliente, escrevam: “Estratégia de tabela única, porque PF e PJ compartilham quase todos os atributos (nome, `cpf_cnpj`, contato) e a mesma relação com apólices; a coluna `tipo_cliente` distingue o tipo.”  
- 

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

*(vale 7,5%)*

- **1FN:** *eliminação de grupos repetitivos/atributos multivalorados.*  
- **2FN:** *eliminação de dependências parciais.*  
- **3FN:** *eliminação de dependências transitivas.*  
- **Justificativa do processo:** *por que cada forma normal foi necessária no seu caso.*

### 1.5 Justificativas Técnicas das Decisões

*(vale 7,5%)*

- Justificar as **chaves primárias** escolhidas.  
- Justificar as **chaves estrangeiras** e os relacionamentos que elas implementam.  
- Justificar as **restrições** aplicadas (unicidade, obrigatoriedade, valores permitidos etc.), citando o código da regra de negócio (`RNxx`) que cada restrição implementa, quando houver.  
- Justificar **decisões arquiteturais** gerais do modelo.  
  

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

Script SQL 

## 5\. Repositório GitHub

*(vale 13% — Documentação e Repositório)*

O repositório deve conter:

- Relatório Técnico (no `README.md`)  
- **Dicionário de Dados** atualizado, no modelo do arquivo `02-03g_Exemplo_Dicionario_Dados.pdf` e com as restrições de integridade de cada coluna (obrigatoriedade, unicidade, valores permitidos, valor padrão), em **um único arquivo HTML** no repositório. **Exceção — turma de GTI:** o dicionário é apresentado em **um único arquivo Markdown (`.md`) separado do README**, seguindo o mesmo modelo do `02-03g_Exemplo_Dicionario_Dados.pdf`.  
- Diagramas (DER revisado e modelo lógico)  
- Levantamento (pasta `levantamento`, recomendada) e evidências da organização e da entrevista (fotos JPG ou PNG)  
- Script SQL completo em arquivo `.sql` (de preferência na pasta `docs`)  
- **Histórico de commits** que evidencie o desenvolvimento ao longo do tempo (evite um único commit final)  
- **Evidências de colaboração entre os membros do grupo:** é a listagem de commits do repositório, que deve estar **equilibrada entre os integrantes** — a quantidade de commits deve se distribuir de forma proporcional entre todos os membros do grupo, cada um fazendo commits com a própria conta do GitHub. O integrante precisa ser **identificável na conta do GitHub**: o nome configurado na conta deve ser compatível com o nome do aluno na tabela de Integrantes, onde também deve constar o usuário do GitHub de cada um

---

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
