$basepath="D:\Mindtree-HGV-sitecore902_azure_PaaS"
$SCSDK="$basepath\tools"
$SCTemplates="https://raw.githubusercontent.com/Sitecore/Sitecore-Azure-Quickstart-Templates/master/Sitecore%209.0.2/XP"
$DeploymentId = "MindDemoSitecoreDev"
$ResourceGroup = "mtest"
$LicenseFile = "$basepath\license.xml"
$CertificateFile = "$basepath\380A527DA2ADDE27C13F173E894FD7E1241008F0.pfx"
$SubscriptionId = "5dff9bea-5602-44f9-8398-587194d0d63b"
$Location="East US"
$ParamFile="$basepath\azuredeploy.parameters.json"
$Parameters = @{
"deploymentId"=$DeploymentId;
"authCertificateBlob" = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($CertificateFile))
}
Import-Module $SCSDK\Sitecore.Cloud.Cmdlets.psm1
Add-AzureRMAccount
Set-AzureRMContext -SubscriptionId $SubscriptionId
Start-SitecoreAzureDeployment -Name $ResourceGroup -Location $Location -ArmTemplateUrl "$SCTemplates/azuredeploy.json" -ArmParametersPath $ParamFile -LicenseXmlPath $LicenseFile -SetKeyValue $Parameters -Verbose
