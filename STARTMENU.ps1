function DisplayMenu {
Write-Host @"

FLASH S�R�C�N�Z�N HARF� NED�R?
�rne�in D,E,F,G bunlardan birisi olabilir.
"@

$MENU = Read-Host "S�r�c� harfini yazar m�s�n?"
Switch ($MENU) {

D {
Start "./SGD.bat"
}
default {
#YANLIŞ YAZILIRSA
Write-Host "Ge�erli s�r�c� belirtmedin"
Start-Sleep -Seconds 2
DisplayMenu
}
}
}
DisplayMenu
