import json

from SeleniumLibrary import SeleniumLibrary
from SeleniumLibrary.base import keyword
from robot.api import logger
import smtplib
from robot.libraries.BuiltIn import BuiltIn
from SeleniumLibrary.keywords.browsermanagement import BrowserManagementKeywords
from selenium import webdriver

from SeleniumLibrary.base import keyword, LibraryComponent


class ERP:
    def __init__(self):
        ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    @keyword
    def filter_module_urls(self, filer_module_name, urls_json):
        """Returns a list of filtered URLs for the given module"""
        filtered_urls = []
        with open(urls_json) as json_file:
            json_dict = json.load(json_file)
        for item in json_dict:
            if (item['MODULE']).lower() == filer_module_name.lower():
                filtered_urls.append(item['URL'])
        return filtered_urls

    @keyword
    def go_to_erp_page(self, url):
        """Variant of builtin Go To keyword for ERP. Navigates the active browser instance to the provided ``url`` and validate ERP session
           if session is expired it will attempt the login with given user type. User type can be
           given from the command line arguments. default is ADMIN"""
        driver = BuiltIn().get_library_instance('SeleniumLibrary')
        driver.go_to(url)
        login_header_locator = BuiltIn().get_variable_value("${LOGIN_TEXT_HEADER}")
        login_page = driver.page_should_contain_element(login_header_locator)
        if login_page != 'None':
            user_type = BuiltIn().get_variable_value("${LOGIN}")
            if user_type == 'admin':
                BuiltIn().run_keyword("Attempt Login", "${ADMIN_USER}")
            elif user_type == 'employee':
                BuiltIn().run_keyword("Attempt Login", "${NONADMIN_USER}")
            elif user_type == 'citizen':
                BuiltIn().run_keyword("Attempt Login", "${CITIZEN_USER}")
            else:
                logger.console("User type should be admin, employee or citizen but you entered : " + user_type)
            driver.go_to(url)

    @keyword
    def send_all_errors(self):
        return True


# @keyword
# def email_errors_list_to_concern_person(self, moduleName, errorlist=[]):
#     s = smtplib.SMTP('smtp.gmail.com', 587)
#     s.starttls()
#     s.login("ishudon1947@gmail.com", "2Fanolshouldbethere")
#     erroList = []
#     errorList=errorlist
#     message = errorList
#     s.sendmail("ishudon1947@gmail.com", "me@divaksh.me", message)
#     s.quit()
