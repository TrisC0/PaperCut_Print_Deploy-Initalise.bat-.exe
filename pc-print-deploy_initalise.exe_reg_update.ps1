# Open Regedit.
Start-Process regedit

# Wait for Regedit to open.
Start-Sleep -Milliseconds 3000

# Navigate to the reg key and find the value.
$registryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
$registryName = "PaperCut Print Deploy UI Controller"

# Get the current reg value.
$registryValue = Get-ItemProperty -Path $registryPath -Name $registryName -ErrorAction SilentlyContinue

if ($registryValue -ne $null) {
  $updatedValue = $registryValue."$registryName".Replace(".bat", ".exe")

# Update the reg value.
  Set-ItemProperty -Path $registryPath -Name $registryName -Value $updatedValue
} else {
  Write-Host "Registry key not found."
}
