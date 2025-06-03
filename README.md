Password Resetter for IT Admins
A comprehensive password management tool designed specifically for IT administrators to efficiently handle password resets across multiple systems and user accounts.
🚀 Features

Bulk Password Reset: Reset passwords for multiple users simultaneously
Active Directory Integration: Seamless integration with Windows Active Directory
Secure Password Generation: Generate cryptographically secure passwords
Audit Logging: Complete audit trail of all password reset activities
Role-Based Access Control: Different permission levels for IT staff
Multi-Domain Support: Handle password resets across multiple domains
Email Notifications: Automatic email notifications to users after password reset
Password Policy Enforcement: Ensure all new passwords meet organizational requirements

📋 Prerequisites
Before you begin, ensure you have the following installed:

Operating System: Windows Server 2016+ or Windows 10+
PowerShell: Version 5.1 or higher
Active Directory Module: For PowerShell
SMTP Server Access: For email notifications
Administrator Privileges: Domain administrator or equivalent permissions

Required PowerShell Modules
powershellInstall-Module -Name ActiveDirectory
Install-Module -Name ImportExcel  # For bulk operations from Excel files
🛠 Installation
Option 1: Clone Repository
bashgit clone https://github.com/Tekshan98Madhawa/Password-Resetter-for-IT-Admins.git
cd Password-Resetter-for-IT-Admins
Option 2: Download Release

Go to the Releases page
Download the latest version
Extract the files to your desired location

⚙️ Configuration
1. Initial Setup
Copy the configuration template and customize it:
powershellCopy-Item config.template.json config.json
2. Configure Settings
Edit config.json with your environment settings:
json{
  "Domain": "yourdomain.com",
  "DomainController": "dc01.yourdomain.com",
  "SMTPServer": "mail.yourdomain.com",
  "SMTPPort": 587,
  "FromEmail": "noreply@yourdomain.com",
  "PasswordLength": 12,
  "PasswordComplexity": true,
  "LogPath": "C:\\Logs\\PasswordReset\\",
  "RequirePasswordChange": true
}
3. Set Up Permissions
Ensure the service account has the following permissions:

Reset password
Account options
Read user information
Send As permissions for email notifications

🎯 Usage
Single User Password Reset
powershell# Reset password for a single user
.\Reset-Password.ps1 -Username "john.doe" -SendEmail

# Reset with custom password
.\Reset-Password.ps1 -Username "john.doe" -Password "CustomPass123!" -SendEmail
Bulk Password Reset
powershell# Reset passwords from CSV file
.\Reset-BulkPasswords.ps1 -CSVPath "users.csv"

# Reset passwords for specific OU
.\Reset-BulkPasswords.ps1 -OrganizationalUnit "OU=Sales,DC=company,DC=com"
Example CSV Format
csvUsername,Email,FirstName,LastName
john.doe,john.doe@company.com,John,Doe
jane.smith,jane.smith@company.com,Jane,Smith
Advanced Usage
powershell# Generate secure password without reset
.\Generate-Password.ps1 -Length 16 -IncludeSymbols

# Audit password reset history
.\Get-PasswordResetAudit.ps1 -StartDate "2024-01-01" -EndDate "2024-01-31"

# Check account status
.\Get-AccountStatus.ps1 -Username "john.doe"
📊 Monitoring and Logging
Log Files
The tool generates comprehensive logs in the configured log directory:

PasswordReset.log: Main activity log
Errors.log: Error and exception log
Audit.log: Detailed audit trail
Email.log: Email notification status

Log Format
[2024-12-06 10:30:45] [INFO] Password reset initiated for user: john.doe by admin: admin.user
[2024-12-06 10:30:46] [SUCCESS] Password successfully reset for user: john.doe
[2024-12-06 10:30:47] [INFO] Email notification sent to: john.doe@company.com
🔧 Troubleshooting
Common Issues
Issue: "Access Denied" Error
Solution: Ensure the running account has proper Active Directory permissions
Issue: Email Notifications Not Sending
Solutions:

Verify SMTP server settings in config.json
Check firewall rules for SMTP port
Confirm authentication credentials

Issue: PowerShell Execution Policy Error
Solution:
powershellSet-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Debug Mode
Enable debug logging by adding the -Debug parameter:
powershell.\Reset-Password.ps1 -Username "john.doe" -Debug
🛡️ Security Considerations

Secure Storage: Configuration files should be stored securely with appropriate NTFS permissions
Credential Management: Use service accounts with minimal required privileges
Audit Trail: All activities are logged for compliance and security review
Password Transmission: Passwords are never logged in plain text
Email Security: Consider using encrypted email for password notifications

🤝 Contributing
Contributions are welcome! Please follow these steps:

Fork the repository
Create a feature branch (git checkout -b feature/amazing-feature)
Commit your changes (git commit -m 'Add some amazing feature')
Push to the branch (git push origin feature/amazing-feature)
Open a Pull Request

Development Guidelines

Follow PowerShell best practices
Include comprehensive error handling
Add appropriate comments and documentation
Test with multiple AD environments
Update README for new features

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
🆘 Support
If you encounter any issues or have questions:

Check the Issues page
Create a new issue with detailed information
Include relevant log files and error messages

📈 Roadmap

 GUI Interface for easier management
 Integration with Azure Active Directory
 Multi-factor authentication support
 REST API endpoints
 Docker containerization
 Linux/macOS support via PowerShell Core

🙏 Acknowledgments

Microsoft Active Directory PowerShell Module documentation
PowerShell community for best practices
Security professionals for password policy recommendations

📞 Contact
Author: Tekshan Madhawa
Project Link: https://github.com/Tekshan98Madhawa/Password-Resetter-for-IT-Admins
