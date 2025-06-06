# Active-Directory-Powershell-User-Search
This PowerShell script queries Active Directory for a single user by their username (SamAccountName) and displays their details, including account status, password expiration, and manager information.
File: Get-ADUserInfo.ps1

Description
This PowerShell script queries Active Directory for a single user by their username (SamAccountName) and displays their details, including account status, password expiration, and manager information.

Usage
powershell
.\Get-ADUserInfo.ps1
When prompted, enter the username to search (e.g., jsmith).

Output
Displays the following user properties in the console:

Name, Surname, Email, Department

Account Status (Enabled or Disabled)

Password Expiration Status

Last Password Set Date

Dependencies
ActiveDirectory PowerShell module (run Import-Module ActiveDirectory if needed).

Requires admin rights to query AD.

Example
powershell
Enter the username to search: jsmith

User Information
----------------
Name: John Smith
Email: jsmith@company.com
Department: IT
Account Active: True
Password Expiring: True
Last Password Set: 01/15/2023
Script 2: Bulk AD User Lookup (With Error Handling)
File: Bulk-ADUserSearch.ps1

Description
This script reads a list of usernames or emails from a text file, queries Active Directory for each, and exports the results to a CSV file. Includes handling for missing users.

Usage
powershell
.\Bulk-ADUserSearch.ps1
Input File: Text file with one username/email per line.

Output File: CSV file to save results.

Output Format (CSV Columns)
Username	Name	Department	Manager	AccountActive	PasswordExpired	...
Dependencies
ActiveDirectory module.

Input file must exist (e.g., users.txt).

Example
Input File (users.txt):

text
jsmith  
invalid_user  
mjohnson  
Output (results.csv):

csv
Username,Name,Department,...  
jsmith,John Smith,IT,...  
invalid_user,"User not found!",...  
Script 3: Bulk AD User Lookup (Simplified)
File: Bulk-ADUserSearch-Lite.ps1

Description
A streamlined version of Script 2 without "User not found" entries. Only exports valid AD users to CSV.

Usage
powershell
.\Bulk-ADUserSearch-Lite.ps1
Same as Script 2, but skips missing users.

When to Use
When you only need data for valid users.

Faster for large lists where missing users are irrelevant.

General Notes for All Scripts
Permissions: Run in a PowerShell session with AD read access.

Input Files: Ensure no empty lines or malformed entries.

Output: CSV files open in Excel or any text editor.

Suggested Repo Structure
text
/ActiveDirectory-Scripts  
│  
├── Get-ADUserInfo.ps1          # Single-user lookup  
├── Bulk-ADUserSearch.ps1       # Bulk lookup (with errors)  
├── Bulk-ADUserSearch-Lite.ps1  # Bulk lookup (valid users only)  
├── README.md                   # Overview of all scripts  
└── /examples  
    ├── users.txt               # Sample input  
    └── results.csv             # Sample output  
README.md Snippet for Repo
markdown
# Active Directory Query Scripts  

A collection of PowerShell scripts to fetch user details from Active Directory.  

## **Scripts**  
1. **Single User Lookup**: Interactive prompt for one user.  
2. **Bulk Lookup (With Errors)**: Processes a list, logs missing users.  
3. **Bulk Lookup (Lite)**: Exports only valid users.  

## **Requirements**  
- Windows PowerShell 5.1+.  
- ActiveDirectory module.  
