param (
    [string] $FileName
)

. ./Functions/Adhoc-Query.ps1
. ./Functions/Create-MarkLogicServerURI.ps1
. ./Connection.ps1

# TODO test
if (!(Test-Path $FileName)) {
    throw "$FileName doesn't exist!"
}

$file = Get-Item $FileName
$target = $file.Directory.Name

# TODO test
if (!$connections.ContainsKey($target)) {
    throw "$target is invalid! The connection isn't registered!"
}

$serverURI = Create-MarkLogicServerURI $connections[$target]

$response = Adhoc-Query $serverURI $FileName | ConvertFrom-Json

# $response.results | Format-List

$response.results
