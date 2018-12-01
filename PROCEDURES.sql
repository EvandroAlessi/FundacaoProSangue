
-- DOADOR

call SP_INSERTDOADOR('4', 'm', '2', '1', '1', '2018-12-01', 1,'4', 'PR', 'vila', 'manoel');

drop procedure SP_INSERTDOADOR;
DELIMITER &&
CREATE PROCEDURE SP_INSERTDOADOR
(IN pNome VARCHAR(150), pSexo CHAR(1), pRG VARCHAR(20), pNomeMae VARCHAR(150), pNomePai VARCHAR(150), pDataNascimento DATETIME, pNumero INTEGER, pCidade  VARCHAR(150), pUF  CHAR(2), pBairro  VARCHAR(150), pRua  VARCHAR(150))
BEGIN
	IF (NOT EXISTS(SELECT IDDoador 
			FROM Doador 
			WHERE RG = pRG)) THEN
	BEGIN
    
		INSERT INTO Doador (Nome, Sexo, RG, NomeMae, NomePai, DataNascimento)
			VALUES (pNome, pSexo, pRG, pNomeMae, pNomePai, pDataNascimento);
		
		INSERT INTO Endereco(Numero, Cidade, UF, Bairro, Rua, IDDoador)
			VALUES (pNumero, pCidade, pUF, pBairro, pRua, LAST_INSERT_ID());
  
	END;
    END IF;
END&&
DELIMITER ;

DELIMITER &&
CREATE PROCEDURE SP_ALTERDOADOR
(IN pNome VARCHAR(150), pSexo CHAR(1), pRG VARCHAR(20), pNomeMae VARCHAR(150), pNomePai VARCHAR(150), pDataNascimento DATETIME)
BEGIN
	IF (EXISTS(SELECT IDDoador 
			FROM Doador 
			WHERE IDDoador = pIDDoador)) THEN
	BEGIN
			UPDATE Endereco 
				SET  Nome = pNome, Sexo = pSexo, RG = pRG, NomeMae = pNomeMae, NomePai = pNomePai, DataNascimento = pDataNascimento
				WHERE IDDoador = pIDDoador;
	END;
	END IF;
END&&
DELIMITER ;
select * FROM DOADOR;


-- ENDERECO
call SP_ALTERENDERECO(1, 1,'4', 'PR', 'vila', 'manoel');

DELIMITER &&
CREATE PROCEDURE SP_ALTERENDERECO
(IN pIDEndereco INTEGER, pNumero INTEGER, pCidade  VARCHAR(150), pUF  CHAR(2), pBairro  VARCHAR(150), pRua  VARCHAR(150), pIDDoador INTEGER)
BEGIN
	IF (EXISTS(SELECT IDENDERCO 
			FROM ENDERECO 
			WHERE IDEndereco = pIDEndereco and IDDoador = pIDDoador)) THEN
	BEGIN
		UPDATE Endereco 
			SET  Numero = pNumero, Cidade = pCidade, UF = pUF, Bairro = pBairro, Rua = pRua, IDDoador = pIDDoador
            WHERE IDEndereco = pIDEndereco;
	END;
	END IF;
END&&
DELIMITER ;


select * FROM ENDERECO;

-- MEDICO
call SP_INSERTMEDICO('Evandro', '12135');

DELIMITER &&
CREATE PROCEDURE SP_INSERTMEDICO
(IN pNome VARCHAR(150), pRegistro VARCHAR(10))
BEGIN
	IF (NOT EXISTS(SELECT IDMedico
			FROM Medico 
			WHERE Registro = pRegistro)) THEN
	BEGIN
		INSERT INTO Medico (Nome, Registro)
			VALUES (pNome, pRegistro);
	END;
    END IF;
END&&
DELIMITER ;

call SP_INSERTMEDICO(1, 'Evandro', '12135');

DELIMITER &&
CREATE PROCEDURE SP_ALTERMEDICO
(IN pIDMedico INTEGER, pNome VARCHAR(150), pRegistro VARCHAR(10))
BEGIN
	IF (EXISTS(SELECT IDMedico
			FROM Medico
			WHERE IDMedico = pIDMedico and Registro = pRegistro)) THEN
	BEGIN
		UPDATE Medico 
			SET  Nome = pNome, Registro = pRegistro
            WHERE IDMedico = pIDMedico;
	END;
	END IF;
END&&
DELIMITER ;
select * FROM MEDICO;

-- TESTEANEMIA
DELIMITER &&
CREATE PROCEDURE SP_INSERTTESTEANEMIA
(IN pData datetime, pNivelHemoglobina VARCHAR(150), pIDDoador INTEGER)
BEGIN
	IF (pIDDoador <> NULL
    AND EXISTS(SELECT IDDoador
		FROM Doador
        WHERE IDDoador = pIDDoador)) THEN
	BEGIN
		INSERT INTO TesteAnemia(Data, NivelHemoglobina, IDDoador)
			VALUES (pData, pNivelHemoglobina, pIDDoador);
	END;
    END IF;
END&&
DELIMITER ;

DELIMITER &&
CREATE PROCEDURE SP_ALTERMEDICO
(IN pIDTesteAnemia INTEGER, pData datetime, pNivelHemoglobina VARCHAR(150), pIDDoador INTEGER)
BEGIN
	IF (EXISTS(SELECT IDTesteAnemia
			FROM TesteAnemia
			WHERE pIDTesteAnemia = pIDTesteAnemia)) THEN
	BEGIN
		UPDATE TesteAnemia 
			SET  Data = pData, NivelHemoglobina = pNivelHemoglobina
            WHERE IDTesteAnemia = pIDTesteAnemia;
	END;
	END IF;
END&&
DELIMITER ;

-- ENTREVISTA
DELIMITER &&
CREATE PROCEDURE SP_INSERTENTREVISTA
(IN pData datetime, pApto TINYINT, pIDTesteAnemia INTEGER)
BEGIN
	IF (pIDDoador <> NULL
    AND EXISTS(SELECT IDTesteAnemia
		FROM TesteAnemia
        WHERE IDTesteAnemia = pIDTesteAnemia)) THEN
	BEGIN
		INSERT INTO Entrevista(Data, NivelHemoglobina, IDTesteAnemia)
			VALUES (pData, pApto, pIDTesteAnemia);
	END;
    END IF;
END&&
DELIMITER ;

DELIMITER &&
CREATE PROCEDURE SP_ALTERENTREVISTA
(IN pIDEntrevista INTEGER, pData datetime, pApto TINYINT, pIDTesteAnemia INTEGER)
BEGIN
	IF (EXISTS(SELECT IDTesteAnemia
			FROM TesteAnemia
			WHERE pIDTesteAnemia = pIDTesteAnemia)) THEN
	BEGIN
		UPDATE Entrevista 
			SET  Data = pData, Apto = pApto, IDTesteAnemia = pIDTesteAnemia
            WHERE IDEntrevista = pIDEntrevista;
	END;
	END IF;
END&&
DELIMITER ;

-- DOACAO
DELIMITER &&
CREATE PROCEDURE SP_INSERTDOACAO
(IN pData datetime, pQtdSangue numeric, pIDEntrevista INTEGER)
BEGIN
	IF (pIDEntrevista <> NULL
    AND EXISTS(SELECT IDEntrevista
		FROM Entrevista
        WHERE IDEntrevista = pIDEntrevista)) THEN
	BEGIN
		INSERT INTO Doacao(Data, QtdSangue, IDEntrevista)
			VALUES (pData, pQtdSangue, pIDEntrevista);
	END;
    END IF;
END&&
DELIMITER ;

DELIMITER &&
CREATE PROCEDURE SP_ALTERDOACAO
(IN pIDEntrevista INTEGER, pData datetime, pQtdSangue numeric, pIDEntrevista INTEGER)
BEGIN
	IF (EXISTS(SELECT IDEntrevista
			FROM Entrevista
			WHERE IDEntrevista = pIDEntrevista)) THEN
	BEGIN
		UPDATE Doacao 
			SET  Data = pData, QtdSangue = pQtdSangue, IDEntrevista = pIDEntrevista
            WHERE IDEntrevista = pIDEntrevista;
	END;
	END IF;
END&&
DELIMITER ;