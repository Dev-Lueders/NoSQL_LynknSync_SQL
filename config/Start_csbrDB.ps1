# Defining the path to MOngoDB executable and config file
$mongodbPath = "C:\Program files\MongoDB\Server\8.0\mongod.exe"
$mongodbConfigPath ="C:\Users\Nicho\OneDrive\Desktop\perosnal Projects\NoSQL_LynknSync_SQL\mongod.cfg"

#Defining the path to MySQL executable and config file
$mysqlPath = "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqld.exe"
$mysqlConfigPath = "C:\Users\Nicho\OneDrive\Desktop\Perosnal Projects\NoSQL_LynknSync_SQL\config\my.cnf"

#Starting MongoDB with specialized config file
Write-Host "Starting MongoDB on Port 27018.."
Write-Host "Using different Config file"
Start-Process $mongodbPath -ArgumentList "--config $mongodbConfigPath"

#Starting MySQL with specialized config
Write-Host "Starting MySQL with custom config"
Start-Process $mysqlPath -ArgumentList "--defaults-file=$mysqlConfigPath"

Write-Host "Mongo is running on Port 27018..."
Write-Host "MySQL is running on Port 3307..."