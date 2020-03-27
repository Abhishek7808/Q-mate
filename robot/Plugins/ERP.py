import json
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from selenium.common.exceptions import NoSuchElementException, UnexpectedAlertPresentException
from SeleniumLibrary.base import keyword, LibraryComponent
import os
import csv


def login_user(user_type):
    # gets user type from the global variable or command line argument
    # BuiltIn.set_global_variable(get_organization_credentials(organization))
    # logger.console(get_organization_credentials(user_type))
    BuiltIn().run_keyword("Attempt Login", get_organization_credentials(user_type))
    # logger.console("User type should be admin, employee or citizen but you entered : " + user_type)


def get_organization_credentials(organization):
    logger.console(BuiltIn().get_variable_value("${CREDENTIALS_FILE}"))
    f = open(BuiltIn().get_variable_value("${CREDENTIALS_FILE}"), 'r')
    return json.load(f).get(organization)


class ERP(LibraryComponent):

    @keyword
    def go_to_erp_page(self, url, user_type=BuiltIn().get_variable_value("${LOGIN}")):
        # """Variant of builtin Go To keyword for ERP. Navigates the active browser instance to the provided ``url``
        # and validate ERP session if session is expired it will attempt the login with given user type. User type
        # can be given from the command line arguments. default is ADMIN"""
        is_login_page = False
        is_sso_page = False
        self.driver.get(url)
        try:
            self.driver.find_element_by_id("btnLogin")
            logger.console(self.driver.find_element_by_id("btnLogin"))
            is_login_page = True
        except UnexpectedAlertPresentException:
            alert = self.driver.switch_to_alert()
            alert.accept()
            logger.console("Session timeout alert, alert accepted")
            is_login_page = True
        except NoSuchElementException:
            try:
                # special precaution for the production login page, if gets redirected to sso page.
                current_url = self.driver.current_url
                if "signin" in current_url:
                    is_sso_page = True
                #self.driver.find_element_by_id("cpBody_btn_LDAPLogin")
                #logger.console(self.driver.find_element_by_id("cpBody_btn_LDAPLogin"))

            except NoSuchElementException:
                pass

        if is_login_page:
            login_user(user_type)
            self.driver.get(url)
        elif is_sso_page:
            #self.go_to_erp_page(self, url, user_type=BuiltIn().get_variable_value("${LOGIN}"))
            self.driver.get(BuiltIn().get_variable_value("${LOGIN_URL}"))
            login_user(user_type)
            self.driver.get(url)

    @keyword
    def select_last_dropdown_element(self, dropdown_id):
        dropdown = self.driver.find_element_by_id(dropdown_id)
        dropdown.click()
        options = dropdown.find_elements_by_tag_name('option')
        options[len(options) - 1].click()

    @keyword
    def read_table_data(self, table_id, row_number, column_number):
        # Reduces time by 90%
        tbl = self.driver.find_element_by_xpath(table_id)
        rows = tbl.find_elements_by_tag_name("tr")
        cols = rows[int(row_number)].find_elements_by_tag_name("td")
        cell = cols[int(column_number)]
        return cell

    @keyword
    def get_table_column_number(self, table_id, header_text):
        tbl = self.driver.find_element_by_xpath(table_id)
        headers = tbl.find_elements_by_tag_name("th")
        for item in headers:
            #logger.console(item.text)
            if item.is_enabled():
                if item.text == header_text:
                    return headers.index(item)
