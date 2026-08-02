# PG_Technical_Assestment
P&amp;G I Business Intelligence Specialist I Technical Assessment I Gimaris Bouras Martinez (C001537801)

1. Why would you use Azure Storage to store the original files?
Azure Blob Storage acts as the landing layer for our raw data. It is designed to store very large amounts of data at a low cost and it integrates well with other Azure resources such as Data Factory, and SQL Database. Another advantage is the security it provides for the data using Microsoft Entra ID or other role-based access controls.

2.  What is the difference between Azure Blob Storage and Azure Data Lake Storage Gen2?
The main difference between the two is that Azure Data Lake Storage Gen2 adds features specifically for big data analytics and engineering. It is optimized for Spark, Databricks and Machine Learning.
For the purpose of this assestment, Blob storage was the appropriate choice to store the raw CSV files as it integrates seamlessly with Azure Data Factory and Azure SQL Database. If the project later evolved into a large-scale analytics platform that needs tools like Databricks or Synapse, Azure Data Lake Storage Gen2 would be a more appropriate choice.


3. What is a Linked Service in Azure Data Factory?
It's a definition that tells Data Factory how to connect to an external data source or destination. For this project, two Linked Services were created:
- Azure Blob Storage (Connects Data Factory to the storage account where the Kaggle CSV files are stored)
- Azure SQL Database (Connects Data Factory to the SQL Database where the data is loaded)

4. What is a Dataset in Azure Data Factory?
It represents the specific data that a pipeline reads from or writes to a different source/destination using a Linked Service. In this proejct, I created datasets for each Kaggle CSV file that was stored in Azure Blob Storage. I also created corresponding datasets for the destination tables in Azure SQL Database. These datasets were then used by the pipeline to copy data from the source files into the SQL tables.

5. What is the difference between a pipeline and an activity in Azure Data Factory?
A pipeline is the entire workflow that coordinates the movement and transformation of data in ADF. An activity is one individual task within that workflow, say Move and Transform, Synapse, Machine Learning and others. In this project I created a pipeline that moved the data from Azure Blob Storage to SQL Database. Within that pipeline I used 3 Copy Data acitivities, each was responsible for loading one CSV file into its corresponding SQL tabe.
  
6. How would you protect Azure SQL Database credentials?
The best way to protect Azure SQL Database credentials is to avoid storing usernames and passwords directly in code or Azure Data Factory pipelines. In a production environment, Azure Key Vault is typically used to securely store credentials, and Azure Data Factory can retrieve them at runtime using a Managed Identity. This keeps sensitive information secure and makes it easier to update credentials without changing the pipeline.
For this project, I used Managed Identity to connect Azure Data Factory to Azure SQL Database. This allowed Azure Data Factory to authenticate securely without embedding SQL credentials in the pipeline. In addition, access to the database can be further protected by using Azure SQL firewall rules, Microsoft Entra ID authentication, and the principle of least privilege to ensure users and services only have the permissions they need.

7. What is Managed Identity?
It's a feature that allows an Azure service to authenticate to other Azure services without storing usernames or passwords. Instead of using credentials, Azure automatically creates and manages a secure identity for the service.
   
8. How would you monitor a failed execution in Azure Data Factory?
Azure Data Factory provides a Monitor hub where you can track pipeline runs, activity runs, and trigger executions. If a pipeline fails, I would go to the Monitor section to identify which activity failed, review the error message and execution details, and determine the root cause. Common issues include connection problems, missing files, permission errors, or schema mismatches. After fixing the issue, I can rerun the failed pipeline or activity. During my project, this would allow me to quickly identify if a specific file, such as the orders dataset, failed to load into Azure SQL Database while the other activities completed successfully.

9. What would you do if this process had to run every day?
If this process had to run every day, I would automate it by creating a scheduled trigger in Azure Data Factory. The trigger would run the pipeline at a specified time each day, automatically loading any new CSV files from Azure Blob Storage into Azure SQL Database. I would also use the Monitor hub to track pipeline executions and configure alerts to notify me if a pipeline failed, ensuring that any issues could be resolved quickly without manual intervention.


10. How would you avoid reprocessing files that have already been loaded?
To avoid reprocessing files that have already been loaded, I would implement a mechanism to track which files have been processed. For example, I could move processed files to an archive folder in Azure Blob Storage after they are successfully loaded, or maintain a log table in Azure SQL Database with the file name and processing date. Before running the pipeline, Azure Data Factory could check whether the file has already been processed and skip it if it has.
