# Indirme Modülü

start "UPDMOD.bat" -Wait -NoNewWindow

# 7 Zip Entegrasyonu

Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z1900-x64.msi" -OutFile "$env:TEMP\7z1900-x64.exe" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome

msiexec /i "$env:TEMP\7z1900-x64.exe" /qb;

# 7 Zip Modülü

set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"
sz x -o"$env:TEMP\Omega" "$env:TEMP\Omega.7z" -aoa -r ;
sz x -o"$env:TEMP\app" $env:TEMP\Omega\'$PLUGINSDIR'\app-64.7z -aoa -r ;


# Geçerliyse Kopyala Deneme 1

$Folder = 'E:\portapps\signal-portable\app'
"[$Folder] Signal doğru konumda görünüyor. Şuan yükleniyor..."
if (Test-Path -Path $Folder) {
    Copy-Item "$env:TEMP\app\" -Destination "E:\portapps\signal-portable\" -Recurse -force
} else {
    "Signal doğru konumda değil alternatif yükleme yöntemi kontrol ediliyor..."
}

# Geçerliyse Kopyala Deneme 2

$Folder = 'E:\signal-portable\app'
"[$Folder] Evet Signal'i buldum. Yüklüyorum..."
if (Test-Path -Path $Folder) {
    Copy-Item "$env:TEMP\app" -Destination "E:\signal-portable\" -Recurse -force
} else {
    "Program düzgün konumda yüklenmiş. Son işlemlere geçiliyor..."
}
