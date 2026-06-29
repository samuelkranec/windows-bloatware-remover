# Windows Bloatware Remover

A PowerShell utility to remove preinstalled Windows 10/11 bloatware applications while preserving selected core productivity and system apps.

This project helps clean fresh Windows installations by removing unnecessary preinstalled Microsoft Store (Appx) applications.

---

## Features

* Removes preinstalled Windows Store (Appx) applications
* Cleans system-wide app installations (all users)
* Removes provisioned packages (prevents reinstall for new users)
* Whitelist-based protection for essential applications
* Fully customizable PowerShell script
* No external dependencies required

---

## One-Click Run (GitHub Raw)

Run the script directly from GitHub:

```powershell id="9v2k3x"
irm https://raw.githubusercontent.com/samuelkranec/windows-bloatware-remover/main/Remove-Bloatware.ps1 | iex
```

---

## Safer Installation Method

Download and run manually:

```powershell id="2m8xq0"
irm https://raw.githubusercontent.com/samuelkranec/windows-bloatware-remover/main/Remove-Bloatware.ps1 -OutFile debloat.ps1
powershell -ExecutionPolicy Bypass -File debloat.ps1
```

---

## Protected Applications (Not Removed)

These applications are intentionally excluded from removal:

* Xbox Game Overlay
* Xbox Gaming Overlay
* Microsoft Teams
* Microsoft Office / Office Hub
* Outlook (Windows version)
* OneNote
* Clipchamp

These apps are preserved for productivity and system functionality.

---

## Removed Applications

The script targets common Windows bloatware, including:

* Preinstalled promotional apps (Spotify, TikTok, etc.)
* Microsoft consumer apps (News, Weather, Get Help, Feedback Hub)
* Legacy applications (Skype, Mixed Reality Portal)
* Games (Candy Crush, Solitaire, Xbox components)
* Social apps (Facebook, Instagram, Twitter, LinkedIn)
* Streaming apps (Netflix, Disney+)
* Shopping apps (Amazon-related apps, Temu, eBay, Booking if present)
* OEM trialware and utilities (McAfee trials, Dolby tools, etc.)

Actual results depend on installed components.

---

## Requirements

* Windows 10 or Windows 11
* Administrator privileges
* PowerShell execution policy temporarily bypassed

---

## How to Use

### Step 1 – Open PowerShell as Admin

Search PowerShell → Right-click → Run as Administrator

### Step 2 – Allow script execution

```powershell id="g8k2lm"
Set-ExecutionPolicy Bypass -Scope Process
```

### Step 3 – Run script

Use either one-click or manual method above.

---

## Post-Execution

* Restart is recommended after execution
* Some apps may require reboot to fully uninstall

---

## Customization

You can modify the `$apps` array inside the script to:

* Add additional Appx package patterns
* Remove specific targets from removal list
* Extend functionality with `winget` for Win32 apps
* Add logging or restore features

---

## Limitations

* Does not remove Win32 applications
* Some system-protected apps cannot be removed
* OEM apps may not always be uninstallable via Appx
* Effectiveness depends on Windows version and installed packages

---

## Safety Notice

This script modifies installed applications. Use at your own risk. Always review the script before execution.

---

## License

MIT License

Free to use, modify, and distribute.
