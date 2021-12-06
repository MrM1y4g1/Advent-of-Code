function Get-FloorLocation {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $Parenthesis
    )

    begin{
        [int]$iCurrentFloor = 0
    }
    
    process {
        for( $i=0 ; $i -lt $Parenthesis.Length ; $i++ ){
            if($Parenthesis[$i] -eq '(')
            {
                $iCurrentFloor += 1
            }
            
            if($Parenthesis[$i] -eq ')')
            {
                $iCurrentFloor -= 1
            }
        }
    }

    end{
        return $iCurrentFloor
    }
}

function Get-HowManyStepsToTheBasement {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $Parenthesis
    )

    begin{
        [int]$iCurrentFloor = 0
    }
    
    process {
        for( $i=0 ; $i -lt $Parenthesis.Length ; $i++ ){
            if($Parenthesis[$i] -eq '(')
            {
                $iCurrentFloor += 1
            }
            
            if($Parenthesis[$i] -eq ')')
            {
                $iCurrentFloor -= 1
            }

            if($iCurrentFloor -eq -1){
                return $i+1
            }
        }
    }
}


Get-Content "$($PSScriptRoot)\input.txt" | Get-FloorLocation
Get-Content "$($PSScriptRoot)\input.txt" | Get-HowManyStepsToTheBasement