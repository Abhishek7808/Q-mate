import json
from SeleniumLibrary.base import keyword
from robot.api import logger
import smtplib

class ERP:
    def __init__(self):
        ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    # Returns a list of filtered URLs for the given module
    @keyword
    def filter_module_urls(self, filer_module_name, urls_json):
        filtered_urls = []
        with open(urls_json) as json_file:
            json_dict = json.load(json_file)
        for item in json_dict:
            if (item['MODULE']).lower() == filer_module_name.lower():
                filtered_urls.append(item['URL'])
        return filtered_urls
    #
    # @keyword
    # def email_fatal_error_list_to_concern_person(self, moduleName, errorlist=[]):
    #     s = smtplib.SMTP('smtp.gmail.com', 587)
    #     s.starttls()
    #     s.login("ishudon1947@gmail.com", "2Fanolshouldbethere")
    #     erroList = []
    #     errorList=errorlist
    #     message = errorList
    #     s.sendmail("ishudon1947@gmail.com", "me@divaksh.me", message)
    #     s.quit()