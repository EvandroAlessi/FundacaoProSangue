INSERT INTO TipoSangue
     (IDTipoSangue,ABO,RH)
     VALUES
     (DEFAULT,"A","+"),
     (DEFAULT,"A","-"),
     (DEFAULT,"B","+"),
     (DEFAULT,"B","-"),
     (DEFAULT,"AB","+"),
     (DEFAULT,"AB","-"),
     (DEFAULT,"O","+"),
     (DEFAULT,"O","-");


INSERT INTO Doador
     (IDDoador,Nome,Sexo,RG,NomeMae,NomePai,DataNascimento)
     VALUES 
     (DEFAULT,"Joao da Silva","9999999","M","Maria da Silva","Pedro Silva","1998-12-01"),
     (DEFAULT,"Pericles Pinto","992399","M","Isadora Pinto","Roberto Souza","1992-11-01"),
     (DEFAULT,"Ana Maria","9992139","F","Tatiana Souza","Pedro Oliveira","1998-10-01"),
     (DEFAULT,"Florisbela Pereira","9991119","F","Marcia da Silva","Pedro Silva","1998-09-01"),
     (DEFAULT,"Jose Flavio","9999991","M","Laura Santos","Joao Silva","1998-08-01"),
     (DEFAULT,"Marcos Santos","9999999","M","Maria Jose","Joao Santos","1998-07-01");

INSERT INTO Endereco
     (IDEndereco,Numero,Cidade,UF,Bairro,Rua,IDDoador)
     VALUES
     (DEFAULT,"333","Ponta Grossa","PR","Centro","Vicente Machado","1"),
     (DEFAULT,"11","Ponta Grossa","PR","Centro","Vicente Machado","2"),
     (DEFAULT,"123","Ponta Grossa","PR","Centro","Vicente Machado","3"),
     (DEFAULT,"43","Ponta Grossa","PR","Centro","Vicente Machado","4"),
     (DEFAULT,"3233","Ponta Grossa","PR","Centro","Vicente Machado","5"),
     (DEFAULT,"377","Ponta Grossa","PR","Centro","Vicente Machado","6");

INSERT INTO TesteAnemia
     (IDTesteAnemia,Data,NivelHemoglobina,IDDoador)
     VALUES
     (DEFAULT,"2018-09-11","1000","1"),
     (DEFAULT,"2018-08-11","100","2"),
     (DEFAULT,"2018-07-11","1000","3"),
     (DEFAULT,"2018-06-11","100","4"),
     (DEFAULT,"2018-05-11","1000","5"),
     (DEFAULT,"2018-04-11","1000","6");

INSERT INTO Entrevista
     (IDEntrevista,Data,Apto,IDTesteAnemia)
     VALUES
     (DEFAULT,"2018-09-12","1","1"),
     (DEFAULT,"2018-07-12","1","3"),
     (DEFAULT,"2018-05-12","0","5"),
     (DEFAULT,"2018-04-12","1","6");

INSERT INTO Doacao
     (IDDoacao,Data,QtdSangue,IDEntrevista)
     VALUES
     (DEFAULT,"2018-09-12","450","1"),
     (DEFAULT,"2018-07-12","450","2"),
     (DEFAULT,"2018-04-12","450","4");

INSERT INTO TriagemSorologica
     (IDTriagemSorologica,AIDS,Sifilis,HepatiteB,HepatiteC,DoencaChagas,HTLV,Data,IDDoacao)
     VALUES
     (DEFAULT,"0","0","0","0","0","0","2018-09-15","1"),
     (DEFAULT,"1","0","0","0","0","0","2018-07-15","2"),
     (DEFAULT,"0","0","0","0","0","0","2018-04-15","3");

INSERT INTO Imunohematologia
     (IDImunohematologia,Data,TemCorpoIrregular,IDDoacao,IDTipoSangue)
     VALUES
     (DEFAULT,"2018-09-15",NULL,"1","1"),
     (DEFAULT,"2018-07-15","Cancer no pau","2","3"),
     (DEFAULT,"2018-04-15",NULL,"3","4");

