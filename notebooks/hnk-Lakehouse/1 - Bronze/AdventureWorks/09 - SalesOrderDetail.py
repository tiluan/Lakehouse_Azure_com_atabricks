# Databricks notebook source
# MAGIC %md
# MAGIC
# MAGIC ### Ler arquivos Parquet do ADLS

# COMMAND ----------

# Define o nome da tabela que será lida do arquivo Parquet
table = 'SalesOrderDetail'

# Define o nome do banco de dados onde a tabela está localizada
database_name = 'adventure_works_bronze'

# Define o caminho da pasta onde o arquivo Parquet está localizado
folder_path = "mnt/stghnklcf/landing-zone/AdventureWorksLT/"

# COMMAND ----------

# Constroi o caminho completo do arquivo Parquet
full_path = f"/{folder_path}/{table}.parquet"

# Lê o arquivo Parquet usando Spark DataFrame, com o caminho completo especificado
df = spark.read.parquet(full_path)

# Exibe os dados do DataFrame
df.display()

# COMMAND ----------

# Escreve o DataFrame no formato Delta, substituindo a tabela existente, incluindo a opção de sobrescrever o esquema, e salvando como uma tabela no Spark

df.write.format("delta") \
    .mode("overwrite") \
    .option("overwriteSchema", True) \
    .saveAsTable(f"{database_name}.{table}")