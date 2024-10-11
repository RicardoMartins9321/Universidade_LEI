GO

--- Apaga as tabelas se já existirem
IF OBJECT_ID('RentCar_Aluguer', 'U') IS NOT NULL
	DROP TABLE RentCar_Aluguer;
IF OBJECT_ID('RentCar_Ligeiro', 'U') IS NOT NULL
	DROP TABLE RentCar_Ligeiro;
IF OBJECT_ID('RentCar_Pesado', 'U') IS NOT NULL
	DROP TABLE RentCar_Pesado;
IF OBJECT_ID('RentCar_Similaridade', 'U') IS NOT NULL
	DROP TABLE RentCar_Similaridade;
IF OBJECT_ID('RentCar_Cliente', 'U') IS NOT NULL
	DROP TABLE RentCar_Cliente;
IF OBJECT_ID('RentCar_Balcao', 'U') IS NOT NULL
	DROP TABLE RentCar_Balcao;
IF OBJECT_ID('RentCar_Veiculo', 'U') IS NOT NULL
	DROP TABLE RentCar_Veiculo;
IF OBJECT_ID('RentCar_Tipo_Veiculo', 'U') IS NOT NULL
	DROP TABLE RentCar_Tipo_Veiculo;


CREATE TABLE RentCar_Cliente(
    NIF INT NOT NULL PRIMARY KEY,
    Endereco VARCHAR(1000) NOT NULL,
    Nome VARCHAR(200) NOT NULL,
    Num_Carta INT NOT NULL
);

CREATE TABLE RentCar_Balcao(
    Numero INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(200) NOT NULL,
    Endereco VARCHAR(1000) NOT NULL
);

Create TABLE RentCar_Tipo_Veiculo(
    Codigo INT NOT NULL PRIMARY KEY,
    Designacao VARCHAR(200) NOT NULL,
    Ar_condicionado BIT NOT NULL
);

Create TABLE RentCar_Veiculo(
    Matricula VARCHAR(200) NOT NULL PRIMARY KEY,
    Codigo INT NOT NULL REFERENCES RentCar_Tipo_Veiculo(Codigo),
    Marca VARCHAR(200) NOT NULL,
    Ano INT NOT NULL
);

CREATE TABLE RentCar_Aluguer(
    Numero INT NOT NULL PRIMARY KEY,
    [Data] DATE NOT NULL,
    Duracao INT NOT NULL,
    Cliente_NIF INT NOT NULL REFERENCES RentCar_Cliente(NIF),
    Balcao_Numero INT NOT NULL REFERENCES RentCar_Balcao(Numero),
    Veiculo_matricula VARCHAR(200) NOT NULL REFERENCES RentCar_Veiculo(matricula)
);

CREATE TABLE RentCar_Ligeiro(
    TipoVeiculo_Codigo INT NOT NULL PRIMARY KEY REFERENCES RentCar_Tipo_Veiculo(Codigo),
    Num_Lugares INT NOT NULL,
    Portas INT NOT NULL,
    Combustivel VARCHAR(200) NOT NULL
);

CREATE TABLE RentCar_Pesado(
    TipoVeiculo_Codigo INT NOT NULL PRIMARY KEY REFERENCES RentCar_Tipo_Veiculo(Codigo),
    Peso INT NOT NULL,
    Passageiros INT NOT NULL
);

CREATE TABLE RentCar_Similaridade(
    Codigo INT NOT NULL PRIMARY KEY,
    TipoVeiculoCodigo1 INT NOT NULL REFERENCES RentCar_Tipo_Veiculo(Codigo),
    TipoVeiculoCodigo2 INT NOT NULL REFERENCES RentCar_Tipo_Veiculo(Codigo)
);
