Active Directory User Query Tools
PowerShell scripts to fetch user details from Active Directory (AD). Ideal for IT admins for quick audits, onboarding checks, or security reviews.

📜 Scripts Overview
Script	Description	Input	Output
Get-ADUserInfo.ps1	Interactive lookup for a single user	Username prompt	Console output
Bulk-ADUserSearch.ps1	Bulk search with error handling	Text file (usernames/emails)	CSV file
Bulk-ADUserSearch-Lite.ps1	Bulk search (valid users only)	Text file (usernames/emails)	CSV file
🛠 Requirements
PowerShell 5.1+ (Windows)

ActiveDirectory Module (Install via: Install-WindowsFeature RSAT-AD-PowerShell)

Permissions: AD read access.

📌 Script Details
1. Single User Lookup (Get-ADUserInfo.ps1)
Description: Fetches and displays detailed AD properties for a single user.

Usage:
powershell
.\Get-ADUserInfo.ps1
Example Output:

plaintext
Enter the username to search: jsmith

User Information
----------------
Name: John Smith
Email: jsmith@company.com
Department: IT
Account Active: True
Password Expiring: True
Last Password Set: 01/15/2023
2. Bulk User Lookup (With Errors) (Bulk-ADUserSearch.ps1)
Description: Processes a list of usernames/emails from a file, exports results to CSV, and logs missing users.

Usage:
powershell
.\Bulk-ADUserSearch.ps1
Input File Format:

plaintext
jsmith
mjohnson
invalid_user
Output CSV Columns:
Username, Name, Department, Manager, AccountActive, PasswordExpired, ...

Example Output (results.csv):

csv
Username,Name,Department...  
jsmith,John Smith,IT...  
invalid_user,"User not found!",...  
3. Bulk User Lookup (Lite) (Bulk-ADUserSearch-Lite.ps1)
Description: Exports only valid AD users (skips missing entries).

Usage:
powershell
.\Bulk-ADUserSearch-Lite.ps1
When to Use:

For clean datasets where missing users are irrelevant.

Faster processing for large lists.

🗂 Repository Structure
bash
/AD-User-Queries  
│  
├── Get-ADUserInfo.ps1          # Single-user interactive lookup  
├── Bulk-ADUserSearch.ps1       # Bulk lookup with error tracking  
├── Bulk-ADUserSearch-Lite.ps1  # Bulk lookup (valid users only)  
├── README.md                   # This documentation  
└── /examples  
    ├── input_users.txt         # Sample input  
    └── output_results.csv      # Sample output  
💡 Tips
Input Files: Ensure no empty lines or special characters.

CSV Output: Open with Excel or Import-Csv in PowerShell.

Logging: Add -ErrorAction SilentlyContinue to suppress errors (optional).

📜 License
MIT – Free for reuse.

🔄 How to Contribute
Fork the repo.

Add improvements (e.g., logging, GUI).

Submit a PR!

This README.md is ready to commit directly to your GitHub repo! It’s:
