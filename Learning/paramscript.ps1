#get a breakdwon of error sources in the Sytem eventlog

Param(
    [string]$log = "System",
    [string]$Computername = $env:COMPUTERNAME,
    [int32]$newest = 500,
    [string]$reportTitle = "Event Log Report",
    [Parameter(Mandatory, HelpMessage = "Enter the path for the HTML File.")]
    [string]$Path
)

#start with a command that works in the console
$data = Get-EventLog -LogName $log -EntryType Error -Newest $newest -ComputerName $Computername |
    Group-Object -Property Source -NoElement

#Create an HTML report
$footer = "<h5><i>report run $(get-date)</i></h5>"
$css = "http://jdhitsolutions.com/sample.css"
$precontent = "<H1>$Computername</H1><H2>Last $newest error sources from $log</H2>"

$data | Sort-Object -Property Count, Name -Descending |
    Select Count, Name |
    ConvertTo-Html -Title $reportTitle -PreContent $precontent -PostContent $footer -CssUri $css |
    Out-File $Path

#Invoke-item C:\temp\systemresources.html