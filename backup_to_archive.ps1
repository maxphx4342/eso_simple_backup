# backup_to_archive.ps1
# Create backup with 7z

# Is 7z available

if (-not (Get-Command "7z" -ErrorAction SilentlyContinue)) {
    Write-Error "7z.exe not found. Make sure it's in PATH."
    exit 1
}

# List files and dirs to backup
$backupItems = @(
    "AddOnSettings.txt",
    "AddOns",
    "SavedVariables",
    "UserSettings.txt"
)

foreach ($item in $backupItems) {
    if (-not (Test-Path $item)) {
        Write-Warning "Backup item not found: $item"
    }
}

# Create Backup dir
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$backupDir = Join-Path $scriptDir "Backup"
if (-Not (Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir
}

# Create timebase name
$backupFileName = (Get-Date -Format "yyyy-MM-dd_HHmmssfff" ) + ".7z"
$backupFilePath = Join-Path $backupDir $backupFileName


# Compression using 7z
$compressionOptions = @("-m0=lzma2", "-mx=9", "-mfb=273", "-md=128m", "-ms=on")
#other options: -mfb=64 -md=32m

& 7z a @compressionOptions $backupFilePath @backupItems


Write-Output "Backup finished"
Write-Output "File is in $backupFilePath"

Read-Host "Press Enter to finish"
