Describe -name "AOC2021-01" {
    Context "Part-1"{
        It "Multiplying these together produces 150" {
            Get-Content "$($PSScriptRoot)\input.test.txt" | Get-LocationSummary | Should -BeExactly 150
        }
    }
    Context "Part-1"{
        It "Multiplying these together produces 150" {
            Get-Content "$($PSScriptRoot)\input.test.txt" | Get-LocationSummary2 | Should -BeExactly 900
        }
    }
}