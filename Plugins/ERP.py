import json
from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from selenium.common.exceptions import NoSuchElementException, UnexpectedAlertPresentException
from SeleniumLibrary.base import keyword, LibraryComponent


class ERP(LibraryComponent):

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
        else:
            is_login_page = True

        if is_login_page:
            # gets user type from the global variable or command line argument
            user_type = BuiltIn().get_variable_value("${LOGIN}")
            if user_type == 'admin':
                BuiltIn().run_keyword("Attempt Login", "${ADMIN_USER}")
            elif user_type == 'employee':
                BuiltIn().run_keyword("Attempt Login", "${NONADMIN_USER}")
            elif user_type == 'citizen':
                BuiltIn().run_keyword("Attempt Login", "${CITIZEN_USER}")
            else:
                logger.console("User type should be admin, employee or citizen but you entered : " + user_type)
            self.driver.get(url)