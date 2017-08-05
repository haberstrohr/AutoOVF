$OVFConfig = Import-PowerShellDataFile .\configsample.psd1

$Applications = ($OVFConfig.Keys).Where( {$_ -ne "AllNodes"})

Foreach ($Application in $Applications) {
    Describe "$Application Environment" {
        Foreach ($node in $OVFConfig.$Application.Nodes) {
            Context "Verifying $node status" {
                $Session = New-PSSession -ComputerName $node
                Foreach ($TestType in $OVFConfig.$Application.TestType.Keys) {
                    if ($TestType -eq "Be") {
                        Foreach ($desired in $OVFConfig.$Application.TestType.$TestType.Keys) {
                            if ($desired -eq "Running") {
                                Foreach ($RunningKey in $OVFConfig.$Application.TestType.$TestType.$Desired.Keys) {
                                    if ($RunningKey -eq "Services") {
                                        $ServicesHash = $OVFConfig.$Application.TestType.$TestType.$Desired.Services
                                        $ServicesHash.keys | foreach {
                                            $Service = $ServicesHash.Item($_)
                                            $SvcDisplayName = $_
                                            It "The $SvcDisplayName ($Service) should $TestType $desired" {
                                                (Invoke-Command -Session $Session {Get-Service -Name $using:Service}).status | 
                                                    Should $TestType $desired
                                            }
                                        } # End foreach $servicename
                                    } # End if $runningkey -eq Services   
                                } # End Foreach $RunningKey
                            } # End if $desired -eq Running
                        } # End Foreach $status
                    } # End if $TestType -eq Be
                    if ($TestType -eq "BeExactly") {
                    } # End if $TestType -eq BeExactly
                    if ($TestType -eq "BeGreaterThan") {
                    } # End if $TestType -eq BeGreaterThan
                    if ($TestType -eq "BeLessThan") {
                    } # End if $TestType -eq BeLessThan
                    if ($TestType -eq "BeLike") {
                    } # End if $TestType -eq BeLike
                    if ($TestType -eq "BeLikeExactly") {
                    } # End if $TestType -eq BeLikeExactly
                    if ($TestType -eq "BeOfType") {
                    } # End if $TestType -eq BeOfType
                    if ($TestType -eq "Exist") {
                    } # End if $TestType -eq Exist
                    if ($TestType -eq "Contain") {
                    } # End if $TestType -eq Contain
                    if ($TestType -eq "ContainExactly") {
                    } # End if $TestType -eq ContainExactly
                    if ($TestType -eq "Match") {
                    } # End if $TestType -eq Match
                    if ($TestType -eq "MatchExactly") {
                    } # End if $TestType -eq MatchExactly
                    if ($TestType -eq "Throw") {
                    } # End if $TestType -eq Throw
                    if ($TestType -eq "BeNullOrEmpty") {
                    } # End if $TestType -eq BeNullOrEmpty
                } # End Foreach $TestType
                Foreach ($TestType in $OVFConfig.AllNodes.TestType.Keys) {
                    if ($TestType -eq "Be") {
                        Foreach ($desired in $OVFConfig.AllNodes.TestType.$TestType.Keys) {
                            if ($desired -eq "Running") {
                                Foreach ($RunningKey in $OVFConfig.AllNodes.TestType.$TestType.$Desired.Keys) {
                                    if ($RunningKey -eq "Services") {
                                        $ServicesHash = $OVFConfig.AllNodes.TestType.$TestType.$Desired.Services
                                        $ServicesHash.keys | foreach {
                                            $Service = $ServicesHash.Item($_)
                                            $SvcDisplayName = $_
                                            It "The $SvcDisplayName ($Service) should $TestType $desired" {
                                                (Invoke-Command -Session $Session {Get-Service -Name $using:Service}).status | 
                                                    Should $TestType $desired
                                            }
                                        } # End foreach $servicename
                                    } # End if $runningkey -eq Services   
                                } # End Foreach $RunningKey
                            } # End if $desired -eq Running
                        } # End Foreach $status
                    } # End if $TestType -eq Be
                    if ($TestType -eq "BeExactly") {
                    } # End if $TestType -eq BeExactly
                    if ($TestType -eq "BeGreaterThan") {
                        ForEach ($GreaterThanTest in $OVFConfig.AllNodes.TestType.$TestType.Keys) {
                            if ($GreaterThanTest -eq "FreeDiskSpace") {
                                $desiredpercent = (($desired = $OVFConfig.AllNodes.TestType.$TestType.FreeDiskSpace) * 100)
                                $disks = Get-WmiObject -ComputerName $node win32_logicaldisk -Filter "DriveType=3"
                                foreach ($disk in $disks) {
                                    $DriveLetter = $disk.DeviceID
                                    It "$DriveLetter has more than $desiredpercent% free space" {
                                        ($disk.freespace / $disk.size) | Should $TestType $desired
                                    } # End FreeSpace It block
                                } # End Foreach disk
                            } # End If FreeDiskSpace
                        } # End Foreach GreaterThanTest
                    } # End if $TestType -eq BeGreaterThan
                    if ($TestType -eq "BeLessThan") {
                    } # End if $TestType -eq BeLessThan
                    if ($TestType -eq "BeLike") {
                    } # End if $TestType -eq BeLike
                    if ($TestType -eq "BeLikeExactly") {
                    } # End if $TestType -eq BeLikeExactly
                    if ($TestType -eq "BeOfType") {
                    } # End if $TestType -eq BeOfType
                    if ($TestType -eq "Exist") {
                    } # End if $TestType -eq Exist
                    if ($TestType -eq "Contain") {
                    } # End if $TestType -eq Contain
                    if ($TestType -eq "ContainExactly") {
                    } # End if $TestType -eq ContainExactly
                    if ($TestType -eq "Match") {
                    } # End if $TestType -eq Match
                    if ($TestType -eq "MatchExactly") {
                    } # End if $TestType -eq MatchExactly
                    if ($TestType -eq "Throw") {
                    } # End if $TestType -eq Throw
                    if ($TestType -eq "BeNullOrEmpty") {
                    } # End if $TestType -eq BeNullOrEmpty
                } # End Foreach $TestType
                Remove-PSSession -Session $Session
            } # End Context block
        } # End Foreach $node
    } # End Describe Block
} # End Foreach $Application