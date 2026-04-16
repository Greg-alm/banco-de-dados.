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
select NF.CPF,
date_format(NF.DATA_VENDA, '%Y-%M') AS DATA_VENDA,
SUM(INF.QUANTIDADE) AS QUANTIDADE
from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, DATA_VENDA;
