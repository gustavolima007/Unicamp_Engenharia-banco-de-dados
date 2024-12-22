/* Prova - Consultas do banco */

use ecommerce; 

/* Prova - Consulta Relatório de Vendas por Cliente */
SELECT C.NOME AS CLIENTE,
       COUNT(PC.ID) AS TOTAL_PEDIDOS,
       SUM(PC.TOTAL) AS TOTAL_VENDAS
  FROM PEDIDO_CLIENTE PC
 INNER JOIN CADASTRO_CLIENTE C
    ON PC.CLIENTE_ID = C.ID
 GROUP BY PC.CLIENTE_ID,
          C.NOME
 ORDER BY TOTAL_VENDAS DESC;
 
 /* Prova - Consulta Relatório desempenho do fornecedor */
SELECT F.NOME AS FORNECEDOR,
       COUNT(PC.ID) AS TOTAL_PEDIDOS,
       SUM(PC.TOTAL) AS TOTAL_COMPRAS,
       AVG(PC.TOTAL) AS MEDIA_COMPRA,
       MIN(PC.TOTAL) AS MENOR_COMPRA,
       MAX(PC.TOTAL) AS MAIOR_COMPRA,
       AVG(DATEDIFF(NOW(), PC.DATA_COMPRA)) AS TEMPO_MEDIO_ENTREGA
  FROM PEDIDO_COMPRA PC
 INNER JOIN CADASTRO_FORNECEDOR F
    ON PC.FORNECEDOR_ID = F.ID
 GROUP BY PC.FORNECEDOR_ID,
          F.NOME
 ORDER BY TOTAL_COMPRAS DESC;


/* Prova - Consulta Relatório de Estoque de Produtos */
SELECT NOME AS PRODUTO,
       DESCRICAO AS DESCRICAO_PRODUTO,
       PRECO AS PRECO_UNITARIO,
       ESTOQUE AS QUANTIDADE_ESTOQUE
  FROM CADASTRO_PRODUTO
 WHERE ESTOQUE > 0;

