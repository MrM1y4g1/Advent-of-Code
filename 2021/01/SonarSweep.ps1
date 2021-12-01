Import-Module Pester

function Get-TotalDepthIncreasments {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [int]
        $DepthMeasurement
    )

    begin{
        [int] $iAmountOfIncreasments = 0
        [int] $iLastMeasurement = $null
    }
    
    process {
        if($iLastMeasurement -ne 0 -and $iLastMeasurement -lt $DepthMeasurement){
            $iAmountOfIncreasments += 1
        }

        $iLastMeasurement = $DepthMeasurement
    }

    end{
        return $iAmountOfIncreasments
    }
}

Function Get-SummerizeRollingValues{
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [int]
        $Value,
        
        [Parameter(Mandatory=$false, ValueFromPipeline=$false)]
        [int]
        $WindowSize=3
    )

    begin{
        [array] $aValuePool = @()
    }
    
    process {
        $aValuePool += $Value
        
        if($aValuePool.Count -ge $WindowSize)
        {
            return $aValuePool | Select-Object -Last $WindowSize | Measure-Object -Sum | Select-Object -ExpandProperty Sum
        }
    }
}


Get-Content "$($PSScriptRoot)\input.txt" | Get-TotalDepthIncreasments
Get-Content "$($PSScriptRoot)\input.txt" | Get-SummerizeRollingValues -WindowSize 3 | Get-TotalDepthIncreasments