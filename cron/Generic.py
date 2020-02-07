#!/home/divaksh/rajerp/rajerpenv/bin python3

from robot import run

run('/home/divaksh/rajerp/robot/Tests', variable=["ENVIRONMENT:production","BROWSER:headlesschrome"],include=["login", "generictests"],exclude="debug",outputdir='/home/divaksh/rajerp/reports/test/',splitlog=True,timestampoutputs=True)
