$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Create-MarklogicServerURI" {
    Context "Normal" {
        It "Normal" {
            $infoMap = @{
                user     = "user";
                password = "password";
                address  = "address";
                port     = "port";
                db       = "db";
            }
            Create-MarklogicServerURI $infoMap | Should Be "xcc://user:password@address:port/db"
        }
    }
    Context "Abnormal" {
        It "Member doesn't exist" {
            $infoMap = @{
                password = "password";
                address  = "address";
                port     = "port";
                db       = "db";
            }
            { Create-MarklogicServerURI $infoMap } | Should Throw
            $infoMap = @{
                xxx      = "xxx"
                password = "password";
                address  = "address";
                port     = "port";
                db       = "db";
            }
            { Create-MarklogicServerURI $infoMap } | Should Throw
        }
    }
}
