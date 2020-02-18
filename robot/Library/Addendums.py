from robot.api import logger
from robot.api.deco import keyword
from calendar import monthrange
import datetime

@keyword
def count_current_month_days():
    """Returns total number of days in a month"""
    today = datetime.datetime.today()
    year = today.strftime("%y")
    month = today.strftime("%m")
    month_data = monthrange(int(year), int(month))
    return month_data[1]

def get_current_time():
    time = str(datetime.datetime.now())
    time = time.split('.')[0]
    return  time

# @keyword
# def get_maximum(list)
