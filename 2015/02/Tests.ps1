Describe -name "AOC2015-02" {
    Context "Part-1"{
        It "Should be 58 square feet" {
            "2x3x4" | Get-SurfaceSquareFeetPerPackage | Should -BeExactly 58
        }
        
        It "Should be 42 square feet" {
            "1x1x10" | Get-SurfaceSquareFeetPerPackage | Should -BeExactly 43
        }
    }

    Context "Part-2"{
        It "Should be 34 feet" {
            "2x3x4" | Get-RibbonLengthPerPackage | Should -BeExactly 34
        }
        
        It "Should be 14 feet" {
            "1x1x10" | Get-RibbonLengthPerPackage | Should -BeExactly 14
        }
    }
}