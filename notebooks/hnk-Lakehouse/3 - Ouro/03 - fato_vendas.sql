-- Databricks notebook source
CREATE OR REPLACE TABLE adventure_works_ouro.fato_vendas_produtos
SELECT
  sales.*,
  header.SalesOrderNumber,
  header.CustomerID,
  header.OrderDate
FROM adventure_works_prata.sales_order_detail sales
JOIN adventure_works_prata.sales_order_header header
  ON sales.SalesOrderID = header.SalesOrderID