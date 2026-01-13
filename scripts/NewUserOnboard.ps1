<#
.SYNOPSIS
    Automates creation of an Active Directory user, places them in the Employees OU,
    adds them to the specified department group, and sets a lab password that forces
    a change on first login.

.DESCRIPTION
    Designed for homelab.int domain. Creates users in OU=Employees,DC=homelab,DC=int
    and adds to <Department>-FullAccess group (e.g. HR-FullAccess).

.PARAMETER FirstName
    User's first name (required)

.PARAMETER LastName
    User's last name (required)

.PARAMETER Department
    Department name (HR, Finance, IT, etc.) - determines group membership

.PARAMETER OUPath
    Full OU path where user will be created (default: Employees OU)

.EXAMPLE
    .\NewUserOnboard.ps1 -FirstName "Jess" -LastName "Lee" -Department "HR"

    Creates user jlee@homelab.int in Employees OU and adds to HR-FullAccess group
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$FirstName,

    [Parameter(Mandatory=$true)]
    [string]$LastName,

    [string]$Department = "HR",

    [string]$OUPath = "OU=Employees,DC=homelab,DC=int"
)

# Generate username and UPN
$Username = ($FirstName.Substring(0,1) + $LastName).ToLower()
$UPN = "$Username@homelab.int"
$FullName = "$FirstName $LastName"

# Fixed lab password (simple for lab; change in production!)
$PasswordPlain = "TempPass123!"
$Password = ConvertTo-SecureString $PasswordPlain -AsPlainText -Force

Write-Output "Attempting to create user: $Username ($FullName)"

try {
    # Create the user
    New-ADUser -Name $FullName `
               -GivenName $FirstName `
               -Surname $LastName `
               -SamAccountName $Username `
               -UserPrincipalName $UPN `
               -Path $OUPath `
               -AccountPassword $Password `
               -Enabled $true `
               -ChangePasswordAtLogon $true `
               -ErrorAction Stop

    Write-Output "User $Username created successfully!"

    # Add to department group with existence check
    $GroupName = "$Department-FullAccess"
    
    $group = Get-ADGroup -Filter "Name -eq '$GroupName'" -ErrorAction SilentlyContinue
    if ($group) {
        Add-ADGroupMember -Identity $GroupName -Members $Username -ErrorAction Stop
        Write-Output "User added to group: $GroupName"
    }
    else {
        Write-Warning "Group '$GroupName' not found! User created but not added to any group."
        Write-Output "Create the group first: New-ADGroup -Name '$GroupName' -GroupScope Global -GroupCategory Security"
    }
}
catch {
    Write-Error "Creation failed! Error details: $_"
    Write-Output "Common fixes:"
    Write-Output "- OU exists?          Get-ADOrganizationalUnit -Identity '$OUPath'"
    Write-Output "- Password meets policy? Get-ADDefaultDomainPasswordPolicy"
    Write-Output "- Group exists?       Get-ADGroup '$GroupName'"
}

Write-Output "Done. User can now log in and change password."
