from html.parser import HTMLParser
import os
print("Cache-Control: no-cache, no-store, must-revalidate") # HTTP 1.1.
print("Pragma: no-cache")  # HTTP 1.0.
print("Expires: 0") # Proxies.
if os.environ['HTTPS'] is None or os.environ['HTTPS'] == "off":
    redirect = 'https://' + os.environ['HTTP_HOST'] + os.environ['REQUEST_URI']
    print('HTTP/1.1 301 Moved Permanently')
    print('Location: ' + redirect)
    exit()


HTMLParser.feed('<!DOCTYPE html><html> <head> <link rel="manifest" href="/manifest.json"/> <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script><script>var OneSignal=window.OneSignal || []; OneSignal.push(function(){OneSignal.init({appId: "eada2698-ce33-411e-b001-d488b2999608",});}); OneSignal.push(function(){OneSignal.isPushNotificationsEnabled().then(function(isEnabled){if (isEnabled){console.log("Push notifications are enabled!");}else{console.log("Push notifications are not enabled yet.");window.location.href="https://divaksh.com/rajerp/";}});}); </script> <title>RajERP Update Notifier</title><meta property="og:title" content="RajERP Update Notifier"/><meta property="og:description" content="Get updates from Raj ERP that matter to you"/><meta property="og:url" content="https://divaksh.com/rajerp/"/><meta property="og:image" content="https://divaksh.com/rajerp/update/rajerp-logo.png"/> <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"> </head> <body><div class="container h-100"> <div class="row h-100 justify-content-center align-items-center" style="margin-top: 10px"> <div class="col-sm text-center"><img src="/rajerp/update/rajerp-logo.png" class="rounded mx-auto d-block" alt="Raj ERP"></div><div class="col-sm text-center" style="margin-top: 20px;"><h5>Hold tight! RajERP does not seem to be working right now.</h5></br> </div><div class="col-sm text-center"><div class="onesignal-customlink-container"></div></div></div></div></body></html>')