#Requires -RunAsAdministrator

$apps = @(
    "*Spotify*",
    "*TikTok*",
    "*Xbox*",
    "*Microsoft.Xbox*",
    "*Microsoft.GamingApp*",
    "*Microsoft.ZuneMusic*",
    "*Microsoft.ZuneVideo*",
    "*Microsoft.People*",
    "*Microsoft.BingNews*",
    "*Microsoft.BingWeather*",
    "*Microsoft.GetHelp*",
    "*Microsoft.GetStarted*",
    "*Microsoft.MicrosoftSolitaireCollection*",
    "*Microsoft.MixedReality.Portal*",
    "*Microsoft.SkypeApp*",
    "*Microsoft.WindowsFeedbackHub*",
    "*Microsoft.YourPhone*",
    "*MicrosoftCorporationII.QuickAssist*",
    "*Microsoft.Todos*",
    "*Microsoft.PowerAutomateDesktop*",
    "*Microsoft.WindowsMaps*",
    "*Microsoft.Clipchamp*",
    "*Microsoft.DevHome*",
    "*Microsoft.OutlookForWindows*",
    "*Microsoft.549981C3F5F10*"    # Copilot
    "*Copilot*",
    "*Clipchamp*",
    "*Disney*",
    "*Netflix*",
    "*Facebook*",
    "*Instagram*",
    "*Twitter*",
    "*LinkedIn*",
    "*Amazon*",
    "*Prime*",
    "*CandyCrush*",
    "*Dolby*",
    "*WhatsApp*",
    "*Temu*",
    "*Booking*",
    "*eBay*",
    "*Adobe*",
    "*McAfee*",
    "*Duolingo*",
    "*Pinterest*"
)

foreach ($pattern in $apps) {

    Write-Host ""
    Write-Host "Searching for $pattern..." -ForegroundColor Cyan

    # Remove installed packages
    Get-AppxPackage -AllUsers -Name $pattern | ForEach-Object {

        try {
            Write-Host "Removing $($_.Name)..."

            Remove-AppxPackage `
                -Package $_.PackageFullName `
                -AllUsers `
                -ErrorAction Stop

            Write-Host "✓ Removed $($_.Name)" -ForegroundColor Green
        }
        catch {
            Write-Host "✗ Failed: $($_.Name)" -ForegroundColor Yellow
        }
    }

    # Remove provisioned packages (new users)
    Get-AppxProvisionedPackage -Online |
        Where-Object DisplayName -like $pattern |
        ForEach-Object {

            try {
                Remove-AppxProvisionedPackage `
                    -Online `
                    -PackageName $_.PackageName `
                    -ErrorAction Stop | Out-Null

                Write-Host "✓ Removed provisioned package $($_.DisplayName)" -ForegroundColor Green
            }
            catch {
                Write-Host "✗ Failed provisioned package $($_.DisplayName)" -ForegroundColor Yellow
            }
        }
}

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "Debloat completed!" -ForegroundColor Green
Write-Host "Restart your PC to apply all changes." -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan