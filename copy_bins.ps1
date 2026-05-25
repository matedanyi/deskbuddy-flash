# Run after PlatformIO build to copy binaries into webflash/
$build = "$PSScriptRoot\..\.pio\build\esp32c3dev"
$dest  = $PSScriptRoot

Copy-Item "$build\bootloader.bin" $dest -Force
Copy-Item "$build\partitions.bin" $dest -Force
Copy-Item "$build\firmware.bin"   $dest -Force

Write-Host "Binaries copied to webflash/" -ForegroundColor Green
Write-Host "  bootloader.bin  $('{0:N1}' -f ((Get-Item "$dest\bootloader.bin").Length/1KB)) KB"
Write-Host "  partitions.bin  $('{0:N1}' -f ((Get-Item "$dest\partitions.bin").Length/1KB)) KB"
Write-Host "  firmware.bin    $('{0:N1}' -f ((Get-Item "$dest\firmware.bin").Length/1KB)) KB"
