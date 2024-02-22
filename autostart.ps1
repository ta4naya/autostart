params (
    [string[]]$ResourceGroups
)

function  AutoVMStart {
    [string]$ResourceGroupName
    $vms = Get-AzVm -ResourceGroupName $ResourceGroupName
     # Start each VM
    foreach ($vm in $vms) {
        
        Start-AzVM -ResourceGroupName $ResourceGroupName -Name $vm.Name -ErrorAction Continue
    }
}

Connect-Az -Identity
foreach ($rg in $ResourceGroups) {
    AutoVMStart -ResourceGroupName $rg
}
