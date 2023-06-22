param(
  [VMware.VimAutomation.ViCore.Types.V1.Inventory.VMHost] $location,
  [string] $snapshotName
)

$vm = $null
if ($location) {
  $vm = Get-VM -Location $vm
} else {
  $vm = Get-VM
}

$snapstatus = $vm | Remove-Snapshot -confirm:$false -runasync:$true
$snapstatus | Wait-Task
