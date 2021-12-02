Import-Module Pester

Describe -name "AOC2015-04" {
    Context "Part-1"{
        It "Should Be 609043" {
            "abcdef" | Get-LowestSaltSuffix -StartValue 609000 | Should -BeExactly 609043
        }
        
        It "Should Be 1048970" {
            "pqrstuv" | Get-LowestSaltSuffix -StartValue 1048900 | Should -BeExactly 1048970
        }
    }
}