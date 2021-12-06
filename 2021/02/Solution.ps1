function Get-LocationSummary {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $NavigationInstruction
    )

    begin{
        [int] $iCurrentDepth = 0
        [int] $iCurrentLocation = 0
    }
    
    process {
        [string]$sAction, [int]$iAmount = $NavigationInstruction -split ' '

        switch($sAction){
            "forward" {
                $iCurrentLocation += $iAmount
            }

            "up" {
                $iCurrentDepth -= $iAmount
            }

            "down" {
                $iCurrentDepth += $iAmount
            }
        }
    }

    end{
        return $iCurrentDepth*$iCurrentLocation
    }
}

function Get-LocationSummary2 {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $NavigationInstruction
    )

    begin{
        [int] $iCurrentDepth = 0
        [int] $iCurrentLocation = 0
        [int] $iAimValue = 0
    }
    
    process {
        [string]$sAction, [int]$iAmount = $NavigationInstruction -split ' '

        switch($sAction){
            "forward" {
                $iCurrentLocation += $iAmount
                $iCurrentDepth += $iAmount*$iAimValue
            }

            "up" {
                $iAimValue -= $iAmount
            }

            "down" {
                $iAimValue += $iAmount
            }
        }
    }

    end{
        return $iCurrentDepth*$iCurrentLocation
    }
}

#Get-Content "$($PSScriptRoot)\input.txt" | Get-LocationSummary
Get-Content "$($PSScriptRoot)\input.txt" | Get-LocationSummary2
#Get-Content "$($PSScriptRoot)\input.txt" | Get-SummerizeRollingValues -WindowSize 3 | Get-TotalDepthIncreasments