Describe -name "AOC2015-03" {
    Context "Part-1"{
        It "2 houses" {
            ">" | Get-CountOfHousesWithMultiplePackages | Should -BeExactly 2
        }
        
        It "4 houses" {
            "^>v<" | Get-CountOfHousesWithMultiplePackages | Should -BeExactly 4
        }
        
        It "2 houses" {
            "^v^v^v^v^v" | Get-CountOfHousesWithMultiplePackages | Should -BeExactly 2
        }
    }
    
    Context "Part-2"{
        It "3 houses" {
            "^v" | Get-CountOfHousesWithMultiplePackagesWithRobot | Should -BeExactly 3
        }
        
        It "3 houses" {
            "^>v<" | Get-CountOfHousesWithMultiplePackagesWithRobot | Should -BeExactly 3
        }
        
        It "11 houses" {
            "^v^v^v^v^v" | Get-CountOfHousesWithMultiplePackagesWithRobot | Should -BeExactly 11
        }
    }
}