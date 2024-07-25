# Define the address to ping
$pingAddress = "8.8.8.8"

# Function to check internet connectivity
function Test-InternetConnection {
    try {
        $pingResult = Test-Connection -ComputerName $pingAddress -Count 1 -Quiet
        return $pingResult
    } catch {
        return $false
    }
}

# Function to play a sound notification
function Play-Sound {
    param (
        [string]$path
    )
    $player = New-Object System.Media.SoundPlayer
    $player.SoundLocation = $path
    $player.Load()
    $player.PlaySync()
}

# Path to the sound file
$soundPath = "C:\Windows\Media\notify.wav"

# Loop until internet connection is detected
while (-not (Test-InternetConnection)) {
    Write-Host "No internet connection. Checking again in 10 seconds..."
    Start-Sleep -Seconds 10
}

# Alert when internet connection is detected
Write-Host "Internet connection established!"

# Loop to repeatedly play the sound until interrupted by the user
try {
    while ($true) {
        Play-Sound -path $soundPath
        Start-Sleep -Seconds 1
    }
} catch [System.Management.Automation.StopUpException] {
    Write-Host "Script interrupted by user."
}

# Add a system notification
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show("Internet connection established!", "Internet Connection", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
