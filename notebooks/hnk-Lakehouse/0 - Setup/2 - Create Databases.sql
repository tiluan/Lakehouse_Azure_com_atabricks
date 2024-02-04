-- Databricks notebook source
CREATE DATABASE IF NOT EXISTS bronze
LOCATION '/mnt/stghnklcf/bronze'

-- COMMAND ----------

CREATE DATABASE IF NOT EXISTS prata
LOCATION '/mnt/stghnklcf/prata/raw'

-- COMMAND ----------

CREATE DATABASE IF NOT EXISTS ouro
LOCATION '/mnt/stghnklcf/ouro/raw'

-- COMMAND ----------

-- DROP DATABASE bronze CASCADE