import csv
import json
import os
from robot.api import logger
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

error_file = BuiltIn().get_variable_value("${ERRORFILE}")


class GenericTests:

    @keyword
    def filter_module_urls(self, filer_module_name, urls_json):
        # """Returns a list of filtered URLs for the given module"""
        filtered_urls = []
        with open(urls_json) as json_file:
            json_dict = json.load(json_file)
        for item in json_dict:
            if (item['MODULE']).lower() == filer_module_name.lower():
                filtered_urls.append(item['URL'])
        return filtered_urls

    @keyword
    def write_error_report(self, error_list=[]):
        # """Writes list of errors in the created Csv file"""
        file = open(error_file, "w")
        for item in error_list:
            file.write(item)
            file.write("\n")
        file.close()

    @keyword
    def read_file_return_list(self):
        # """Reads the Csv file and returns a list of errors"""
        error_list = []
        with open(error_file, 'r') as errorFile:
            errors = csv.reader(errorFile)
            for row in errors:
                # List.append(row[0]+" "+row[1])  # data we are getting from the csv file is in list format
                error_list.append(row)
        return error_list

    def filter_module_error_url(self, module_name):
        # """Filter the error list according to the given module and returns a new list """
        module_error_list = []
        error_list = self.read_file_return_list()
        for item in error_list:
            if module_name.lower() == item[0][52:55].lower():
                module_error_list.append(item)
        return module_error_list
