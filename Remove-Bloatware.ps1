# Run as Administrator

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
    "*Microsoft.Getstarted*",
    "*Microsoft.MicrosoftSolitaireCollection*",
    "*Microsoft.MixedReality.Portal*",
    "*Microsoft.SkypeApp*",
    "*Microsoft.WindowsFeedbackHub*",
    "*Microsoft.YourPhone*",
    "*MicrosoftCorporationII.QuickAssist*",
    "*Microsoft.Todos*",
    "*Microsoft.PowerAutomateDesktop*",
    "*Microsoft.WindowsMaps*",
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
    "*AmazonShopping*",
    "*Adobe*",
    "*McAfee*",
    "*Solitaire*",
    "*Duolingo*",
    "*Pinterest*",
    "*News*",
    "*Weather*",
    "*Microsoft.BingNews*",
    "*Microsoft.BingWeather*",
    "*Microsoft.BingSearch*",
    "*Bing*",
    "*Microsoft.Clipchamp*",
    "*Clipchamp*",
    "*Copilot*",
    "*Microsoft.Copilot*",
    "*Windows.Copilot*",
    "*Microsoft.DevHome*",
    "*Windows.DevHome*",
)

$keepApps = @(
    "*XboxGameOverlay*",
    "*XboxGamingOverlay*",
    "*MicrosoftTeams*",
    "*Office*",
    "*MicrosoftOfficeHub*",
    "*Outlook*",
    "*OneNote*",
)

foreach ($app in $apps) {

    # skip anything in keep list
    $skip = $false
    foreach ($keep in $keepApps) {
        if ($app -like $keep) {
            $skip = $true
            break
        }
    }

    if ($skip) {
        Write-Host "Skipping $app (protected)"
        continue
    }

    Write-Host "Removing $app..."

    Get-AppxPackage -AllUsers $app | Remove-AppxPackage -ErrorAction SilentlyContinue

    Get-AppxProvisionedPackage -Online |
        Where-Object DisplayName -like $app |
        Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "Done! Restart recommended."
