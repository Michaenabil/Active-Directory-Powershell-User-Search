# Prompt for the username to search
$username = Read-Host "Enter the username to search"

# Search for the user in Active Directory
$user = Get-ADUser -Filter {SamAccountName -eq $username} -Properties Name, Surname,DisplayName,EmailAddress, Title, Department, Manager, CO, Enabled, PasswordLastSet, PasswordExpired, PasswordNeverExpires

# Check if the user was found
if ($user) {
    # Display user information
    Write-Host "User Information"
    Write-Host "----------------"
    Write-Host "Name: $($user.Name)"
    Write-Host "Surname: $($user.Surname)"
    Write-Host "DisplayName: $($user.DisplayName)"
    Write-Host "Email: $($user.EmailAddress)"
    Write-Host "Position: $($user.Title)"
    Write-Host "Department: $($user.Department)"
    Write-Host "Manager: $($user.Manager)"
    Write-Host "Country: $($user.co)"
    Write-Host "Account Active: $($user.Enabled)"
    
    # Check if the password is set to expire
    $passwordExpiring = $user.PasswordNeverExpires -eq $false -and $user.PasswordExpired -eq $false
    Write-Host "Password Expiring: $passwordExpiring"
    
    # Check the last password set date
    $lastPasswordSet = $user.PasswordLastSet
    if ($lastPasswordSet -eq $null) {
        Write-Host "Last Password Set: Password has not been set"
    } else {
        Write-Host "Last Password Set: $lastPasswordSet"
    }
    
    # Check if the password has expired
    $passwordExpired = $user.PasswordExpired
    Write-Host "Password Expired: $passwordExpired"

} else {
    Write-Host "User not found in Active Directory."
}