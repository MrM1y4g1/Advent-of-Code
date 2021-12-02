function Add-PresentToHouse{
    param (
        [Parameter(Mandatory=$true)]
        [hashtable]
        $HouseMatrix,
        
        [Parameter(Mandatory=$true)]
        [int]
        $X,
        
        [Parameter(Mandatory=$true)]
        [int]
        $Y
    )
    
    process {
        if($HouseMatrix["$($X),$($Y)"] -ne $null){
            $HouseMatrix["$($X),$($Y)"] += 1
        }
        else{
            $HouseMatrix.Add("$($X),$($Y)", 1)
        }

        return $HouseMatrix
    }
}
function Get-CountOfHousesWithMultiplePackages {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $NavigationPath
    )
    
    begin {
        [int]$iCurrentX = 0
        [int]$iCurrentY = 0
        [hashtable]$hHouse2PresentMatrix = @{"0,0"=1}
    }

    process {
        for( [int]$i=0 ; $i -lt $NavigationPath.Length ; $i++ ){
            switch($NavigationPath[$i]){
                "^" {
                    $iCurrentX += 1
                    $hHouse2PresentMatrix = Add-PresentToHouse -X $iCurrentX -Y $iCurrentY -HouseMatrix $hHouse2PresentMatrix
                }
                "v" {
                    $iCurrentX -= 1
                    $hHouse2PresentMatrix = Add-PresentToHouse -X $iCurrentX -Y $iCurrentY -HouseMatrix $hHouse2PresentMatrix
                }
                ">" {
                    $iCurrentY += 1
                    $hHouse2PresentMatrix = Add-PresentToHouse -X $iCurrentX -Y $iCurrentY -HouseMatrix $hHouse2PresentMatrix
                }
                "<" {
                    $iCurrentY -= 1
                    $hHouse2PresentMatrix = Add-PresentToHouse -X $iCurrentX -Y $iCurrentY -HouseMatrix $hHouse2PresentMatrix
                }
            }
        }
    }

    end {
        $hHouse2PresentMatrix.Count
    }
}
function Get-CountOfHousesWithMultiplePackagesWithRobot {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $NavigationPath
    )
    
    begin {
        [array]$aCurrentX = @(0,0)
        [array]$aCurrentY = @(0,0)
        [hashtable]$hHouse2PresentMatrix = @{"0,0"=2}
    }

    process {
        for( [int]$i=1 ; $i -le $NavigationPath.Length ; $i++ ){
            $sDirection = $NavigationPath[$i-1]
            $RoboNoRobo = ($i % 2)

            switch($sDirection){
                "^" {
                    $aCurrentX[$RoboNoRobo] += 1
                    $hHouse2PresentMatrix = Add-PresentToHouse -X $aCurrentX[$RoboNoRobo] -Y $aCurrentY[$RoboNoRobo] -HouseMatrix $hHouse2PresentMatrix
                }
                "v" {
                    $aCurrentX[$RoboNoRobo] -= 1
                    $hHouse2PresentMatrix = Add-PresentToHouse -X $aCurrentX[$RoboNoRobo] -Y $aCurrentY[$RoboNoRobo] -HouseMatrix $hHouse2PresentMatrix
                }
                ">" {
                    $aCurrentY[$RoboNoRobo] += 1
                    $hHouse2PresentMatrix = Add-PresentToHouse -X $aCurrentX[$RoboNoRobo] -Y $aCurrentY[$RoboNoRobo] -HouseMatrix $hHouse2PresentMatrix
                }
                "<" {
                    $aCurrentY[$RoboNoRobo] -= 1
                    $hHouse2PresentMatrix = Add-PresentToHouse -X $aCurrentX[$RoboNoRobo] -Y $aCurrentY[$RoboNoRobo] -HouseMatrix $hHouse2PresentMatrix
                }
            }
        }
    }

    end {
        $hHouse2PresentMatrix.Count
    }
}

Get-Content "$($PSScriptRoot)\input.txt" | Get-CountOfHousesWithMultiplePackages
Get-Content "$($PSScriptRoot)\input.txt" | Get-CountOfHousesWithMultiplePackagesWithRobot