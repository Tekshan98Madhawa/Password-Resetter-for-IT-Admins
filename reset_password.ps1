# Ensure the script is run with Administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Write-Host "Please run this script as Administrator."
    exit 1
}

# Define the temporary password to be assigned
$temporaryPassword = "Temp123!"  # You can change this securely

# Get all usernames that are part of the local Administrators group
$adminUsers = Get-LocalGroupMember -Group "Administrators" | Select-Object -ExpandProperty Name

# Get all local, enabled, non-domain users who are NOT in the Administrators group
$nonAdminUsers = Get-LocalUser | Where-Object {
    $_.Enabled -eq $true -and
    $_.PrincipalSource -ne "Domain" -and
    $adminUsers -notcontains $_.Name
}

# Exit with message if no non-admin users are found
if ($nonAdminUsers.Count -eq 0) {
    Write-Host "Please create a new user account."
    exit 0
}

# Loop through each non-admin user and reset their password
foreach ($user in $nonAdminUsers) {
    try {
        $securePassword = ConvertTo-SecureString $temporaryPassword -AsPlainText -Force
        Set-LocalUser -Name $user.Name -Password $securePassword
        WMIC UserAccount Where Name="$($user.Name)" Set PasswordExpires=True
        Write-Host "Password for user '$($user.Name)' has been reset. They must change it at next login."
    }
    catch {
        Write-Host "Failed to reset password for '$($user.Name)': $_"
    }
}
