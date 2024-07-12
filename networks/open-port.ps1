<#

Open port and receive a file


Explanation:
Loop (while ($true)): This loop continues indefinitely ($true is always true), waiting for incoming connections.

AcceptTcpClient(): Waits for a client to connect to the listener. Once a connection is accepted, it proceeds to receive the file.

Read(): Reads data from the network stream ($stream) into a buffer ($buffer), writing it to the file stream ($fileStream).

Close(): Closes the file stream, network stream, and client connection after the file transfer is complete.

Write-Host: Outputs messages to the PowerShell console indicating the status of the script.

Stopping the Listener:
After the file is received and processed (in this case, saved as received_file.zip), the script breaks out of the while loop using break.
After breaking out of the loop, the script calls $Listener.Stop() to explicitly stop the TCP listener. This ensures that the script releases the port (9090 in this case) and stops listening for further connections.

Automatic Closing:
The listener ($Listener) does not automatically close itself after receiving a file. You need to explicitly call $Listener.Stop() to close the listener and release the port.
However, in the provided script, $Listener.Stop() is called after the while loop exits due to the break statement, which effectively stops the listener after receiving one file.

By following this approach, you can control when the listener starts and stops, ensuring it operates as expected for handling file transfers via TCP/IP.






#>

$port = 9090  # Choose a port number
$Listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Any, $port)
$Listener.Start()
Write-Host "Listening on port $port..."

while ($true) {
    $client = $Listener.AcceptTcpClient()
    Write-Host "Connected!"

    $stream = $client.GetStream()
    $buffer = New-Object byte[] 1024
    $fileStream = [System.IO.File]::Create("received_file.zip")
    $bytesRead = 0

    while (($bytesRead = $stream.Read($buffer, 0, $buffer.Length)) -gt 0) {
        $fileStream.Write($buffer, 0, $bytesRead)
    }

    $fileStream.Close()
    $stream.Close()
    $client.Close()
    Write-Host "File received and saved as received_file.zip"
    # Remove the break statement if you want to continue listening for more files
    break
}

$Listener.Stop()
