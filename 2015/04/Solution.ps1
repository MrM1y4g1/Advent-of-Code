function Get-MD5Hash {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $Value
    )
    
    begin {
        $MD5Provider  = [Security.Cryptography.MD5CryptoServiceProvider]::new()
        $UTF8         = [Text.UTF8Encoding]::UTF8
    }

    process {
        return ($MD5Provider.ComputeHash($UTF8.GetBytes($Value)) | ForEach-Object { $_.ToString("x2") }) -join ""
    }
}

function Get-LowestSaltSuffix {
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]
        $SecretKey,

        [Parameter(Mandatory=$false, ValueFromPipeline=$false)]
        [int]
        $HowManyZeros = 5,

        [Parameter(Mandatory=$false, ValueFromPipeline=$false)]
        [string]
        $StartValue = -1
    )

    begin{
        $sLikeString = ((1..$HowManyZeros) | ForEach-Object { 0 }) -join ""
    }

    process {
        [int]$iNumber = $StartValue

        do {
            $iNumber += 1

            $sCurrentCode = ("$($SecretKey)$($iNumber)" | Get-MD5Hash).Substring(0, $HowManyZeros)
        }
        until ($sCurrentCode -eq $sLikeString)

        return $iNumber
    }
}

Get-Content "$($PSScriptRoot)\input.txt" | Get-LowestSaltSuffix
Get-Content "$($PSScriptRoot)\input.txt" | Get-LowestSaltSuffix -HowManyZeros 6