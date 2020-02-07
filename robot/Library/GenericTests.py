import csv
import json
from robot.api import logger
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

#error_file = BuiltIn().get_variable_value(r"${ERRORFILE}")
#disbursement_file = BuiltIn().get_variable_value(r"${DV_REPORT}")

def filter_module_error_url(module_name):
    # """Filter the error list according to the given module and returns a new list """
    module_error_list = []
    error_list = read_file_return_list(BuiltIn().get_variable_value(r"${ERRORFILE}"))
    for item in error_list:
        if module_name.lower() in item[0].lower():
            module_error_list.append(item)
    # logger.console("hi")
    return module_error_list

def get_disbursement_list():
    disbursement_list = read_file_return_list(BuiltIn().get_variable_value(r"${DV_REPORT}"))



def read_file_return_list(file):
    # """Reads the Csv file and returns a list of errors"""
    error_list = []
    try:
        e_file = open(file, 'r')
        errors = csv.reader(e_file)
        for row in errors:
            # List.append(row[0]+" "+row[1])  # data we are getting from the csv file is in list format
            error_list.append(row)
        e_file.close()
    except FileNotFoundError:
        logger.console("Following file not found: ")
        logger.console(file)
    return error_list


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

    # @keyword
    # def write_error_report(self, error_list=[]):
    #     # """Writes list of errors in the created Csv file"""
    #     file = open(error_file, "w")
    #     for item in error_list:
    #         file.write(item)
    #         file.write("\n")
    #     file.close()
