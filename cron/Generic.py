from robot import run

run('/home/divaksh/rajerp/robot/Tests', variable=["ENVIRONMENT:production","BROWSER:headlesschrome"],include=["generictests"],exclude=["debug"],outputdir='/home/divaksh/rajerp/reports/test/',splitlog=True,timestampoutputs=True)