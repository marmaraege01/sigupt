function DisplayMenu {
Write-Host @"

FLASH SÜRÜCÜNÜZÜN HARFÝ NEDÝR?
Örneðin D,E,F,G bunlardan birisi olabilir.
"@

$MENU = Read-Host "Sürücü harfini yazar mýsýn?"
Switch ($MENU) {

D {
Start "./SGD.bat"
}
default {
#YANLIÅž YAZILIRSA
Write-Host "Geçerli sürücü belirtmedin"
Start-Sleep -Seconds 2
DisplayMenu
}
}
}
DisplayMenu
