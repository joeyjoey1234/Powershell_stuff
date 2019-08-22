
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

Function Login-in{ 
    mkdir C:/.catsyndrome/chrome/storage/cache/browser/history/huh > $null
    cp ./id_rsa.pub C:/.catsyndrome/chrome/storage/cache/browser/history/huh/ > $null
    ./VeraCryptPortable/App/VeraCrypt/VeraCrypt.exe /s /q /v huh.txt /l X /a /password $password /pim 485 /k C:\.catsyndrome\chrome\storage\cache\browser\history\huh\id_rsa.pub /k C:\.catsyndrome\chrome\storage\cache\browser\history\huh
    echo "Sleeping for 15 sec Worsecase mount time"
    Start-Sleep -s 15
    Stop-Process -Name chrome -Force
    echo "Removing any profile there is currently for chrome"
    Remove-Item -Path "$($env:USERPROFILE)\AppData\Local\Google\Chrome\User Data\Profile 1" -Recurse -Force
    echo "Copying Profile"
    Copy-Item -Path "X:\ChromeData\Profile 1" -Destination "$($env:USERPROFILE)\AppData\Local\Google\Chrome\User Data\" -Recurse -Force
    explorer.exe X:
    Read-Host -Prompt 'press enter when your done'
    Stop-Process -Name chrome -Force
    echo "Del old Profile"
    Remove-Item -Path "X:\ChromeData\Profile 1" -Recurse -Force
    echo "Copying new Profile"
    Copy-Item -Path "$($env:USERPROFILE)\AppData\Local\Google\Chrome\User Data\Profile 1" -Destination "X:\ChromeData\" -Recurse -Force
    echo "Removing Traces & Unmountng X:"
    Remove-Item -Path "$($env:USERPROFILE)\AppData\Local\Google\Chrome\User Data\" -Recurse -Force
    ./VeraCryptPortable/App/VeraCrypt/VeraCrypt.exe /s /q /d /wipecache /l X
    ./CCleaner/CCleaner.exe /AUTO
    rm -r C:\.catsyndrome\

}


Function Check-and-Login{

    if($password_hash -eq $hash_check) {
        Login-in
        exit
    }else {
        echo "That was wrong you dumb fuck"
        $password = Read-Host -Prompt 'Input your password' -AsSecureString
        $password = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
        $password_hash = Get-StringHash $password "MD5"
        Check-and-Login
    }
}

Check-and-Login