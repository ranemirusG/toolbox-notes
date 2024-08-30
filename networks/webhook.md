# Webhook

A webhook is an HTTP request, triggered by an event in a source system and sent to a destination system, often with a payload of data.







## Webhooks vs polling

Polling is when your application periodically calls an API to check if an event has occurred or new data exists. Webhooks, on the other hand, push data down to your application when an event occurs in real-time.

To capture the difference between these two approaches with a relatable example:
- Polling is like going to the post office to check if you have new mail.
- Using webhooks is basically having mail delivered to your house every time you have new mail simply by giving the postman your house address.

Polling is more resource-heavy compared to webhooks, as it can take multiple network requests before new information is discovered, while webhooks only make network requests when there is new information.









## Resources

- <https://webhook.site/>
- <https://beeceptor.com/>



### Python server to get the request

```python
import http.server
import logging

class RequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        logging.basicConfig(filename='server.log', level=logging.INFO)
        logging.info(f"Received GET request: {self.path}")
        
        # Log the full request path, including query parameters
        print(f"Request Path: {self.path}")
        
        # Respond with a simple 200 OK message
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b'Hello, this is your local Python server!')

if __name__ == '__main__':
    server_address = ('', 9999)  # Serve on localhost at port 9999
    httpd = http.server.HTTPServer(server_address, RequestHandler)
    print("Starting server on port 9999...")
    httpd.serve_forever()
```




