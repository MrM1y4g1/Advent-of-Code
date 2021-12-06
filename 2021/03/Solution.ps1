function Get-PowerConsumption {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $ConsumptionString
    )

    begin{
        [hashtable]$hBitHistory = @{}
    }
    
    process {
        for( [int]$iIndex = 0 ; $iIndex -lt $ConsumptionString.Length ; $iIndex++ ){
            if($hBitHistory[$iIndex] -eq $null){
                $hBitHistory.Add($iIndex, @($ConsumptionString[$iIndex]))
            }
            else{
                $hBitHistory[$iIndex] += $ConsumptionString[$iIndex]
            }
        }
    }

    end{
        [string]$sGammaRate = ""
        [string]$sEpsilonRate = ""
        
        (0..($hBitHistory.Keys.Count-1)) | ForEach-Object{
            $aBitArray = $hBitHistory[$_]
            $iZeroCount = ($aBitArray | Where-Object { $_.ToString() -contains '0' }).Count

            $sGammaRate += if($iZeroCount -ge ($aBitArray.Count-$iZeroCount)) { "0" } else { "1" }
            $sEpsilonRate += if($iZeroCount -ge ($aBitArray.Count-$iZeroCount)) { "1" } else { "0" }
        }

        [int]$iGammaRate = [convert]::ToInt32($sGammaRate, 2)
        [int]$iEpsilonRate = [convert]::ToInt32($sEpsilonRate, 2)

        return ($iGammaRate*$iEpsilonRate)
    }
}
function Get-OxygenConsumptionRating {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $ConsumptionString
    )

    begin{
        [hashtable]$hBitHistory = @{}
    }
    
    process {
        for( [int]$iIndex = 0 ; $iIndex -lt $ConsumptionString.Length ; $iIndex++ ){
            if($hBitHistory[$iIndex] -eq $null){
                $hBitHistory.Add($iIndex, @($ConsumptionString[$iIndex]))
            }
            else{
                $hBitHistory[$iIndex] += $ConsumptionString[$iIndex]
            }
        }
    }

    end{
        [string]$sGammaRate = ""
        [string]$sEpsilonRate = ""
        
        (0..($hBitHistory.Keys.Count-1)) | ForEach-Object{
            $aBitArray = $hBitHistory[$_]
            $iZeroCount = ($aBitArray | Where-Object { $_.ToString() -contains '0' }).Count

            $sGammaRate += if($iZeroCount -ge ($aBitArray.Count-$iZeroCount)) { "0" } else { "1" }
            $sEpsilonRate += if($iZeroCount -ge ($aBitArray.Count-$iZeroCount)) { "1" } else { "0" }
        }

        [int]$iGammaRate = [convert]::ToInt32($sGammaRate, 2)
        [int]$iEpsilonRate = [convert]::ToInt32($sEpsilonRate, 2)

        return ($iGammaRate*$iEpsilonRate)
    }
}

Get-Content "$($PSScriptRoot)\input.txt" | Get-PowerConsumption