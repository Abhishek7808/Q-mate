#!/home/divaksh/rajerp/rajerpenv/bin python3

from robot import run

run('/home/divaksh/rajerp/robot/Tests',
    variable=["ENVIRONMENT:production", "BROWSER:headlesschrome"],
    include=["landingpage"], exclude=["debug"],
    outputdir='/home/divaksh/rajerp/reports/test/Downtime_Reports',
    splitlog=True, timestampoutputs=True)
