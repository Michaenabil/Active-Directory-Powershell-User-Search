# Prompt for the path to the input file containing UIDs or emails
$inputFilePath = Read-Host "Enter the path to the input file (one UID or email per line)"

# Prompt for the path to the output file to save the results
$outputFilePath = Read-Host "Enter the path to the output file to save the results"

# Read the input file
$users = Get-Content -Path $inputFilePath

# Initialize an empty array to store the results
$results = @()

# Loop through each user in the input file
foreach ($user in $users) {
    # Search for the user in Active Directory based on UID or email
    $userObj = Get-ADUser -Filter {SamAccountName -eq $user -or EmailAddress -eq $user} -Properties Name, Surname, Title, Department, Manager, Country, Enabled, PasswordLastSet, PasswordExpired, PasswordNeverExpires

    # Check if the user was found
    if ($userObj) {
        # Create a custom object with the desired user information
        $result = [PSCustomObject]@{
            Username           = $userObj.SamAccountName
            Name               = $userObj.Name
            Surname            = $userObj.Surname
            Position           = $userObj.Title
            Department         = $userObj.Department
            Manager            = $userObj.Manager
            Country            = $userObj.Country
            AccountActive      = $userObj.Enabled
            PasswordExpiring   = $userObj.PasswordNeverExpires -eq $false -and $userObj.PasswordExpired -eq $false
            LastPasswordSet    = $userObj.PasswordLastSet
            PasswordExpired    = $userObj.PasswordExpired
        }

        # Add the result to the array
        $results += $result
    }
}

# Export the results to the output file
$results | Export-Csv -Path $outputFilePath -NoTypeInformation

# Display a message indicating the script has finished
Write-Host "User search completed. Results saved to $outputFilePath"