$user = "admin"
$password = "password"
$address = "localhost"
$port = 8006

$database = @{
    user     = $user;
    password = $password;
    address  = $address;
    port     = $port;
    db       = "Documents";
}

$modules = @{
    user     = $user;
    password = $password;
    address  = $address;
    port     = $port;
    db       = "Modules";
}

$triggers = @{
    user     = $user;
    password = $password;
    address  = $address;
    port     = $port;
    db       = "Triggers";
}

$connections = @{
    database = $database;
    modules  = $modules;
    triggers = $triggers;
}