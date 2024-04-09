1. Running the Application:

Requirements:
Microsoft Visual Studio installed on your system.
Access to an MSSQL Server instance.

Steps:
Clone or download the GRN Application project from the repository.
Open the project in Microsoft Visual Studio.
Build the solution to ensure all dependencies are resolved.
Set up the MSSQL Server connection string in the code.
Run the application.

2. Setting Up the Database:

Requirements:
Access to MSSQL Server Management Studio (SSMS) or another SQL client.

Steps:
Open SSMS or your SQL client.
Connect to your MSSQL Server instance.
Once the database and tables are created, the database setup is complete.

3. Usage:

Upon running the application, you will be presented with Form 1 where you can input GRN details, add items, and save the GRN to the database.
Existing GRNs will be displayed in a DataGridView below the form.
You can filter and search for specific GRNs based on date, supplier, or GRN number.
Clicking on a GRN in the DataGridView will display its details, including itemized information.
In Form 2, existing GRNs will be displayed in a DataGridView. You can select the relevant GRN_NUmbera and press the generate report button to get a Crystal Report that displays the selected GRN's details, including GRN number, date, supplier 
information, and received items. 
Application has tested for each functionality.

4. Notes:

Ensure that your MSSQL Server instance is running and accessible.
Modify the connection string in the code to match your MSSQL Server configuration.
For security reasons, consider encrypting sensitive information in the connection string.