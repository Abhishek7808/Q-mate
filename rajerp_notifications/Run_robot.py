from robot import run
import sys

print("Running robot script...")
#sys.stdout = open("D:\Q-mate\\rajerp_notifications\\robot_output.txt", "w")
run('D:\\Q-mate\\robot\\Tests', variable=["ENVIRONMENT:production", "BROWSER:headlesschrome"],
          include=["login", "generictests"], exclude="debug", outputdir='D:\\Q-mate\\robot\\Results', splitlog=True,
          timestampoutputs=True)
#sys.stdout.close()
