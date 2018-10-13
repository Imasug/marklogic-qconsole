Set-Variable -Name ServerURIFields -Value @("user", "password", "address", "port", "db") -Option Constant

function Create-MarklogicServerURI {
    param (
        [Parameter(Mandatory = $true)]
        [hashtable]
        $infoMap
    )

    $keys = $infoMap.Keys
    foreach ($field in $ServerURIFields) {
        if ($keys -notcontains $field) {
            throw "You must be set $field!"
        }
    }

    $serverURI = "xcc://{0}:{1}@{2}:{3}/{4}" -f $infoMap.user, $infoMap.password, $infoMap.address, $infoMap.port, $infoMap.db

    return $serverURI
}
