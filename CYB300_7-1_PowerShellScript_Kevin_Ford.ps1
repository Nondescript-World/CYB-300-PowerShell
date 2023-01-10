Set-Timezone -id “Tonga Standard Time”
set-date -date "02/29/2020 06:00"
$Password = read-host -AsSecureString “Enter password”
New-Localuser -Name “FKevin” -Password $Password -FullName "Kevin Ford” -PaswordNeverExpires
Get-Service w* | Out-File c:\W_Services.txt
Get-History | Out-File c:\CYB_300_History_Kevin_Ford.txt

Rename-Computer -NewName "K_Ford"
Set-Timezone -id “Mountain Standard Time”
Get-Service
Stop-Service -Name "Spooler" -Force
powercfg.exe /setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK 180
powercfg.exe /setactive SCHEME_CURRENT
Get-WinEvent -LogName 'Security' -MaxEvents 50 | Out-File c:\SecurityLog_Ford.txt



Get-History | Out-File c:\SecurityLog_Ford.txt






180 seconds is 3 minutes


param( 
    [int]$timeLimit 
) 
try 
{ 
     
    if($timeLimit) 
    { 
        "changing machine inactivity limit to "+ $timeLimit + " seconds" 
        $path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\' 
        $name = 'InactivityTimeoutSecs' 
        Set-ItemProperty -Path $path -Name $name -Value $timeLimit 
        "-----inactivity limit successfully updated-----" 
	 
    } 
    else 
    { 
        "-----------please provide machine inactivity limit as argument (in seconds)-----------" 
    } 
} 
catch { 
   Write-Output $_.Exception.Message 
} 




