function DisplayMenu {
Write-Host @"

FLASH SÜRÜCÜNÜZÜN HARFİ NEDİR?
Örneğin D,E,F,G bunlardan birisi olabilir.
"@

$MENU = Read-Host "Sürücü harfini yazar mısın?"
Switch ($MENU) {

D {
Start "./SGD.bat"
}

E {
Start "./SGE.bat"
}

F {
Start "./SGF.bat"
}
default {
#YANLIŞ YAZILIRSA
Write-Host "Geçerli sürücü belirtmedin"
Start-Sleep -Seconds 2
DisplayMenu
}
}
}
DisplayMenu
