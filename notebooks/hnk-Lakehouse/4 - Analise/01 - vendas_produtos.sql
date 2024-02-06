-- Databricks notebook source
SELECT * FROM adventure_works_ouro.fato_vendas_produtos

-- COMMAND ----------

SELECT 
  ProductID,
  SUM(LineTotal)
FROM adventure_works_ouro.fato_vendas_produtos
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC

-- COMMAND ----------

SELECT 
  ProductID,
  SUM(LineTotal),
  SUM(OrderQty)
FROM adventure_works_ouro.fato_vendas_produtos
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC

-- COMMAND ----------

SELECT 
  ProductID,
  SUM(LineTotal),
  SUM(OrderQty),
  (SUM(LineTotal) / SUM(OrderQty)) AS ticket_medio
FROM adventure_works_ouro.fato_vendas_produtos
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC