
### 07-powershell-user-automation.md

```markdown
# 07 - PowerShell User & Group Automation

Goal: Automate AD user creation, OU placement, group membership, and password setup.

## Main Script: NewUserOnboard.ps1

Full code: [scripts/NewUserOnboard.ps1](../scripts/NewUserOnboard.ps1)

**Features**:
- Creates user with first initial + lastname (e.g., John Doe → jdoe)
- Places in Employees OU
- Adds to department group (e.g., HR-FullAccess)
- Sets simple lab password (forces change on first login)
- Basic output and error handling

## How to Use

1. Save script to `C:\Scripts` on DC01 (create folder if needed)
2. Open PowerShell as Administrator
3. Run examples:
   ```powershell
   cd C:\Scripts
   
   # Single user (HR department)
   .\NewUserOnboard.ps1 -FirstName "Jess" -LastName "Lee" -Department "HR"
   
   # Finance department
   .\NewUserOnboard.ps1 -FirstName "Alex" -LastName "Rivera" -Department "Finance"
4. Expected output:textAttempting to create user: jlee (Jess Lee)
   Password will be set to: TempPass123!
   User jlee created successfully!
   User added to group: HR-FullAccess

Next: [08-file-share-permissions.md](08-file-share-permissions.md)
