$here = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
Set-Variable -Name ClassPath -Value "$here\lib\marklogic-util.jar" -Option Constant
Set-Variable -Name MainClass -Value "jp.imanaga.marklogic_util.QueryRunnerImpl" -Option Constant

function Adhoc-Query {
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $ServerURI,
        [Parameter(Mandatory = $true)]
        [string]
        $FileName
    )

    if (!(Test-Path $FileName)) {
        throw "$FileName doesn't exist!"
    }

    $query = Get-Content $FileName -Raw -Encoding UTF8
    # TODO is this code ok?
    $query = $query.Replace('"', "'")
    java -cp $ClassPath $MainClass $ServerURI $query

    return
}
