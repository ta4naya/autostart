param (
    [string[]]$resourceGroups,
    [string]$subscriptionId
)

function AutoVMStart {
    param (
        [string]$ResourceGroupName
    )

    $vms = Get-AzVm -ResourceGroupName $ResourceGroupName
    # Start each VM
    foreach ($vm in $vms) {
        Write-Host "Starting VM: $($vm.Name) in Resource Group: $ResourceGroupName"
        Start-AzVM -ResourceGroupName $ResourceGroupName -Name $vm.Name -ErrorAction Continue
    }
}

# Assuming Managed Identity for Azure authentication
Connect-AzAccount -Identity

# Set the subscription context
Set-AzContext -SubscriptionId $subscriptionId

foreach ($rg in $resourceGroups) {
    AutoVMStart -ResourceGroupName $rg
}

