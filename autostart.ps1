param (
    [string[]]$resourceGroups,
    [string]$subscriptionid
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



# Set the subscription context
Set-AzContext -SubscriptionId $subscriptionid

foreach ($rg in $resourceGroups) {
    AutoVMStart -ResourceGroupName $rg
}

