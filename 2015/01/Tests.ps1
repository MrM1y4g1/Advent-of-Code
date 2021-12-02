Describe -name "AOC2015-01" {
    Context "Part-1"{
        It "Should be floor 0" {
            "(())" | Get-FloorLocation | Should -BeExactly 0
            "()()" | Get-FloorLocation | Should -BeExactly 0
        }
        
        It "Should be floor 3" {
            "(((" | Get-FloorLocation | Should -BeExactly 3
            "(()(()(" | Get-FloorLocation | Should -BeExactly 3
        }
        
        It "Should be floor 3" {
            "))(((((" | Get-FloorLocation | Should -BeExactly 3
        }
        
        It "Should be floor -1" {
            "())" | Get-FloorLocation | Should -BeExactly -1
            "))(" | Get-FloorLocation | Should -BeExactly -1
        }
        
        It "Should be floor -1" {
            ")))" | Get-FloorLocation | Should -BeExactly -3
            ")())())" | Get-FloorLocation | Should -BeExactly -3
        }
    }

    Context "Part-2"{
        It "Should be 1 step" {
            ")" | Get-HowManyStepsToTheBasement | Should -BeExactly 1
        }
        
        It "Should be 5 steps" {
            "()())" | Get-HowManyStepsToTheBasement | Should -BeExactly 5
        }
    }
}