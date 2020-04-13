# RajERP Automation
We have built a state of art Test Automation and RPA (Robotic Process Automation) solution using the Robot-framework to prevent problems in an application so that users don't encounter bugs and crashes. It runs on all environments like demo, staging, live of ERP. It can identify both generic issues like permissions, show stoppers, common GUI problems, and process specific non-generic issues. This RPA solution is designed keeping the following aims in mind:


*   Validate information in real-time across lakhs of employees, stores, and accounts in ERP.
*   Find generic errors on any page at any stage of the process in ERP.
*   Notify (email, push, SMS) relevant team members about any issue occurs in ERP.
*   Identify security threats anywhere in the application and report them to developers.
*   Provide a full-fledged GUI solution for testing any page, process, or information in ERP.


# Requirements

To run automation scripts in any system, the system should fulfil the following requirements:


## Hardware
1. RAM: 8GB(Minimum), 16GB(Recommended )
2. Processor: Any mid-end Intel/AMD processor 
3. HDD: 100GB


## Software
1. **OS:** Linux or Windows
2. **Python:** Python 3.7.x
3. **Libraries:** Selenium, Flask, etc
4. **PyCharm - Community edition:** [https://www.jetbrains.com/pycharm/](https://www.jetbrains.com/pycharm/)
5. **Selenium Web Drivers:** Each installed browser needs its own Webdriver \
 Chrome: [https://chromedriver.chromium.org/downloads](https://chromedriver.chromium.org/downloads) \
 Firefox: [https://github.com/mozilla/geckodriver/releases](https://github.com/mozilla/geckodriver/releases)
6. **Browsers:** \
 Chrome: [https://www.google.com/chrome/](https://www.google.com/chrome/) \
 Firefox: [https://www.mozilla.org/en-US/firefox/](https://www.mozilla.org/en-US/firefox/)
7. **Notepad++**
8. **Paths:** Path of the python and web drivers should be added in the system environment.
9. **Virtual environment:** To manage the dependencies for the project and Python 3 comes bundled with the venv module to create virtual environments. 

**_“All these tools are working together to make a complete test automation project.”_**


# Setting-up Working Environment

*   Install Python
    *   Use following guide [https://realpython.com/installing-python/](https://realpython.com/installing-python/)
    *   Make sure that you add both python installation directory and the script directory to the OS environment
*   Install Robot-framework, Selenium and other Libraries
    *   Use pip command to install the following libraries
    *   Installable commands can be found for these libraries on [https://pypi.org/](https://pypi.org/)
    *   I have also created requirements.txt in the root of the project which contains a list of all libraries required to run the project, all these libraries can be installed in one go by using the following command
```
pip install -r requirements.txt
```

At the time of writing, this document following libraries were installed with the python some of these are already bundled with the Python


<table>
  <tr>
   <td>attrs
   </td>
   <td>Constantly  
   </td>
   <td>idna
   </td>
  </tr>
  <tr>
   <td>autobahn
   </td>
   <td>Cryptography
   </td>
   <td>incremental
   </td>
  </tr>
  <tr>
   <td>Automat
   </td>
   <td>Decorator
   </td>
   <td>itsdangerous
   </td>
  </tr>
  <tr>
   <td>beautifulsoup4
   </td>
   <td>destiny-bot
   </td>
   <td>Jinja2
   </td>
  </tr>
  <tr>
   <td>bs4
   </td>
   <td>Flask
   </td>
   <td>MarkupSafe
   </td>
  </tr>
  <tr>
   <td>certify
   </td>
   <td>Gspread
   </td>
   <td>Nltk
   </td>
  </tr>
  <tr>
   <td>cffi
   </td>
   <td>Helga
   </td>
   <td>oauth2client
   </td>
  </tr>
  <tr>
   <td>chardet
   </td>
   <td>httplib2
   </td>
   <td>pip
   </td>
  </tr>
  <tr>
   <td>Click
   </td>
   <td>hyperlink
   </td>
   <td>pyasn1
   </td>
  </tr>
  <tr>
   <td>pyasn1-modules
   </td>
   <td>pycparser
   </td>
   <td>PyHamcrest
   </td>
  </tr>
  <tr>
   <td>Pymongo
   </td>
   <td>pystache
   </td>
   <td>pyOpenSSL
   </td>
  </tr>
  <tr>
   <td>selenium
   </td>
   <td>pytz
   </td>
   <td>requests
   </td>
  </tr>
  <tr>
   <td>robotframework
   </td>
   <td>robotframework-requests
   </td>
   <td>robotframework-seleniumlibrary
   </td>
  </tr>
  <tr>
   <td>setuptools
   </td>
   <td>six
   </td>
   <td>smokesignal
   </td>
  </tr>
  <tr>
   <td>soupsieve
   </td>
   <td>threaded
   </td>
   <td>Twisted
   </td>
  </tr>
  <tr>
   <td>urlopen
   </td>
   <td>Yolk
   </td>
   <td>Txaio
   </td>
  </tr>
  <tr>
   <td>zope.interface
   </td>
   <td>Werkzeug
   </td>
   <td>urllib3
   </td>
  </tr>
</table>




*   Setup SeleniumWeb drivers

	Extract downloaded drivers to the bin folder in the virtual environment and then add the path to the system environment.

**Windows**
```
c:\bin
```
**Linux**
```
/home/divaksh/rajerp/rajerpenv/bin
```
*   Install PyCharm, Notepad++


# Setting-Up Web Application

We have created the GUI application making serve flask with uWSGI and Nginx to run test cases and tasks from the GUI using python scripts. Here is how we created the server stack



1. Install required components
```
    sudo apt update
    sudo apt install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
```
2. Create Virtual Environment

    python 3 comes bundled with the venv module if it is not there it can be installed using following command:
```
sudo apt install python3-venv \
mkdir ~/rajerp
cd ~/rajerp \
python3.6 -m venv rajerpenv \
source rajerpenv/bin/activate
```

3. Install Flask & uWSGI
```
    pip install wheel
    pip install uwsgi flask
```
4. Create Flask App
```
    nano ~/rajerp/rajerp.py \
```

Add following code to it

```
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
	return "<h1 style='color:blue'>Hello, server is working!!</h1>"

if __name__ == "__main__":
	app.run(host='0.0.0.0')
```

```
sudo ufw allow 5000
```


5. Test the created app
```
python rajerp.py
```
Visit to verify

http://server_ip:5000

It should display the HTML code written in the file



6. Create WSGI Entry Point
```
nano ~/rajerp/wsgi.py
```
```
from rajerp import app

if __name__ == "__main__":
	app.run()
```


7. Configuring uWSGI
```
uwsgi --socket 0.0.0.0:5000 --protocol=http -w wsgi:app
```
Visit \
[http://server_ip:5000](http://server_ip:5000) \
```Ctrl+C
deactivate
```


8. Making it more robust by creating uWSGI Configuration File
```
nano ~/rajerp/rajerp.ini
```


```
[uwsgi]
module = wsgi:app

master = true
processes = 5

socket = rajerp.sock
chmod-socket = 660
vacuum = true

die-on-term = true

#location of log files
logto = /home/divaksh/rajerp/log/%n.log

# Enable threading
enable-threads = true
single-interpreter = true
```


9. Start services on server boot
uWSGI and serve the Flask application should be started automatically when servers gets booted, here is how it can be done:
```
sudo nano /etc/systemd/system/rajerp.service
```
```
[Unit]
Description=uWSGI instance to serve rajerp
After=network.target

[Service]
User=divaksh
Group=www-data
WorkingDirectory=/home/divaksh/rajerp
Environment="PATH=/home/divaksh/rajerp/rajerpenv/bin"
ExecStart=/home/divaksh/rajerp/rajerpenv/bin/uwsgi --ini rajerp.ini

[Install]
WantedBy=multi-user.target
```
```
    sudo systemctl start rajerp
    sudo systemctl enable rajerp
    sudo systemctl status rajerp
```

10. Configure the Nginx to Proxy Requests
```
sudo nano /etc/nginx/sites-available/rajerp
```
```
server {
    listen 80;
    server_name your_domain www.your_domain;

    location / {
        include uwsgi_params;
        uwsgi_pass unix:/home/divaksh/rajerp/rajerp.sock;
    }
}
```
```
sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled
sudo systemctl restart nginx
sudo ufw delete allow 5000
sudo ufw allow 'Nginx Full'
```
Visit
[http://your_domain](http://your_domain)


11. Install SSL to make it secure
```
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt install python-certbot-nginx
    sudo certbot --nginx -d your_domain -d www.your_domain
    sudo ufw delete allow 'Nginx HTTP'
```
Visit to verify
[https://your_domain](https://your_domain)

