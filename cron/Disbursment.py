#!/home/divaksh/rajerp/rajerpenv/bin python3

from robot import run

# For RSMML 
run('/home/divaksh/rajerp/robot/DataValidation',variable=["BROWSER:headlesschrome", "ENVIRONMENT:production","SEND_EMAIL_NOTIFICATIONS:true", "LOGIN:104", "FINANCIAL_YEAR:20192020"],include=["salarydisbursementallunits"], exclude="debug",outputdir='/home/divaksh/rajerp/reports/task/',report="RSMML-report",rpa=True, splitlog=True, timestampoutputs=True)
