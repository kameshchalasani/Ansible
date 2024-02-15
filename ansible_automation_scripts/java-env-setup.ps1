 # Set the Java 21 installation directory
$java21Dir = "C:\Program Files\Java\jdk-21"

# Set the environment variable JAVA_HOME to the Java 21 installation directory
[Environment]::SetEnvironmentVariable("JAVA_HOME", $java21Dir, [System.EnvironmentVariableTarget]::Machine)

# Add the Java 21 bin directory to the system PATH
$newPath = "$java21Dir\bin;" + [System.Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::Machine)

# Set the modified PATH
[Environment]::SetEnvironmentVariable("PATH", $newPath, [System.EnvironmentVariableTarget]::Machine)

# Notify the user that the Java 21 environment has been set
Write-Host "Java 21 environment has been set successfully."

# Optionally, you can check if Java is now accessible
java -version