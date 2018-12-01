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