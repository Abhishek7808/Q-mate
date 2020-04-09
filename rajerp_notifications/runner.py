from robot import run
import time
while True:
    x = exec(open("Scrapper.py").read())
    print(x)
    time.sleep(10)
