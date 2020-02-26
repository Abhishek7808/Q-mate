import json
import gspread
from oauth2client.service_account import ServiceAccountCredentials
from robot.api.deco import keyword
import datetime
from robot.api import logger
import GenericTests
import Notifications
import Addendums

# use creds to create a client to interact with the Google Drive API
scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('robot/Data/Client_secret.json', scope)
client = gspread.authorize(creds)

# Find a workbook by name and open the first sheet
# Make sure you use the right name here.
sheet = client.open("Q-mate ERP Tracker").worksheet("Generic_Tests_Results_Copy")

# Extract and print all of the values
# list_of_hashes = sheet.get_all_records()
# print(list_of_hashes)

# sheet.update_cell(1,1,"hello")
# print(sheet.get_all_records())

cloumn_index = {
    "HRM": 1,
    "ACC": 11,
    "URM": 21,
    "SMM": 31,
    "CPF": 41,
    "GPF": 51,
    "MM": 61
}
gen_test = GenericTests
error_data = Notifications

@keyword
def update_sheet(row, column, data):
    sheet.update_cell(row, column, data)

@keyword
def get_sheet_data(row, column):
    return sheet.cell(row, column).value

@keyword
def get_last_row_number(first_column_index):
    values_list = sheet.col_values(first_column_index)
    last_index = len(values_list)
    if values_list[last_index-1] == 'Sr. No.':
        return 4
    return last_index+1

@keyword
def get_last_serial_number(first_column_index):
    values_list = sheet.col_values(first_column_index)
    last_index = len(values_list)
    if values_list[last_index-1] == 'Sr. No.':
        return 1
    return last_index-2

@keyword
def update_error_data_on_sheets(module_name):
    error_types = []
    error_priorities = []
    time = Addendums.get_current_time()
    error_urls = gen_test.filter_module_error_url(module_name)
    number_of_urls = len(error_urls)
    for url in error_urls:
        logger.console("for loop")
        error_types.append(error_data.get_error_details(url[1]).split(',')[0])
        error_priorities.append(error_data.get_error_details(url[1]).split(',')[1])
        logger.console(error_types)
        logger.console(error_priorities)
    if number_of_urls is not 0:
        show_stoppers = error_types.count(" Encountered with a showstopper")
        mising_title_tags = error_types.count(" Appropriate title tag is missing")
        resource_not_found = error_types.count(" Resource not found")
        permission_issues = error_types.count(" Page is accessible without permissions")
        high_priority = error_priorities.count(" High")
        low_priority = error_priorities.count(" Low")

    starting_column = cloumn_index.get(module_name)
    row_number = get_last_row_number(starting_column)
    logger.console(row_number)

    serial_number = get_last_serial_number(starting_column)
    logger.console(serial_number)

    update_sheet(row_number, starting_column, serial_number)
    update_sheet(row_number, starting_column+1, time)
    update_sheet(row_number, starting_column+2, number_of_urls)
    update_sheet(row_number, starting_column+3, show_stoppers)
    update_sheet(row_number, starting_column+4, mising_title_tags)
    update_sheet(row_number, starting_column+5, resource_not_found)
    update_sheet(row_number, starting_column+6, permission_issues)
    update_sheet(row_number, starting_column+7, high_priority)
    update_sheet(row_number, starting_column+8, low_priority)


# @keyword
# def write_data_on_splited_sheet(serial_number, row_number, column_index):
#     update_sheet(row_number, 1, serial_number)
#     update_sheet(row_number, 2, time)
#     update_sheet(row_number, 3, number_of_urls)
#     update_sheet(row_number, 4, show_stoppers)
#     update_sheet(row_number, 5, mising_title_tags)
#     update_sheet(row_number, 6, resource_not_found)
#     update_sheet(row_number, 7, permission_issues)
#     update_sheet(row_number, 8, high_priority)
#     update_sheet(row_number, 9, low_priority)

@keyword
def write_data_on_combined_sheet(module_name):
    logger.console(module_name)
    time = str(datetime.datetime.now())
    time = time.split('.')[0]
    gen_test = GenericTests
    error_data = Notifications
    error_types = []
    error_priorities = []
    logger.console(time)
    error_urls = gen_test.filter_module_error_url(module_name)
    logger.console("step1")
    number_of_urls = len(error_urls)
    logger.console("step2")
    for url in error_urls:
        logger.console("for loop")
        error_types.append(error_data.get_error_details(url[1]).split(',')[0])
        error_priorities.append(error_data.get_error_details(url[1]).split(',')[1])
        logger.console(error_types)
        logger.console(error_priorities)
    if number_of_urls is not 0:
        show_stoppers = error_types.count(" Encountered with a showstopper")
        mising_title_tags = error_types.count(" Appropriate title tag is missing")
        resource_not_found = error_types.count(" Resource not found")
        permission_issues = error_types.count(" Page is accessible without permissions")
        high_priority = error_priorities.count(" High")
        low_priority = error_priorities.count(" Low")
        logger.console("step4")

        row_number = get_last_row_number()
        logger.console("serial Number")
        logger.console(row_number)

        serial_number = get_last_serial_number()
        logger.console(serial_number)
        if module_name == 'HRM':
            update_sheet(row_number, 1, serial_number)
            update_sheet(row_number, 2, time)
            update_sheet(row_number, 3, number_of_urls)
            update_sheet(row_number, 4, show_stoppers)
            update_sheet(row_number, 5, mising_title_tags)
            update_sheet(row_number, 6, resource_not_found)
            update_sheet(row_number, 7, permission_issues)
            update_sheet(row_number, 8, high_priority)
            update_sheet(row_number, 9, low_priority)

        if module_name == 'FA':
            update_sheet(row_number, 1, serial_number)
            update_sheet(row_number, 2, time)
            update_sheet(row_number, 3, number_of_urls)
            update_sheet(row_number, 10, show_stoppers)
            update_sheet(row_number, 11, mising_title_tags)
            update_sheet(row_number, 12, resource_not_found)
            update_sheet(row_number, 13, permission_issues)
            update_sheet(row_number, 14, high_priority)
            update_sheet(row_number, 15, low_priority)

        if module_name == 'FA':
            update_sheet(row_number, 1, serial_number)
            update_sheet(row_number, 2, time)
            update_sheet(row_number, 3, number_of_urls)
            update_sheet(row_number, 10, show_stoppers)
            update_sheet(row_number, 11, mising_title_tags)
            update_sheet(row_number, 12, resource_not_found)
            update_sheet(row_number, 13, permission_issues)
            update_sheet(row_number, 14, high_priority)
            update_sheet(row_number, 15, low_priority)
