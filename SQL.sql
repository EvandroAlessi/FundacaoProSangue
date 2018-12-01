CREATE TABLE TipoSangue (
	IDTipoSangue INTEGER PRIMARY KEY,
	RH CHAR(1),
	ABO VARCHAR(2)
);

CREATE TABLE Imunohematologia (
	IDImunohematologia INTEGER PRIMARY KEY,
	Data DATETIME,
	TemCorpoIrregular VARCHAR(300),
	IDDoacao INTEGER,
	IDTipoSangue INTEGER,
	FOREIGN KEY(IDTipoSangue) REFERENCES TipoSangue (IDTipoSangue)
		ON UPDATE RESTRICT 
        ON DELETE RESTRICT
);

CREATE TABLE ColetaAmostra (
	IDColetaAmostra INTEGER PRIMARY KEY,
	Data DATETIME,
	IDTriagemSorologica INTEGER,
	IDImunohematologia INTEGER,
	IDConsulta INTEGER,
	FOREIGN KEY(IDImunohematologia) REFERENCES Imunohematologia (IDImunohematologia)
		ON UPDATE RESTRICT 
        ON DELETE RESTRICT
);

CREATE TABLE Medico (
	IDMedico INTEGER PRIMARY KEY,
	Registro VARCHAR(10),
	Nome VARCHAR(150)
);

CREATE TABLE TriagemSorologica (
	IDTriagemSorologica INTEGER PRIMARY KEY,
	AIDS TINYINT,
	Sifilis TINYINT,
	HepatiteB TINYINT,
	HepatiteC TINYINT,
	DoencaChagas TINYINT,
	HTLV TINYINT,
	Data DATETIME,
	IDDoacao INTEGER
);

CREATE TABLE TesteAnemia (
	IDTesteAnemia INTEGER PRIMARY KEY,
	Data DATETIME,
	NivelHemoglobina VARCHAR(150),
	IDDoador INTEGER
);

CREATE TABLE Entrevista (
	IDEntrevista INTEGER PRIMARY KEY,
	Data DATETIME,
	Apto TINYINT,
	IDTesteAnemia INTEGER,
	FOREIGN KEY(IDTesteAnemia) REFERENCES TesteAnemia (IDTesteAnemia)
		ON UPDATE RESTRICT 
        ON DELETE RESTRICT
);

CREATE TABLE SangueApto (
	IDSangueApto INTEGER PRIMARY KEY,
	DataVencimento DATETIME,
	IDDoacao INTEGER,
	IDTipoSangue INTEGER,
	FOREIGN KEY(IDTipoSangue) REFERENCES TipoSangue (IDTipoSangue)
		ON UPDATE RESTRICT 
        ON DELETE RESTRICT
);

CREATE TABLE Doador (
	IDDoador INTEGER PRIMARY KEY,
	Nome VARCHAR(150),
	Sexo CHAR(1),
	RG VARCHAR(20),
	NomeMae VARCHAR(150),
	NomePai VARCHAR(150),
	DataNascimento DATETIME,
	IDEndereco INTEGER
);

CREATE TABLE Endereco (
	IDEndereco INTEGER PRIMARY KEY,
	Numero INTEGER,
	Cidade VARCHAR(150),
	UF CHAR(2),
	Bairro VARCHAR(150),
	Rua VARCHAR(150),
    FOREIGN KEY(IDDoador) REFERENCES Doador (IDDoador)
		ON UPDATE CASCADE 
        ON DELETE CASCADE
);

CREATE TABLE Consulta (
	IDConsulta INTEGER PRIMARY KEY,
	Data DATETIME,
	Descricao VARCHAR(300),
	IDMedico INTEGER,
	IDDoador INTEGER,
	IDDoacao INTEGER,
	FOREIGN KEY(IDMedico) REFERENCES Medico (IDMedico)
		ON UPDATE RESTRICT 
        ON DELETE RESTRICT,
	FOREIGN KEY(IDDoador) REFERENCES Doador (IDDoador)
		ON UPDATE RESTRICT 
        ON DELETE RESTRICT
);

CREATE TABLE Doacao (
	IDDoacao INTEGER PRIMARY KEY,
	Data DATETIME,
	QtdSangue NUMERIC(5,2),
	IDEntrevista INTEGER,
	FOREIGN KEY(IDEntrevista) REFERENCES Entrevista (IDEntrevista)
		ON UPDATE RESTRICT 
        ON DELETE RESTRICT
);

ALTER TABLE Imunohematologia ADD FOREIGN KEY(IDDoacao) REFERENCES Doacao (IDDoacao);
ALTER TABLE ColetaAmostra ADD FOREIGN KEY(IDTriagemSorologica) REFERENCES TriagemSorologica (IDTriagemSorologica);
ALTER TABLE ColetaAmostra ADD FOREIGN KEY(IDConsulta) REFERENCES Consulta (IDConsulta);
ALTER TABLE TriagemSorologica ADD FOREIGN KEY(IDDoacao) REFERENCES Doacao (IDDoacao);
ALTER TABLE TesteAnemia ADD FOREIGN KEY(IDDoador) REFERENCES Doador (IDDoador);
ALTER TABLE SangueApto ADD FOREIGN KEY(IDDoacao) REFERENCES Doacao (IDDoacao);
ALTER TABLE Consulta ADD FOREIGN KEY(IDDoacao) REFERENCES Doacao (IDDoacao);

CREATE INDEX Index_DoadorNome ON Doador(Nome);
CREATE INDEX Index_DoadorRG ON Doador(RG);
CREATE INDEX Index_SangueAptoDataVencimento ON SangueApto(DataVencimento);
CREATE INDEX Index_EntrevistaApto ON Entrevista(Apto);
CREATE INDEX Index_TesteAnemiaData ON TesteAnemia(Data);
CREATE INDEX Index_EnderecoBairro ON Endereco(Bairro);
CREATE INDEX Index_EnderecoRua ON Endereco(Rua);
CREATE INDEX Index_TriagemSorologica ON TriagemSorologica(Data);
CREATE INDEX Index_MedicoRegistro ON Medico(Registro);
CREATE INDEX Index_ColetaAmostraData ON ColetaAmostra(Data);
CREATE INDEX Index_ImunohematologiaData ON Imunohematologia(Data);
CREATE INDEX Index_TipoSangueABO ON TipoSangue(ABO);