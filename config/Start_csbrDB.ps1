# Defining the Ports
$mongodbPort = 27017
$mysqlPort = 3306

# Defining MongoDB and MySQL process names
$mongodbProcessName = "mongod"
$mysqlProcessName = "mysqld"

# Defining the path to MongoDB executable and config file
$mongodbPath = "C:\Program Files\MongoDB\Server\8.0\bin\mongod.exe"
$mongodbConfigPath = "C:\Users\Nicho\OneDrive\Desktop\personal Projects\NoSQL_LynknSync_SQL\mongod.cfg"

# Defining the path to MySQL executable and config file
$mysqlPath = "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqld.exe"
$mysqlConfigPath = "C:\Users\Nicho\OneDrive\Desktop\Personal Projects\NoSQL_LynknSync_SQL\config\mySQL_config.js"

# Checking if services are running on the specified Port
function isITon {
    param (
        [string]$processName,
        [int]$expectedPort
    )
    # Check the Process by name
    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
    if ($process) {
        # Get the process ID
        $processId = $process.Id
        # Check for listening ports by the process ID
        $netstatOutput = netstat -ano | Select-String $processId
        $port = $null
        if ($netstatOutput) {
            # Extract the port number from the output
            if ($netstatOutput -match ":(\d+)$") {
                $port = $matches[1]
            }
        }

        if ($port) {
            # Check if the port matches the expected port
            if ($port -eq $expectedPort) {
                Write-Host "$processName is running on the expected port $expectedPort."
            }
            else {
                Write-Host "$processName is not running on the expected port. It is running on port $port."
            }
        }
        else {
            Write-Host "$processName is not listening on any port."
        }
    }
    else {
        Write-Host "$processName is not running."
    }
}

# Starting MongoDB with specialized config file
Write-Host "Starting MongoDB on Port 27017.."
Write-Host "Using different Config file"
Start-Process $mongodbPath -ArgumentList "--config $mongodbConfigPath"

# Checking MongoDB Port
Write-Host "Checking MongoDB..."
isITon -processName $mongodbProcessName -expectedPort $mongodbPort

# Starting MySQL with specialized config
Write-Host "Starting MySQL with custom config"
Start-Process $mysqlPath -ArgumentList "--defaults-file=$mysqlConfigPath"

# Checking MySQL Port
Write-Host "Checking MySQL..."
isITon -processName $mysqlProcessName -expectedPort $mysqlPort