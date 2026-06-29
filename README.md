# Windows Debloat Script

A PowerShell-based debloating tool for Windows 10 and Windows 11 that removes preinstalled Microsoft Store applications while preserving selected core system and productivity apps.

---

## Overview

This script is designed to streamline Windows installations by removing unwanted preinstalled applications (bloatware) for all users on the system. It focuses on Microsoft Store (Appx) applications and does not modify system files.

It includes a whitelist mechanism to ensure essential productivity and system-related applications remain unaffected.

---

## Features

* Removes preinstalled Windows Store (Appx) applications
* Applies changes for all users on the system
* Supports provisioned package cleanup (prevents reinstallation for new users)
* Whitelist-based protection for essential applications
* Simple and fully customizable PowerShell script
* No external dependencies required

---

## Protected Applications

The following applications are excluded from removal:

* Xbox Game Overlay
* Xbox Gaming Overlay
* Microsoft Teams
* Microsoft Office / Office Hub
* Outlook (Windows version)
* OneNote
* Clipchamp

These applications are preserved intentionally to maintain productivity and gaming functionality.

---

## Removed Applications

The script targets common Windows bloatware, including:

* Preinstalled promotional apps (e.g., Spotify, TikTok)
* Microsoft consumer apps (News, Weather, Get Help, Feedback Hub)
* Legacy apps (Skype, Mixed Reality Portal)
* Games and entertainment apps (Candy Crush, Solitaire, Xbox components)
* Social media and third-party apps (Facebook, Instagram, Twitter, LinkedIn)
* Streaming and shopping apps (Netflix, Disney+, Amazon-related apps)
* OEM trialware and promotional software (McAfee trials, Dolby tools, etc.)

Actual removal depends on what is installed on the system.

---

## Requirements

* Windows 10 or Windows 11
* Administrator privileges
* PowerShell execution enabled (temporary policy override recommended)

---

## Usage

### 1. Run PowerShell as Administrator

Open Start Menu → search PowerShell → right-click → Run as Administrator

### 2. Allow script execution (temporary)

```powershell id="1a8q7k"
Set-ExecutionPolicy Bypass -Scope Process
```

### 3. Execute the script

```powershell id="8v2m1x"
.\Remove-Bloatware.ps1
```

---

## Post-Execution

* A system restart is recommended after execution
* Some applications may require reboot to fully disappear

---

## Customization

The script can be customized by modifying the `$apps` array.

You can:

* Add additional Appx package patterns
* Remove unwanted targets from the list
* Extend functionality using `winget` for Win32 applications
* Implement logging or rollback functionality

---

## Limitations

* Does not remove Win32 applications
* Some Microsoft system apps are protected and cannot be removed
* OEM preinstalled applications may not always be removable via Appx commands
* Effectiveness depends on Windows version and installed components

---

## License

This project is released under the MIT License.

You are free to use, modify, and distribute this project with attribution.
