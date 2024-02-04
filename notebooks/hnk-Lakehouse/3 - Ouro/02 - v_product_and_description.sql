-- Databricks notebook source
CREATE OR REPLACE VIEW ADVENTURE_WORKS_OURO.V_PRODUCT_AND_DESCRIPTION AS
SELECT 
  PD.ProductID,
  PD.Name AS Name,
  PDM.Name AS ProductModel,
  PMPD.ProductModelID,
  PMPD.Culture,
  PDD.ProductDescriptionID,
  PDD.Description
FROM adventure_works_prata.product PD
JOIN adventure_works_prata.product_model PDM ON PD.ProductModelID = PDM.ProductModelID
JOIN adventure_works_prata.product_model_product_description PMPD ON PD.ProductModelID = PMPD.ProductModelID
JOIN adventure_works_prata.product_description PDD ON PMPD.ProductDescriptionID = PDD.ProductDescriptionID
ORDER BY 1

-- COMMAND ----------

SELECT * FROM ADVENTURE_WORKS_OURO.V_PRODUCT_AND_DESCRIPTION;

-- COMMAND ----------

