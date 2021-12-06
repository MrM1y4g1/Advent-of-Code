function Get-NaughtyOrNice {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $StringValue
    )

    begin{
        [regex]$regexCheckVowel = "a|e|i|o|u"
        [regex]$regexCheckDoubleLetters = "aa|bb|cc|dd|ee|ff|gg|hh|ii|jj|kk|ll|mm|nn|oo|pp|qq|rr|ss|tt|uu|vv|ww|yy|zz"
        [regex]$regexRestrictedGroupings = "ab|cd|pq|xy"
    }

    process {
        [bool]$bHasThreeVowls   = ($regexCheckVowel.Matches($StringValue).Count -ge 3)
        [bool]$bHasNoRestricted = ($regexRestrictedGroupings.Matches($StringValue).Count -eq 0)
        [bool]$bHasDoubleLetter = ($regexCheckDoubleLetters.Matches($StringValue).Count -gt 0)

        if($bHasThreeVowls -and $bHasNoRestricted -and $bHasDoubleLetter){
            return "Nice"
        }
    }

    end{
    }
}

(Get-Content "$($PSScriptRoot)\input.txt" | Get-NaughtyOrNice).Count