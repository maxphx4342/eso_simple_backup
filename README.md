# ESO Simple Backup

Simple 1-click PowerShell script to back up Elder Scrolls Online configuration files.

## 💾 What it backs up

- `AddOnSettings.txt`
- `AddOns/`
- `SavedVariables/`
- `UserSettings.txt`

All essential files and folders located in your ESO `live` folder.

---

## 🔧 Requirements

- [7-Zip](https://www.7-zip.org/download.html) installed
- 7-Zip must be available in system PATH (so you can run `7z` from the command line)
- Windows PowerShell (built-in on Windows)

---

## 📦 Installation

1. Download or copy `backup_to_archive.ps1`.
2. Save the script in your **Elder Scrolls Online\live** folder.  
   Example path:
   ```
   C:\Users\<YourName>\Documents\Elder Scrolls Online\live
   ```

---

## 🔐 Enable Script Execution (One-Time Setup)

By default, PowerShell blocks script execution. You need to allow local scripts:

Open **PowerShell as a regular user** and run:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Verify with:

```powershell
Get-ExecutionPolicy -List
```

---

## 🛡️ Unblocking Downloaded Scripts

If you downloaded the `.ps1` file from the internet, Windows may block it.

### 🖱️ Option 1: Unblock via File Properties

1. Right-click the `.ps1` file
2. Choose **Properties**
3. Check **Unblock** at the bottom (if visible)
4. Click **Apply** → **OK**

### ⚙️ Option 2: Unblock via PowerShell

For single file:

```powershell
Unblock-File -Path "C:\path\to\script.ps1"
```

---

## ▶️ How to Run the Backup Script

### ✅ Option 1: Using File Explorer

- Right-click `backup_to_archive.ps1`
- Choose **Run with PowerShell**

### ✅ Option 2: Using CMD

Open CMD in your ESO `live` directory:

```cmd
cd "C:\Users\<YourName>\Documents\Elder Scrolls Online\live"
powershell -ExecutionPolicy Bypass -File backup_to_archive.ps1
```

---

## 📁 Output

The script will:

- Create a `Backup/` folder (if it doesn't exist)
- Generate a `.7z` archive named by date and time

Example:
```
Backup\2025-06-18_105257281.7z
```

Compression uses 7-Zip LZMA2 with high settings for maximum efficiency.

---

## 📝 Notes

- Script must be run manually (or scheduled via Windows Task Scheduler)
- Only local scripts are allowed unless signed or unblocked
- Unblock the file if you downloaded it from the internet

---

## 📜 License

MIT License

---

## 🙋‍♂️ Questions?

Open an issue or contact the author if you'd like to improve or extend this script.
