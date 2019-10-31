import json
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from selenium.common.exceptions import NoSuchElementException, UnexpectedAlertPresentException
from SeleniumLibrary.base import keyword, LibraryComponent
import os
import csv


def login_user(user_type):
    # gets user type from the global variable or command line argument
    if user_type == 'admin':
        BuiltIn().run_keyword("Attempt Login", "${ADMIN_USER}")
    elif user_type == 'employee':
        BuiltIn().run_keyword("Attempt Login", "${NONADMIN_USER}")
    elif user_type == 'citizen':
        BuiltIn().run_keyword("Attempt Login", "${CITIZEN_USER}")
    else:
        logger.console("User type should be admin, employee or citizen but you entered : " + user_type)


class ERP(LibraryComponent):

    @keyword
    def go_to_erp_page(self, url):
        # """Variant of builtin Go To keyword for ERP. Navigates the active browser instance to the provided ``url``
        # and validate ERP session if session is expired it will attempt the login with given user type. User type
        # can be given from the command line arguments. default is ADMIN"""
        self.driver.get(url)
        is_login_page = False
        try:
            self.driver.find_element_by_id("btnLogin")
        except NoSuchElementException:
            pass
        except UnexpectedAlertPresentException:
            alert = self.driver.switch_to_alert()
            alert.accept()
            print("alert accepted")
            is_login_page = True
        else:
            is_login_page = True

        if is_login_page:
            # gets user type from the global variable or command line argument
            user_type = BuiltIn().get_variable_value("${LOGIN}")
            login_user(user_type)
            self.driver.get(url)

    @keyword
    def go_to_erp_page(self, url, user_type):
        # """Variant of builtin Go To keyword for ERP. Navigates the active browser instance to the provided ``url``
        # and validate ERP session if session is expired it will attempt the login with given user type. User type
        # can be given from the command line arguments. default is ADMIN"""
        self.driver.get(url)
        is_login_page = False
        try:
            self.driver.find_element_by_id("btnLogin")
        except NoSuchElementException:
            pass
        except UnexpectedAlertPresentException:
            alert = self.driver.switch_to_alert()
            alert.accept()
            print("alert accepted")
            is_login_page = True
        else:
            is_login_page = True

        if is_login_page:
            login_user(user_type)
            user_type = BuiltIn().get_variable_value("${LOGIN}")
            self.driver.get(url)
