-- Drop tables if they already exist to avoid conflicts
IF OBJECT_ID('Prescricao_Prescricao', 'U') IS NOT NULL 
	DROP TABLE Prescricao_Prescricao;
IF OBJECT_ID('Prescricao_Farmaco', 'U') IS NOT NULL 
	DROP TABLE Prescricao_Farmaco;
IF OBJECT_ID('Prescricao_Farmaceutica', 'U') IS NOT NULL 
	DROP TABLE Prescricao_Farmaceutica;
IF OBJECT_ID('Prescricao_Farmacia', 'U') IS NOT NULL 
	DROP TABLE Prescricao_Farmacia;
IF OBJECT_ID('Prescricao_Medico', 'U') IS NOT NULL 
	DROP TABLE Prescricao_Medico;
IF OBJECT_ID('Prescricao_Paciente', 'U') IS NOT NULL 
	DROP TABLE Prescricao_Paciente;

-- Create the table for Paciente
CREATE TABLE Prescricao_Paciente (
    Num_de_Utente INT PRIMARY KEY,
    Nome VARCHAR(250) NOT NULL,
    Endereco VARCHAR(250) NOT NULL,
    Data_de_Nascimento DATE NOT NULL
);

-- Create the table for Medico
CREATE TABLE Prescricao_Medico (
    ID_de_SNS INT PRIMARY KEY,
    Nome VARCHAR(250) NOT NULL,
    Especialidade VARCHAR(250) NOT NULL
);

-- Create the table for Farmacia
CREATE TABLE Prescricao_Farmacia (
    NIF INT PRIMARY KEY,
    Morada VARCHAR(250) NOT NULL,
    Telefone VARCHAR(25) NOT NULL,
    Nome VARCHAR(250) NOT NULL
);

-- Create the table for Farmaceutica
CREATE TABLE Prescricao_Farmaceutica (
    NRN INT PRIMARY KEY,
    Nome VARCHAR(250) NOT NULL,
    Morada VARCHAR(250) NOT NULL,
    Telefone VARCHAR(25) NOT NULL
);

-- Create the table for Farmaco
CREATE TABLE Prescricao_Farmaco (
    Nome_Comercial VARCHAR(250) PRIMARY KEY,
    Farmaceutica INT NOT NULL,
    Formula TEXT NOT NULL,

    FOREIGN KEY (Farmaceutica) REFERENCES Prescricao_Farmaceutica(NRN)
);

-- Create the table for Prescricao
CREATE TABLE Prescricao_Prescricao (
    NUP INT PRIMARY KEY,
    Data DATE NOT NULL,
    Farmaco VARCHAR(250) NOT NULL,
    Medico INT NOT NULL,
    Paciente INT NOT NULL,

    FOREIGN KEY (Farmaco) REFERENCES Prescricao_Farmaco(Nome_Comercial),
    FOREIGN KEY (Medico) REFERENCES Prescricao_Medico(ID_de_SNS),
    FOREIGN KEY (Paciente) REFERENCES Prescricao_Paciente(Num_de_Utente)
);
