$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

$serverURI = "xcc://admin:password@localhost:8000/Documents"
Describe "Adhoc-Query" {
    Context "Normal" {
        It "Normal" {
            $fileName = ".\test.xqy"
            Adhoc-Query $serverURI $fileName | Should Be $true
        }
    }
    Context "Abnormal" {
        It "When the file doesn't exist" {
            $fileName = ".\xxx.xqy"
            { Adhoc-Query $serverURI $fileName } | Should Throw
        }
    }
}
