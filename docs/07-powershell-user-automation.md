# 07 - PowerShell User & Group Automation

Goal: Automate the creation of Active Directory users, place them in the correct OU, assign them to department-specific groups, and set an initial password that forces a change on first login.

## Main Script: NewUserOnboard.ps1

Full code: [scripts/NewUserOnboard.ps1](../scripts/NewUserOnboard.ps1) (Script is not perfect and can be further optimised).

Features:
- Takes FirstName, LastName, and Department as input parameters
- Automatically generates username (first initial + lastname, lowercase)
- Creates the user in the Employees OU
- Adds the user to the corresponding department group (e.g., HR-FullAccess)
- Sets a simple lab password (forces user to change it on first login)
- Includes basic output messages and error handling

## How to Use

1. Save the script to `C:\Scripts` on DC01 (create the folder if it doesn't exist)
2. Open **PowerShell** as Administrator on DC01
3. Run examples:

   ```powershell
   cd C:\Scripts
   
   # Create a user in HR department
   .\NewUserOnboard.ps1 -FirstName "Jess" -LastName "Lee" -Department "HR"
   
   # Create a user in Finance department
   .\NewUserOnboard.ps1 -FirstName "Alex" -LastName "Rivera" -Department "Finance"

Expected output (example): 
- Attempting to create user: jlee (Jess Lee)
- Password will be set to: TempPass123!
- User jlee created successfully!
- User added to group: HR-FullAccess

Security Notes
- The lab password ("TempPass123!") is intentionally simple — in production, use strong, random passwords or integrate with a password manager.
- The script uses -ChangePasswordAtLogon $true so users must change their password on first login (security best practice).
- Always run scripts as a Domain Admin account.

Next: 08-file-share-permissions.md
