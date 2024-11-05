Connect-AzAccount

$Location="West Europe"
$ResourceGroupName="daniaz204learningPlan"
$AppServicePlanName="daniaz204learningPlan"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

New-AzAppServicePlan -ResourceGroupName $ResourceGroupName -Name $AppServicePlanName -Location $Location -Tier Basic

$AppName="daniaz204learningwebapp2"

New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $AppName -AppServicePlan $AppServicePlanName

$githubrepo="https://github.com/DaniFreckles/hello-world"

$PropertiesObject=@{
	repoUrl=$githubrepo;
	branch="master";
	isManuelIntergration="true"
}

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroupName -ResourceType Microsoft.Web/sites/seourcecontrols -ResourceName $AppName/web -ApiVersion 2024-04-01 -Force
