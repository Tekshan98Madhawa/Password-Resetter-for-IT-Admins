# Password-Resetter-for-IT-Admins

A PowerShell utility script designed for system administrators to securely reset passwords for all local, non-administrative user accounts on a Windows machine. This script ensures users are prompted to change their password upon next login, enhancing account security in environments with multiple local users.

---

## ⚙️ Features

- Verifies the script is run with Administrator privileges.
- Identifies all **enabled, local (non-domain)** user accounts **not** part of the local `Administrators` group.
- Resets their passwords to a predefined temporary password.
- Configures the accounts to **require password change at next login**.
- Gracefully handles errors and exits with helpful messages.

---

## 📋 Prerequisites

- Windows PowerShell 5.1 or higher
- Must be run with **Administrator privileges**
- Tested on Windows 10 and Windows 11

---

## 🔐 Default Password

The script assigns the temporary password:

```powershell
Temp123!
```

> ⚠️ **Important:** For security reasons, it is highly recommended to **change this password** before running the script in production environments.

---

## 🚀 How to Use

1. Open PowerShell **as Administrator**.
2. Run the script:
   ```powershell
   .\reset-passwords.ps1
   ```

> 🛑 If the script is not run as Administrator, it will exit with a warning message.

---

## 💡 What the Script Does

1. **Checks for Admin Privileges**  
   Ensures the script runs with elevated permissions.

2. **Identifies Non-Admin Users**  
   Finds all **enabled**, **local**, and **non-administrative** user accounts.

3. **Resets Passwords**  
   Assigns the temporary password and configures the account to **expire** the password immediately.

4. **Informs the Admin**  
   Displays the status of password resets or suggests creating a new user if no applicable users are found.

---

## 🧪 Example Output

```
Password for user 'John' has been reset. They must change it at next login.
Password for user 'Guest' has been reset. They must change it at next login.
Please create a new user account.
```

---

## ❗ Notes

- The script uses `WMIC` to enforce password expiration. `WMIC` is deprecated but still functional in most Windows versions. For future-proofing, consider migrating to `net user` or PowerShell alternatives.
- This script does not affect domain users or administrator accounts.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🤝 Contributing

Pull requests, issues, and suggestions are welcome! Please open an issue for any bugs or feature requests.
