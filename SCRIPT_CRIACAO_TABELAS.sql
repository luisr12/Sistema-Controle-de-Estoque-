/*Cria o dominio descrição*/

CREATE DOMAIN descricao varchar(100) not null;

/*Cria tabela de usuarios*/

CREATE TABLE USUARIO(
ID_USUARIO INT NOT NULL,
NOME descricao,
SENHA      VARCHAR(30) NOT NULL,
TIPO       VARCHAR(30) NOT NULL,
CADASTRO   DATE NOT NULL,
CONSTRAINT PK_USUARIO primary KEY (ID_USUARIO)
);

/*Cria a tabela de Empresa*/

create table EMPRESA (
    ID_EMPRESA      INT NOT NULL,
    RASAO_SOCIAL    descricao,
    N_FANTASIA      descricao,
    ENDERECO        descricao,
    NUMERO          integer NOT NULL,
    BAIRRO          descricao,
    CIDADE          descricao,
    UF              CHAR(2) NOT NULL,
    TELEFONE        VARCHAR(16) NOT NULL,
    CNPJ            VARCHAR(20) NOT NULL,
    EMAIL           descricao,
    CADASTRO        DATE NOT NULL,
CONSTRAINT           PK_EMPRESA PRIMARY KEY(ID_EMPRESA)
);

/* CRIA TABELA DE FORNECEDORES*/

CREATE TABLE FORNECEDOR(
    ID_FORNECEDOR INT NOT NULL,
    NOME          descricao,
    ENEDERECO     descricao,
    NUMERO        INTEGER NOT NULL,
    BAIRRO        descricao,
    CIDADE        descricao,
    UF            CHAR(2) NOT NULL,
    CEP           VARCHAR(16)NOT NULL,
    TELEFONE      VARCHAR(16) NOT NULL,
    CNPJ          VARCHAR(20) NOT NULL,
    EMAIL         descricao,
    CADASTRO      DATE NOT NULL,
    CONSTRAINT     PK_FORNECEDOR primary KEY(ID_FORNECEDOR)
    
);


/* CRIA TABELA DE CLIENTES*/

CREATE TABLE CLIENTE (
    ID_CLIENTE INT NOT NULL,
    NOME          descricao,
    ENEDERECO     descricao,
    NUMERO        INTEGER NOT NULL,
    BAIRRO        descricao,
    CIDADE        descricao,
    UF            CHAR(2) NOT NULL,
    CEP           VARCHAR(16)NOT NULL,
    TELEFONE      VARCHAR(16) NOT NULL,
    CPF          VARCHAR(16) NOT NULL,
    EMAIL         descricao,
    CADASTRO      DATE NOT NULL,
    CONSTRAINT     PK_CLIENTE  primary KEY(ID_CLIENTE)
    
);
   /*CRIA TABELA DE PRODUTOS*/
   
CREATE TABLE PRODUTO(
    ID_PRODUTO INTEGER NOT NULL,
    DECRICAO   descricao,
    ID_FORNECEDOR   INTEGER NOT NULL,
    VL_CUSTO        DECIMAL(11,2) NOT NULL,
    VL_VENDA        DECIMAL(11,2) NOT NULL,
    ESTOQUE         decimal(11,2 )NOT NULL,
    ESTOQUE_MIN     decimal(11,2) NOT NULL,
    UNIDADE         VARCHAR(6) NOT NULL,
    CADASTRO        DATE NOT NULL,
    constraint        PK_PRODUTO primary KEY(ID_PRODUTO),
    constraint        FK_FORNECEDOR_PRODUTO foreign KEY(ID_FORNECEDOR) references FORNECEDOR(ID_FORNECEDOR)
    );
    /*CRIA TABELAS FORMA DE PAGAMENTOS*/
    
create TABLE FORMA_PAGTO(
    ID_FORMA_PAGTO  INTEGER NOT NULL,
    DESCRICAO       descricao,
    CADASTRO        DATE NOT NULL,
    constraint       PK_FORMA_PAGTO PRIMARY KEY (ID_FORMA_PAGTO)
);


/*CRIAR A TABELA DE COMPRAS*/

CREATE TABLE COMPRA (
    ID_COMPRA   INTEGER NOT NULL,
    ID_FORNECEDOR  integer NOT NULL,
    ID_FORMA_PAGTO INTEGER NOT NULL,
    USUARIO         descricao,
    VALOR           DECIMAL(11,2),
    CADASTRO        DATE NOT NULL,
    CONSTRAINT      PK_COMPRA primary KEY (ID_COMPRA),
    constraint      FK_FORNECEDOR foreign KEY (ID_FORNECEDOR) references FORNECEDOR( ID_FORNECEDOR),
    constraint      FK_FORMA_PAGTO foreign KEY (ID_FORMA_PAGTO) references FORMA_PAGTO (ID_FORMA_PAGTO));
    
    /*CRIAR TABELA ITEM DE COMPRA*/
CREATE TABLE ITEM_COMPRA(
    ID_SEQUENCIA    INTEGER NOT NULL,
    ID_COMPRA  INTEGER NOT NULL,
    ID_PRODUTO INTEGER NOT NULL,
    QTADE       DECIMAL(11,2),
    VL_CUSTO    DECIMAL(11,2) NOT NULL,
    DESCONTO    DECIMAL(11,2),
    TOTAL_ITEM  decIMAL(11,2) NOT NULL,
    constraint   PK_ITEM_COMPRA primary key (ID_SEQUENCIA,ID_COMPRA),
    CONSTRAINT     FK_COMPRA_ITEM_COMPRA foreign key (ID_COMPRA) references COMPRA (ID_COMPRA),
    constraint     FK_PRODUTO_ITEM_COMPRA foreign KEY (ID_PRODUTO) references PRODUTO(ID_PRODUTO) ON delete cascade);
    /*CRIA A TABELA DE CONTAS A PAGAR*/
    
CREATE TABLE CONTAS_PAGAR(
    ID_SEQUENCIA INTEGER NOT NULL,
    ID_COMPRA    INTEGER NOT NULL,
    VALOR_PARCELA decimal(11,2) NOT NULL,
    DT_VENCIMENTO  DATE NOT NULL,
    DT_PAGAMENTO   DATE,
    ATASOS         integer,
    JUROS           DECIMAL(11,2),
    VL_JUROS        DECIMAL(11,2),
    TOTAL_PAGAR     DECIMAL(11,2),
    STATUS          VARCHAR(30),
    constraint      PK_CONTAS_PAGAR PRIMARY KEY(ID_SEQUENCIA, ID_COMPRA),
    CONSTRAINT      FK_COMPRA_CONTAS_PAGAR foreign KEY (ID_COMPRA) references COMPRA (ID_COMPRA) ON DELETE CASCADE);
 /*----------------------------------------------------------------------------------------------------------------------------*/   
 
CREATE TABLE VENDA (
    ID_VENDA   INTEGER NOT NULL,
    ID_CLIENTE  integer NOT NULL,
    ID_FORMA_PAGTO INTEGER NOT NULL,
    USUARIO         descricao,
    VALOR           DECIMAL(11,2),
    CADASTRO        DATE NOT NULL,
    CONSTRAINT      PK_VENDA primary KEY (ID_VENDA),
    constraint      FK_CLIENTE_VENDA foreign KEY (ID_CLIENTE) references CLIENTE(ID_CLIENTE),
    constraint      FK_FORMA_VENDA foreign KEY (ID_FORMA_PAGTO) references FORMA_PAGTO (ID_FORMA_PAGTO));
    
    /*CRIAR TABELA ITEM DE COMPRA*/
CREATE TABLE ITEM_VENDA(
    ID_SEQUENCIA    INTEGER NOT NULL,
    ID_VENDA  INTEGER NOT NULL,
    ID_PRODUTO INTEGER NOT NULL,
    QTADE       DECIMAL(11,2),
    VL_CUSTO    DECIMAL(11,2) NOT NULL,
    DESCONTO    DECIMAL(11,2),
    TOTAL_ITEM  decIMAL(11,2) NOT NULL,
    constraint   PK_ITEM_VENDA primary key (ID_SEQUENCIA,ID_VENDA),
    CONSTRAINT     FK_VENDA_ITEM_VENDA foreign key (ID_VENDA) references VENDA (ID_VENDA),
    constraint     FK_PRODUTO_ITEM_VENDA foreign KEY (ID_PRODUTO) references PRODUTO(ID_PRODUTO) ON delete cascade);
    /*CRIA A TABELA DE CONTAS A PAGAR*/
    
CREATE TABLE CONTAS_RECEBER(
    ID_SEQUENCIA INTEGER NOT NULL,
    ID_VENDA    INTEGER NOT NULL,
    VALOR_PARCELA decimal(11,2) NOT NULL,
    DT_VENCIMENTO  DATE NOT NULL,
    DT_PAGAMENTO   DATE,
    ATASOS         integer,
    JUROS           DECIMAL(11,2),
    VL_JUROS        DECIMAL(11,2),
    TOTAL_PAGAR     DECIMAL(11,2),
    STATUS          VARCHAR(30),
    constraint      PK_CONTAS_RECEBER PRIMARY KEY(ID_SEQUENCIA, ID_VENDA),
    CONSTRAINT      FK_COMPRA_CONTAS_RECEBER foreign KEY (ID_VENDA) references VENDA(ID_VENDA) ON DELETE CASCADE);   
    
    