Import-Module Pester

Describe -name "AOC2015-05" {
    Context "Part-1"{
        It "Should Be Nice!" {
            ("ugknbfddgicrmopn" | Get-NaughtyOrNice).Count | Should -BeExactly 1
            ("aaa" | Get-NaughtyOrNice).Count | Should -BeExactly 1
        }

        It "Should Be Naughty!" {
            ("jchzalrnumimnmhp" | Get-NaughtyOrNice).Count | Should -BeExactly 0
            ("haegwjzuvuyypxyu" | Get-NaughtyOrNice).Count | Should -BeExactly 0
            ("dvszwmarrgswjxmb" | Get-NaughtyOrNice).Count | Should -BeExactly 0
        }
    }
}