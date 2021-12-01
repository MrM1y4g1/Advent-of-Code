Describe -name "AOC2021-01" {
    Context "Part-1"{
        It "First part has 7 depth increments" {
            Get-Content "$($PSScriptRoot)\input.test.txt" | Get-TotalDepthIncreasments | Should -BeExactly 7
        }
    }
    
    Context "Part-2"{
        It "There should be 8 rolling windows" {
            Get-Content "$($PSScriptRoot)\input.test.txt" | Get-SummerizeRollingValues -WindowSize 3 | Measure-Object -Sum |Select-Object -ExpandProperty Count | Should -BeExactly 8
        }

        It "There should be 5 depth increments" {
            Get-Content "$($PSScriptRoot)\input.test.txt" | Get-SummerizeRollingValues -WindowSize 3 | Get-TotalDepthIncreasments | Should -BeExactly 5
        }
    }
}