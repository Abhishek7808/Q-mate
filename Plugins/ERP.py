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
        # BuiltIn.set_global_variable(get_organization_credentials(organization))
        logger.console(get_organization_credentials(user_type))
        BuiltIn().run_keyword("Attempt Login", get_organization_credentials(user_type))
        logger.console("User type should be admin, employee or citizen but you entered : " + user_type)


def get_organization_credentials(organization):
    logger.console(BuiltIn().get_variable_value("${CREDENTIALS_FIL}"))
    f = open(BuiltIn().get_variable_value("${CREDENTIALS_FILE}"), 'r')
    return json.load(f).get(organization)


class ERP(LibraryComponent):

    @keyword
    def go_to_erp_page(self, url, user_type=BuiltIn().get_variable_value("${LOGIN}")):
        # """Variant of builtin Go To keyword for ERP. Navigates the active browser instance to the provided ``url``
        # and validate ERP session if session is expired it will attempt the login with given user type. User type
        # can be given from the command line arguments. default is ADMIN"""
        is_login_page = False
        try:
            self.driver.get(url)
        except UnexpectedAlertPresentException:
            alert = self.driver.switch_to_alert()
            alert.accept()
            logger.console("Session timeout alert, alert accepted")
            is_login_page = True
        try:
            self.driver.find_element_by_id("btnLogin")
            is_login_page = True
        except NoSuchElementException:
            pass

        if is_login_page:
            login_user(user_type)
            self.driver.get(url)

    @keyword
    def select_last_dropdown_element(self, dropdown_id):
        dropdown = self.driver.find_element_by_id(dropdown_id)
        dropdown.click()
        options = dropdown.find_elements_by_tag_name('option')
        options[len(options) - 1].click()
