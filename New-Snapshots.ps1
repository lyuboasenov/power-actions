param(
  [VMware.VimAutomation.ViCore.Types.V1.Inventory.VIContainer[]] $location,
  [string] $snapshotName
)

$vm = $null
if ($location) {
  $vm = Get-VM -Location $vm
} else {
  $vm = Get-VM
}

if ([string]::IsNullOrEmpty($snapshotName)) {
  $snapshotName = "vm_snapshot"
}

$suffix = [DateTime]::Now::ToString("yyyy_MM_dd_HH_mm")


$snapstatus = $vm | New-Snapshot -name "$($snapshotName)_$($suffix)" -confirm:$false -runasync:$true
$snapstatus | Wait-Task
