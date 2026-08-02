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

6. What is the difference between a pipeline and an activity in Azure Data Factory?
A pipeline is the entire workflow and an activity is one individual task within that workflow
  
7. How would you protect Azure SQL Database credentials?
9. What is Managed Identity?
10. How would you monitor a failed execution in Azure Data Factory?
11. What would you do if this process had to run every day?
12. How would you avoid reprocessing files that have already been loaded? 
