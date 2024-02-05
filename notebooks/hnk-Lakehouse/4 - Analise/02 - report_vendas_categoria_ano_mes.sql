-- Databricks notebook source
CREATE OR REPLACE TABLE adventure_works_ouro.report_vendas_categoria_ano_mes AS

SELECT 
  year(fato.OrderDate) AS Ano,
  month(fato.OrderDate) as Mes,
  cat.Name as Category_name,
  SUM(fato.LineTotal) AS total_faturamento,
  SUM(fato.OrderQty) AS quantidade_produtos,
  (SUM(fato.LineTotal) / SUM(fato.OrderQty)) AS ticket_medio
FROM adventure_works_ouro.fato_vendas_produtos fato
JOIN adventure_works_prata.product product on fato.ProductID = fato.ProductID
JOIN adventure_works_prata.product_category cat on product.ProductCategoryID = cat.ProductCategoryID
GROUP BY year(fato.OrderDate), month(fato.OrderDate), cat.Name
ORDER BY SUM(fato.LineTotal) DESC