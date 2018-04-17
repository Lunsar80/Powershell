#Mirror group membership from Domain A to another group on Domain B

Param(
    [Parameter(Mandatory, HelpMessage = "Enter the name of FQDN of the source AD Server")]
    [string]$ADServer1,
    [Parameter(Mandatory, HelpMessage = "Enter the name of FQDN of the destination AD Server.")]
    [string]$ADServer2,
    [Parameter(Mandatory, HelpMessage = "Enter the name of source group")]
    [string]$group1,
    [Parameter(Mandatory, HelpMessage = "Enter the name of destination group.")]
    [string]$group2
)
# Get account with sufficient credentials
$creds = Get-Credential

#Get group members from $group1 on domainA and $group2 on domainB
$users = Get-ADGroupMember -Server $ADServer1 -Identity $group1 | Select-Object name
ForEach ($u in $users) {
    $u = $u.name -replace ' ', '.'
    Add-ADGroupMember -Server $ADServer2 -Credential $creds -Identity $group2 -Members $u
    Clear-Variable u
}