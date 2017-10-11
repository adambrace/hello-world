#Region
$region = "us-west-1"

$StoredCred = "CHANGETHESE"

Import-Module AWSPowerShell

$templatebody = [String]((get-content .\ec2HelloWorldStack.yml) -join "`n")

New-CFNStack -StackName HelloWorld3 -TemplateBody $templatebody -StoredCredentials $StoredCred -Region $region

Start-Sleep -s 300

$CFNStack = Get-CFNStack -StackName HelloWorld -StoredCredentials $StoredCred -Region $region
$CreatedURL = ($CFNStack.Outputs | ?{$_.outputkey -eq "WebsiteURL"}).OutputValue
$matched = invoke-webrequest $CreatedURL  | Select-String -InputObject {$_.Content} -Pattern "Automation for the People"


if($matched) {            
    Write-Host "Deployment Sucess! - Automation for the People - Was found at $CreatedURL"            
} else {            
    Write-Host "Something Messed up. Better go review!"            
}
Read-Host -Prompt “Press Enter to exit”
