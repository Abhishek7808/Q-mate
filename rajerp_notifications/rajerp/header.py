import os
os.environ['SERVER_NAME']
print("Cache-Control: no-cache, no-store, must-revalidate") # HTTP 1.1.
print("Pragma: no-cache") # HTTP 1.0.
print("Expires: 0") # Proxies.
if os.environ['HTTPS'] is None or os.environ['HTTPS'] == "off":
    redirect = 'https://' + os.environ['HTTP_HOST'] + os.environ['REQUEST_URI']
    print('HTTP/1.1 301 Moved Permanently')
    print('Location: ' + redirect)
    exit()



