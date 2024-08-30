
### Step 1: Create a Table in Snowflake
- **Action**: You start by creating a table named `ANALYTICSDB_DEV.REPORTING_LAYER.EMP_DETAIL` in your Snowflake database. 
- **Purpose**: This table will be used to store employee details, and later, its data will be imported into Power BI.

### Step 2: Import Dataset into Power BI Desktop
- **Action**: Using Power BI Desktop, import the data from the newly created Snowflake table. 
- **Mode**: Use the DirectQuery mode, which allows real-time data interaction without importing the data into Power BI.
- **Outcome**: The dataset is now part of your Power BI model named `test_alm_toolkit_report`.

### Step 3: Create and Publish a Report
- **Action**: Create a simple report using the imported dataset in Power BI Desktop.
- **Next Step**: Publish this report to Microsoft Fabric or Power BI Service.
- **Outcome**: The report is now available online, where it can be accessed and shared with others.

### Step 4: Alter the Snowflake Table
- **Action**: Modify the Snowflake table by adding a new column `DEPT_ID`.
- **SQL Command**: 
  ```sql
  ALTER TABLE ANALYTICSDB_DEV.REPORTING_LAYER.EMP_DETAIL 
  ADD COLUMN DEPT_ID INT DEFAULT '1';
  ```

### Step 5: Refresh the Power BI Desktop Model
**Action:** Go back to your Power BI Desktop and refresh the model.  
**Outcome:** This refresh should now include the new DEPT_ID column in your model.

### Step 6: Obtain the XMLA Endpoint from MS Fabric
**Action:** In MS Fabric, navigate to your workspace:  
- Go to Workspace Settings.  
- Click on License info.  
- Copy the Connection link, which is the XMLA endpoint.  
**Purpose:** This endpoint allows you to connect Power BI with external tools like ALM Toolkit for advanced operations.

### Step 7: Open ALM Toolkit in Power BI Desktop
**Action:** In Power BI Desktop, open ALM Toolkit from the External Tools tab.  
**Purpose:** ALM Toolkit helps in comparing and deploying schema changes between different environments.

### Step 8: Paste the XMLA Endpoint and Load the Semantic Model
**Action:** In ALM Toolkit, paste the XMLA endpoint link into the Target workspace field.  
**Outcome:** This loads all the semantic models available in the specified workspace.

### Step 9: Select the Semantic Model
**Action:** Choose the semantic model `test_alm_toolkit_report` where you want to deploy the schema changes.  
**Purpose:** This model is the one you published earlier and now need to update with the new schema.

### Step 10: Compare Source and Target Schemas
**Action:** ALM Toolkit will display a comparison between the schema in your Power BI Desktop (Source) and the schema in Fabric (Target).  
**Outcome:** You will see the differences, such as the new DEPT_ID column.

### Step 11: Click Update to View Changes
**Action:** Click on Update to see all the changes that will be applied to the target schema.  
**Verification:** You can also verify these changes using JSON data if needed.

### Step 12: Validate the Selection
**Action:** Run a validation check to ensure there are no errors in the changes you’re about to deploy.  
**Outcome:** If there are no errors, proceed to the next step.

### Step 13: Deploy the Changes to Fabric Workspace
**Action:** Click on Update and wait for the changes to be deployed to the Fabric workspace.  
**Outcome:** Your Power BI report now reflects the updated schema, including the new DEPT_ID column.

### Step 14: Refresh the Semantic Model in Fabric
**Action:** Once the deployment is complete, refresh the semantic model in Fabric (press F5).  
**Outcome:** The new column DEPT_ID should now be available, and you can use it in your report.
