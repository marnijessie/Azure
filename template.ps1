$fileName = 'C:\users\marni.jessie\desktop\azure\template2\url-list.csv'

Import-Csv $fileName  | Foreach-Object { 
    $Parameters = @{}
    $Parameters.Add('subscriptionId', '174bc656-84e5-4413-a417-0780f055d719')
    $Parameters.Add('aiResourceGroupName', 'DH-AZR-C01-UOPEN-VM-DV-001')
    $Parameters.Add('notificationEmailAddress', 'marni.jessie@dh.com')
    $Parameters.Add('webTestName', $_.Name)
    $Parameters.Add('appName', 'UOpen_WebCheck')
    $Parameters.Add('URL', $_.URL)

    New-AzureRMResourceGroupDeployment `
        -ResourceGroupName DH-AZR-C01-UOPEN-VM-DV-001 `
        -Templatefile .\urlmonitor2.json `
        -TemplateParameterObject $Parameters 
}