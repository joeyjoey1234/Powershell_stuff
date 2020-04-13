Start-Process powershell -ArgumentList '-noprofile -file ./I cant Login to the VPN Website.ps1' -verb RunAs

Stop-Process -Force -Name chrome



Remove-Item -Path 'C:\Users\Leet\AppData\Local\Google\Chrome\User Data\Default\Cookies'
Remove-Item -Path 'C:\Users\Leet\AppData\Local\Google\Chrome\User Data\Default\Cache'
Remove-Item -Path 'C:\Users\Leet\AppData\Local\Google\Chrome\User Data\Default\Cookies-journal'


$User = Read-Host "The Red Text is normal Cheap/Quick elevation, PRESS ENTER TO CONTINUE"