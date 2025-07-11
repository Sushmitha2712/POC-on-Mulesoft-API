#  POC: MySQL to Salesforce Integration using MuleSoft

This is a Proof of Concept (POC) that moves **Person records** from a **MySQL database** to **Salesforce**, using **MuleSoft** as the integration layer. The integration fetches people records based on roles, updates the data back to the source system, and ensures fault tolerance and error logging.

##  Architecture Overview

- **2 System APIs** are created:
  - One for fetching data from the database
  - One for updating data in Salesforce
- **1 Process API** handles the batch processing logic

##  Flow Description

1. **Fetch Data Automatically**
   - Data is fetched from MySQL every **30 minutes** using a **Scheduler**.
   - The process fetches only those records from the `person` table where `flag = 'new'`.

2. **Call System API**
   - Using an **HTTP request**, the data is fetched from the database.

3. **Validate Data**
   - Checks if:
     - Phone number is exactly 10 digits
     - Full name is not blank
   - If invalid:
     - The `flag` is updated to `'error'`
     - An **email notification** is sent

4. **Process Valid Data**
   - A **Batch Job** is used with a **Choice Router** inside it.
   - Based on the `Role`:
     - `Employee` → sent to employee queue
     - `User` → sent to user queue
     - `Seller` → sent to seller queue
   - Uses **VM queues** to pass data between flows (instead of flow-ref/chain)

5. **Individual Flows**
   - Each role has its own flow
   - Data is sent to respective **Salesforce endpoints** using **PATCH method**
   - On success:
     - Updates the original DB record’s `flag` to `'moved'`

6. **Failure Handling**
   - If a request to Salesforce fails (e.g., due to network issues):
     - Retries **3 times**
     - If still fails, retries again after **30 minutes**

7. **Error Handling**
   - If there are data issues (e.g., invalid phone):
     - Marks record as `'error'`
     - Sends an email
     - Logs the failure
   - On success:
     - Logs the entry in a **success log**
     - Updates Salesforce
     - Reflects changes in the source system

##  Notifications & Logging

- **Email notifications** for failed validations
- Separate logs for:
  - Success
  - Failure
- Real-time visibility of flow status via logs


## Technologies Used

- MuleSoft (Anypoint Studio)
- MySQL
- Salesforce
- DataWeave, Batch Job, VM Queues, Choice Router
- Scheduler + Retry mechanism

---

> 📌 This POC demonstrates a robust data synchronization pipeline using MuleSoft’s API-led architecture, emphasizing validation, dynamic routing, and fault-tolerant processing between MySQL and Salesforce systems.
