# Set-ExecutionPolicy RemoteSigned needs to be ran prior
mode con: cols=53 lines=10

$password = Read-Host -Prompt 'Input your password' -AsSecureString
$password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
Function Get-StringHash([String] $String,$HashName = "MD5")
{
$StringBuilder = New-Object System.Text.StringBuilder
[System.Security.Cryptography.HashAlgorithm]::Create($HashName).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($String))|%{
[Void]$StringBuilder.Append($_.ToString("x2"))
}
$StringBuilder.ToString()
}

$password_hash = Get-StringHash $password "MD5"
$hash_check = 'ad9b7cace3dc076b32296d0da661c4bd'

if($password_hash -eq $hash_check) {
    mkdir C:/.catsyndrome/chrome/storage/cache/browser/history/huh > $null
    cp ./id_rsa.pub C:/.catsyndrome/chrome/storage/cache/browser/history/huh/ > $null
    ./VeraCryptPortable/App/VeraCrypt/VeraCrypt.exe /s /q /v huh.txt /l X /a /password $password /pim 485 /k C:\.catsyndrome\chrome\storage\cache\browser\history\huh\id_rsa.pub /k C:\.catsyndrome\chrome\storage\cache\browser\history\huh
    Start-Sleep -s 8
    explorer.exe X:
    Read-Host -Prompt 'press enter when your done'
    ./VeraCryptPortable/App/VeraCrypt/VeraCrypt.exe /s /q /d /wipecache /l X
    rm -r C:\.catsyndrome\
    exit
}else {
    exit
}