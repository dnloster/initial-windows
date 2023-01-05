# Kiểm tra xem file này có chạy trên quyền Admin không
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$RunningAsAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if( $RunningAsAdmin -eq $False)
{
	Write-Host "ERROR: This script must be run as administrator" -Foreground "Red" -Background "Yellow"
	pause # Press any key to continue ...
	exit
}

# Script cài đặt cho Windows
# Author: dung204
# --------------------------------

# Các package sẽ cài đặt: Chocolatey, Unikey, Git, Google Chrome, NodeJS, yarn, OpenJDK (java), MinGW (gcc), WSL 

# --- Kiểm tra xem file này có chạy trên quyền Admin không
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

$RunningAsAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if( $RunningAsAdmin -eq $False)
{
	Write-Host "ERROR: This script must be run as administrator" -Foreground "Red" -Background "Yellow"
	pause # Press any key to continue ...
	exit
}

# --- Cài yarn
Write-Host "Installing yarn ..."
cmd.exe /c "npm install -g yarn"

# --- Cài WSL (Windows Subsystem for Linux)
Write-Host "Install WSL (and Ubuntu as well) ..." -Foreground "Green"
wsl --install # Also installed Ubuntu
Write-Host "Please restart to start using WSL"

# --- Cài Windows Terminal
Write-Host "Installing Windows Terminal..." -Foreground "Green"
choco install microsoft-windows-terminal
refreshenv
