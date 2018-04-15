$From = (Read-host -Prompt "UPN of Sender")

$MailParameters = @{
 From = $From
 To = (Read-Host -Prompt "Recipients Email Address")
 Subject = 'Test from PowerShell'
 Body = "Hello World"
 SmtpServer = 'smtp.office365.com'
 Port = '587'
 Credential = Get-Credential -UserName $From -Message 'Specify Office 365 user credential'
 UseSsl = $true
 }

Send-MailMessage @MailParameters
