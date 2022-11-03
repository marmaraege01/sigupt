# Indirme Modülü

Invoke-WebRequest -Uri "https://www.techspot.com/downloads/downloadnow/7363/?evp=2016a86d5adf164f7552e14ba072e907&file=9876" -OutFile "$env:TEMP\Omega.7z" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome

# 7 Zip Entegrasyonu

Invoke-WebRequest -Uri "https://www.7-zip.org/a/7z1900-x64.msi" -OutFile "$env:TEMP\7z1900-x64.exe" -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome

msiexec /i "$env:TEMP\7z1900-x64.exe" /qb;


# 7 Zip Modülü

set-alias sz "c:\Program Files\7-Zip\7z.exe"
sz x -o"$env:TEMP\Omega" "$env:TEMP\Omega.7z" -r ;
sz x -o"$env:TEMP\app" $env:TEMP\Omega\'$PLUGINSDIR'\app-64.7z -r ;

# Signal Açıksa Kapat

$Process        = "Signal*"
$SignalProc = Get-Process -Name $Process

if($SignalProc){

    while($SignalProc){
        ForEach ($Proc in Get-Process -Name $Process){$Proc.CloseMainWindow()}
        sleep 5
        If (Get-Process -Name $Process){
            Write-Host "Signal acik kalmis kapatiliyor...."
            $wshell = new-object -com wscript.shell
            $wshell.AppActivate("Signal")
            $wshell.Sendkeys("%(Y)")
        }
        $SignalProc = Get-Process -Name $Process
    }
}


# Geçerliyse Kopyala Deneme 1

$Folder = 'D:\portapps\signal-portable\app'
"[$Folder] konumu denetleniyor"
if (Test-Path -Path $Folder) {
    Copy-Item "$env:TEMP\app\" -Destination "D:\portapps\signal-portable\" -Recurse -force
} else {
    "Duzgun kurulmamıs diger yol deneniyor..."
}

# Geçerliyse Kopyala Deneme 2

$Folder = 'D:\signal-portable\app'
"[$Folder] konumu denetleniyor"
if (Test-Path -Path $Folder) {
    Copy-Item "$env:TEMP\app" -Destination "D:\signal-portable\" -Recurse -force
} else {
    "Program bu sekilde yuklenmemis..."
}

# Hatalı İnerse Kopyala 1

$acayip = "$PLUGINSDIR"
$Folder = '$env:TEMP\Omega\$acayip\'
"[$Folder] alternatif konumu denetleniyor"
if (Test-Path -Path $Folder) {
    "Duzgun inmemis alternatiflere gidiliyor"
} else {
    
# Hatalı İnerse ve Duzgun Yerdeyse

$Folder2 = 'D:\portapps\signal-portable\app'
"[$Folder2] konumu denetleniyor"
if (Test-Path -Path $Folder2) {
    Copy-Item "$env:TEMP\Omega\" -Destination "D:\portapps\signal-portable\" -Recurse -force
} else {
    "Duzgun kurulmamıs diger yol deneniyor..."
}
}

# Hatalı İnerse Kopyala 2

$acayip = "$PLUGINSDIR"
$Folder = '$env:TEMP\Omega\$acayip\'
"[$Folder] alternatif konumu denetleniyor"
if (Test-Path -Path $Folder) {
    "Duzgun inmemis alternatif yukleme denemesi yapiliyor..."
} else {
    
# Hatalı İnerse ve Düzgün Yerde Değilse

$Folder2 = 'D:\signal-portable\app'
"[$Folder2] konumu denetleniyor"
if (Test-Path -Path $Folder2) {
    Copy-Item "$env:TEMP\Omega\" -Destination "D:\signal-portable\" -Recurse -force
} else {
    "Duzgun inmemis 2. alternatif yukleme denemesi yapiliyor..."
}
}
