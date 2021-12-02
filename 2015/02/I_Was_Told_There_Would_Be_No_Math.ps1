function ConvertTo-Int {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        $Value
    )

    process {
        return [int] $Value
    }
}
function Multiply-Values {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        $Value
    )

    begin{
        [int] $iCurrentValue = $null
        [bool] $bFirstRun = $true
    }

    process {
        if($bFirstRun){
            $bFirstRun = $false
            $iCurrentValue = $Value
        }
        else{
            $iCurrentValue *= $Value
        }
    }

    end{
        return $iCurrentValue
    }
}

function Get-SurfaceSquareFeetPerPackage {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $Measurements
    )
    
    process {
        [int]$iLength, [int]$iWidth, [int]$iHeight = $Measurements -split 'x'
        [array]$aMeasurements = @()

        $aMeasurements += ($iLength*$iHeight)
        $aMeasurements += ($iLength*$iWidth)
        $aMeasurements += ($iHeight*$iWidth)
        
        return (($aMeasurements | Measure-Object -Sum | Select-Object -ExpandProperty Sum)*2) + ($aMeasurements | Sort-Object | Select-Object -First 1)
    }
}

function Get-RibbonLengthPerPackage {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $Measurements
    )
    
    process {
        [int]$iRibbonLength = $Measurements -split 'x' | ConvertTo-Int | Sort-Object | Select-Object -first 2 | ForEach-Object { $_*2 } | Measure-Object -Sum | Select-Object -ExpandProperty Sum
        [int]$iRibbonBowLength = $Measurements -split 'x' | ConvertTo-Int | Multiply-Values

        return $iRibbonLength + $iRibbonBowLength
    }
}

Get-Content "$($PSScriptRoot)\input.txt" | Get-SurfaceSquareFeetPerPackage | Measure-Object -Sum | Select-Object -ExpandProperty Sum
Get-Content "$($PSScriptRoot)\input.txt" | Get-RibbonLengthPerPackage | Measure-Object -Sum | Select-Object -ExpandProperty Sum