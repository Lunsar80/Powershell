#Set the Scriptsp Dir
$env:Scripts = "C:\Users\$($env:USERNAME)\Documents\GitHub\Powershell\"
cd $env:Scripts

#Welcome Message
Write-host "Hello $env:USERNAME.  Have a great $((get-date).DayOfWeek)." -foregroundcolor magenta

$env:COMPUTERNAME