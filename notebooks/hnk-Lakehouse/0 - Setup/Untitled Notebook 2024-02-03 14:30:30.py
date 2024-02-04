# Databricks notebook source
# MAGIC %md
# MAGIC ## Fazer a conexão com o ADLS
# MAGIC #
# MAGIC - Criar um Registro de App do Databricks;
# MAGIC - Dar permissão para esse registro como Blod Data Contributor;
# MAGIC - Criar um certificado, copiar essa e outras informações para as variáveis;
# MAGIC - Armazenar os segredos com o Key Vault e Databricks Secrets Scopes.

# COMMAND ----------

#storage_account_name = "uptodatalake"
#client_id            = dbutils.secrets.get(scope="databricks-adls-scrope", key="databricks-app-client-id")
#tenant_id            = dbutils.secrets.get(scope="databricks-adls-scrope", key="databricks-app-tenant-id")
#client_secret        = dbutils.secrets.get(scope="databricks-adls-scrope", key="databricks-app-client-se")

# COMMAND ----------

storage_account_name = "stghnklcf" # Nome do meu Storage account do Azure
client_id            = "10b91187-6419-443f-8797-f74c55d2e3fb" # Obtidos no aplicativo criado no App Register (Application (client) ID)
tenant_id            = "450a2b68-6e6f-48c1-a6c7-d5ab26a6cdf5" # Obtidos no aplicativo criado no App Register (Directory (tenant) ID)
client_secret        = "djQ8Q~s.hP.1ezxUMzvNB_OpUL3bqqy0-mBcDc-9" # Obtidos no aplicativo criado no App Register

# Para gerar o client_secret, é necessário ir em Certificates & Secrets, em Client secrets, criar um novo segredo.
# cd5795c3-6aac-4b8d-b25d-f1343814d952

# COMMAND ----------

configs = {"fs.azure.account.auth.type": "OAuth",
       "fs.azure.account.oauth.provider.type": "org.apache.hadoop.fs.azurebfs.oauth2.ClientCredsTokenProvider",
       "fs.azure.account.oauth2.client.id": f"{client_id}",
       "fs.azure.account.oauth2.client.secret": f"{client_secret}",
       "fs.azure.account.oauth2.client.endpoint": f"https://login.microsoftonline.com/{tenant_id}/oauth2/token"}

# COMMAND ----------

def mount_adls(container_name):
    dbutils.fs.mount(
        source = f"abfss://{container_name}@{storage_account_name}.dfs.core.windows.net/",
        mount_point = f"/mnt/{storage_account_name}/{container_name}",
        extra_configs = configs)

# COMMAND ----------

mount_adls("landing-zone")

# COMMAND ----------

mount_adls("bronze")

# COMMAND ----------

mount_adls("prata")

# COMMAND ----------

mount_adls("ouro")

# COMMAND ----------

# MAGIC %md
# MAGIC #### Os comandos abaixo listam os conteúdos do diretório 'mnt/stghnklcf'

# COMMAND ----------

# MAGIC %fs
# MAGIC
# MAGIC ls 'mnt/stghnklcf'

# COMMAND ----------

# MAGIC %fs
# MAGIC
# MAGIC ls 'mnt/stghnklcf/landing-zone/'

# COMMAND ----------

# MAGIC %fs
# MAGIC
# MAGIC ls 'mnt/stghnklcf/landing-zone/AdventureWorksLT/'