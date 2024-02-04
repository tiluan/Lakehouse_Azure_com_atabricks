-- Databricks notebook source
-- MAGIC %md
-- MAGIC
-- MAGIC ### Databases Bronze, Prata e Ouro da fonte AdventureWorks

-- COMMAND ----------

--DROP DATABASE bronze CASCADE
CREATE DATABASE IF NOT EXISTS adventure_works_bronze
LOCATION '/mnt/stghnklcf/adventure_works_bronze'

-- COMMAND ----------

-- DROP DATABASE adventure_works_prata CASCADE
CREATE DATABASE IF NOT EXISTS adventure_works_prata
LOCATION '/mnt/stghnklcf/prata/adventure_works_prata'

-- COMMAND ----------

-- DROP DATABASE adventure_works_ouro CASCADE
CREATE DATABASE IF NOT EXISTS adventure_works_ouro
LOCATION '/mnt/stghnklcf/ouro/adventure_works_ouro'