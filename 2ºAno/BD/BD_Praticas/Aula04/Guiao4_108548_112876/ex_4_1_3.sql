GO

--- Apaga as tabelas se já existirem

IF OBJECT_ID('Stocks_Items', 'U') IS NOT NULL
	DROP TABLE Stocks_Items;
IF OBJECT_ID('Stocks_Produtos', 'U') IS NOT NULL
	DROP TABLE Stocks_Produtos;
IF OBJECT_ID('Stocks_Encomenda', 'U') IS NOT NULL
	DROP TABLE Stocks_Encomenda;
IF OBJECT_ID('Stocks_TipoFornecedor', 'U') IS NOT NULL
	DROP TABLE Stocks_TipoFornecedor;
IF OBJECT_ID('Stocks_CondicoesPagamento', 'U') IS NOT NULL
	DROP TABLE Stocks_CondicoesPagamento;
IF OBJECT_ID('Stocks_Fornecedor', 'U') IS NOT NULL
	DROP TABLE Stocks_Fornecedor;


CREATE TABLE Stocks_Produtos (
    Codigo INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Preco INT NOT NULL,
    TaxaIVA INT NOT NULL,
    Unidades INT NOT NULL,

    PRIMARY KEY(Codigo),
);

CREATE TABLE Stocks_CondicoesPagamento (
    Codigo INT NOT NULL,
    Designacao VARCHAR(100) NOT NULL,

    PRIMARY KEY(Codigo),
);

CREATE TABLE Stocks_TipoFornecedor (
    Codigo INT NOT NULL,
    Designacao VARCHAR(100) NOT NULL,

    PRIMARY KEY(Codigo),
);

CREATE TABLE Stocks_Fornecedor (
    NIF INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Morada VARCHAR(100) NOT NULL,
    Email VARCHAR(50),
    TipoForn_Codigo INT NOT NULL,
    CondPag_Codigo INT NOT NULL,

    PRIMARY KEY(NIF),
    FOREIGN KEY(TipoForn_Codigo) REFERENCES Stocks_TipoFornecedor(Codigo),
    FOREIGN KEY(CondPag_Codigo) REFERENCES Stocks_CondicoesPagamento(Codigo)
);

CREATE TABLE Stocks_Encomenda (
    Numero INT NOT NULL,
    [Data] DATE NOT NULL,
    Fornecedor_Codigo INT NOT NULL,

    PRIMARY KEY(Numero),
    FOREIGN KEY(Fornecedor_Codigo) REFERENCES Stocks_Fornecedor(NIF),
);

CREATE TABLE Stocks_Items (
    Quantidade INT NOT NULL,
    Produto_Codigo INT NOT NULL,
    Encomenda_Numero INT NOT NULL,

    PRIMARY KEY (Produto_Codigo, Encomenda_Numero),
    FOREIGN KEY (Produto_Codigo) REFERENCES Stocks_Produtos(Codigo),
    FOREIGN KEY (Encomenda_Numero) REFERENCES Stocks_Encomenda(Numero)
);