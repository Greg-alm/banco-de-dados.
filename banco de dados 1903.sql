use sucos_vendas;

select * from cadastrocliente where nome = 'Gael do Reis Moraes';

select * from tabela_de_produtos where sabor = 'Manga' and tamanho = '3 ml';

select * from tabela_de_produtos where sabor = 'Manga' and not (tamanho = '470 ml');
select * from tabela_de_produtos where sabor = 'Manga' or not (tamanho = '470 ml');
select * from tabela_de_produtos where sabor in ('Manga', 'Laranja');

select * from tabela_de_clientes where cidade in ('Rio de Janeiro', 'São Paulo') and idade >= 20;

#USO DA CONDIÇÃO DISTINCT

select embalagem, tamanho from tabela_de_produtos;

select distinct embalagem, tamanho from tabela_de_produtos;

select distinct embalagem, tamanho, sabor from tabela_de_produtos where sabor = 'Laranja';

-- obtenha as 10 primeiras vendas 
-- do dia 01/01/2017

SELECT * FROM tabela_de_vendas 
WHERE data_venda = '2017-01-01' 
LIMIT 10;

-- ultilizando order by

SELECT * from tabela_de_produtos order by sabor, embalagem;
select * from tabela_de_produtos order by  preço_de_lista, embalagem; 

-- Quais foram as maiores vendas ?
-- do produto "linha refrescante" - 1 litro - morango/limão em quantidade e preço ?

select * from tabela_de_produtos where NOME_DO_PRODUTO = 'linha refrescante - 1 litro - morango/limão';

select * from itens_notas_fiscais
where CODIGO_DO_PRODUTO = '1101035'
order by quantidade desc, preço;

-- Agrupando os resultados (group by) 
select ESTADO, sum(limite_de_credito) as limite_total
from tabela_de_clientes group by ESTADO;

select EMBALAGEM, max(PRECO_DE_LISTA) as contador
from tabela_de_produtos group by EMBALAGEM;

/* Quantos itens de venda existempara o produto '1101035'*/


select max(QUANTIDADE) as siricutico from itens_notas_fiscais
where CODIGO_DO_PRODUTO = '1101035';

select count(*) from itens_notas_fiscais where CODIGO_DO_PRODUTO = '1101035' and quantidade =99;


/*CLASSIFICAR PRODUTOS*/ 
select NOME_DO_PRODUTO, PRECO_DE_LISTA,
CASE
 WHEN PRECO_DE_LISTA >= 14 THEN "PRODUTO CARO"
 WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA <14 THEN "PRODUTO EM CONTA"
ELSE "PRODUTO BARATO"
END AS STATUS_PRECO FROM TABELA_DE_PRODUTOS
ORDER BY PRECO_DE_LISTA;




