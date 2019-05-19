

lkfjsdflkjsdflks jdflksdjf lskdjf lskdjflskjflsdkflkjdsf
flksjdflsdkfsjdklf

$adminUPN="admin@m365x225506.onmicrosoft.com"
$adminPW="gavdgavd@5910"
$orgName="m365x225506"
#[System.Management.Automation.PSCredential]$userCredential = New-Object System.Management.Automation.PSCredential($adminUPN, $adminPW) 
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential

$allSitesSPO = Get-SPOSite
Write-Host "-----------------------------------------"
Write-Host "Number of Site Colls - " $allSitesSPO.Count
Write-Host "-----------------------------------------"
foreach($oneSite in $allSitesSPO){
    Write-Host "Title       : " $oneSite.Title
    Write-Host "URL         : " $oneSite.Url
    #Write-Host "Template    : " $oneSite.Template
    #Write-Host "Status      : " $oneSite.Status
    #Write-Host "Storage (MB): " $oneSite.StorageMaximumLevel
    #Write-Host "Used (MB)   : " $oneSite.StorageUsage
    #Write-Host "Resources   : " $oneSite.UserCodeMaximumLevel
    #Write-Host "Owner       : " $oneSite.Owner
    #Write-Host "Sharing     : " $oneSite.SharingCapability
    #Write-Host "subsites    : " $oneSite.WebsCount
    #Write-Host "-----------------------------------------"

    $Groups = Get-SPOSiteGroup -Site $oneSite.Url
    Foreach($Group in $Groups){
        Foreach($Role in $Group.Roles){
            If ($Role.Contains("Full Control")){
                Write-Host "GroupTitle  : " $Group.Title
                Write-Host "GroupUsers  : " $Group.Users
            #     $users = $Group.Users -join ‘ ‘
            #     $title = $Group.Title
            #     $props = @{
            #         Title = $title
            #         Users = $users
            #         Website = $site.Url
            #    }
            }
        }
    }
    Write-Host "-----------------------------------------"
}
