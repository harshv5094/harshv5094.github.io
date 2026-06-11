# Check-Scoop.ps1
# Automatically checks if Scoop is installed and installs it if missing.

function Test-ScoopInstalled
{
  return $null -ne (Get-Command scoop -ErrorAction SilentlyContinue)
}

function Install-Scoop
{
  Write-Host "Scoop not found. Installing Scoop..." -ForegroundColor Yellow

  # Scoop requires at least PowerShell 5.1 and .NET Framework 4.5
  if ($PSVersionTable.PSVersion.Major -lt 5)
  {
    Write-Error "PowerShell 5.1 or later is required to install Scoop."
    exit 1
  }

  # Allow the current session to run the install script
  $currentPolicy = Get-ExecutionPolicy -Scope CurrentUser
  if ($currentPolicy -eq 'Restricted' -or $currentPolicy -eq 'AllSigned')
  {
    Write-Host "Setting ExecutionPolicy to RemoteSigned for CurrentUser..." -ForegroundColor Cyan
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
  }

  # Run the official Scoop installer
  Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

  # Verify installation succeeded
  if (Test-ScoopInstalled)
  {
    Write-Host "Scoop installed successfully!" -ForegroundColor Green
    scoop --version
    scoop bucket add extras

    $packages = @(
      "make",
      "gsudo",
      "touch",
      "opencode"
    )

    foreach ($pkg in $packages)
    {
      scoop install $pkg
    }

  } else
  {
    Write-Error "Scoop installation failed. Please check the output above for errors."
    exit 1
  }
}

# ── Main ──────────────────────────────────────────────────────────────────────

Write-Host "Checking for Scoop..." -ForegroundColor Cyan

if (Test-ScoopInstalled)
{
  $scoopVersion = scoop --version 2>&1 | Select-Object -First 1
  Write-Host "Scoop is already installed." -ForegroundColor Green
  Write-Host "Version: $scoopVersion" -ForegroundColor Gray

  # Optional: check for updates
  Write-Host "`nChecking for Scoop updates..." -ForegroundColor Cyan
  scoop update
  Write-Host "Scoop is up to date." -ForegroundColor Green
} else
{
  Install-Scoop
}
