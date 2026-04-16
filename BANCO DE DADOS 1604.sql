select * from tabela_de_clientes;
/*VOLUME_DE_COMPRA*/
select * from itens_notas_fiscais;
/*QANTIDADE*/

/*Seleção das Tabelas  Desejadas*/
select TP.SABOR, NF.DATA_VENDA, INF.QUANTIDADE
from tabela_de_produtos as TP
inner join itens_notas_fiscais as INF
on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join notas_fiscais as NF
on NF.NUMERO = INF.NUMERO;

#SELEÇÃO DAS COLUNAS DE INTERESSE
select NF.CPF,TC.NOME,
SUM (TC.VOLUME_DE_COMPRA) AS VOLUME_COMPRA,
date_format(NF.DATA_VENDA, '%Y-%M') AS DATA_VENDA,
SUM(INF.QUANTIDADE) AS QUANTIDADE
from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes AS TC
ON TC.CPF = NF.CPF
GROUP BY NF.CPF,QUANTIDADE, DATA_VENDA;

/*oBTER O VOLUME DE COMPRAS DA TABELA DE CLIENTES*/
select*from tabela_de_clientes;

select TC.CPF,TC.nome, TC.VOLUME_DE_COMPRA as QNTD_LIMITE
FROM tabela_de_clientes AS TC;

SELECT NOME FROM tabela_de_clientes;