# Scripts Folder

This folder contains PowerShell scripts for automating tasks in the homelab.int Active Directory environment.

## Available Scripts

- **[NewUserOnboard.ps1](NewUserOnboard.ps1)**  
  Creates AD users, places them in the Employees OU, adds to department groups, and sets initial password.  
  Usage: `.\NewUserOnboard.ps1 -FirstName "Jess" -LastName "Lee" -Department "HR"`

  Note: The script is not perfect and can be further optimised. This was mainly used to practice scripts in my homelab. 
