-- Databricks notebook source
CREATE DATABASE bronze
LOCATION '/mnt/stghnklcf/bronze/raw'

-- COMMAND ----------

CREATE DATABASE prata
LOCATION '/mnt/stghnklcf/prata/raw'

-- COMMAND ----------

CREATE DATABASE ouro
LOCATION '/mnt/stghnklcf/ouro/raw'