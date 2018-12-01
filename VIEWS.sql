CREATE VIEW FUNCIONARIO (Funcionario, CPF, Salario, Tipo)
As
SELECT NOME, CPF, SALARIO, 'Guarda' as Funcao
FROM GUARDA
UNION
SELECT NOME, CPF, SALARIO, 'Restaurador' as FUncao
FROM RESTAURADOR
ORDER BY 4 ASC, 1 DESC;

-- Exemplo acima
-- Proj abaixo

CREATE VIEW DOACOES (Nome, ABO, RH, Ultima_Doacao)
As
SELECT d.NOME, ts.ABO, ts.RH, dc.Data
FROM Doador d, TesteAnemia ta, Entrevista e, Doacao dc, Imunohematologia i, TipoSangue ts,
WHERE ta.IDDoador = d.IDDoador AND e.IDTesteAnemia = ta.IDTesteAnemia AND dc.IDEntrevista = e.IDEntrevista AND i.IDDoacao = dc.IDDoacao
     AND ts.IDTipoSangue = i.IDTipoSangue,
GROUP BY ts.ABO, ts.RH, d.NOME, d.Data DESC;  


CREATE VIEW CARTEIRINHA (Nome, Data_Doacao, ABO, RH, AntiCorpo_Irregular, HepatiteB, HepatiteC, Chagas, Sifilis, AIDS, HTLV)
As
SELECT d.NOME, dc.Data, ts.ABO, ts.RH, i.TemCorpoIrregular, t.HepatiteB, t.HepatiteC, t.DoencaChagas, t.Sifilis, t.AIDS, t.HTLV,
FROM Doador d, TesteAnemia ta, Entrevista e, Doacao dc, Imunohematologia i, TipoSangue ts, TriagemSorologica t,
WHERE ta.IDDoador = d.IDDoador AND e.IDTesteAnemia = ta.IDTesteAnemia AND dc.IDEntrevista = e.IDEntrevista AND i.IDDoacao = dc.IDDoacao
     AND ts.IDTipoSangue = i.IDTipoSangue AND t.IDDoacao = dc.IDDoacao,
GROUP BY ts.ABO, ts.RH, d.NOME, d.Data DESC;  

/*Os testes descritos são realizados a cada doação, e os resultados serão impressos na Carteirinha do Doador.
Caso haja alguma alteração no resultado, o doador será comunicado (a) e talvez seja necessário repetir os exames.*/