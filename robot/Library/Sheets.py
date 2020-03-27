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
creds = ServiceAccountCredentials.from_json_keyfile_name('/home/divaksh/rajerp/robot/', scope)
client = gspread.authorize(creds)

# Find a workbook by name and open the first sheet
# Make sure you use the right name here.


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
    "MM": 61,
    "landingPage": 1
}
gen_test = GenericTests
error_data = Notifications

@keyword
def update_sheet(sheet, row, column, data):
    sheet.update_cell(row, column, data)

@keyword
def get_sheet_data(sheet, row, column):
    return sheet.cell(row, column).value

@keyword
def get_last_row_number(sheet, first_column_index):
    values_list = sheet.col_values(first_column_index)
    last_index = len(values_list)
    if values_list[last_index-1] == 'Sr. No.':
        return 4
    return last_index+1

@keyword
def get_last_serial_number(sheet, first_column_index):
    values_list = sheet.col_values(first_column_index)
    last_index = len(values_list)
    if values_list[last_index-1] == 'Sr. No.':
        return 1
    return last_index-2

@keyword
def update_error_data_on_sheets(module_name):
    sheet = client.open("Error Records").worksheet("Generic_Errors")
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
    row_number = get_last_row_number(sheet, starting_column)
    #logger.console(row_number)

    serial_number = get_last_serial_number(sheet, starting_column)
    #logger.console(serial_number)

    update_sheet(sheet, row_number, starting_column, serial_number)
    update_sheet(sheet, row_number, starting_column+1, time)
    update_sheet(sheet, row_number, starting_column+2, number_of_urls)
    update_sheet(sheet, row_number, starting_column+3, show_stoppers)
    update_sheet(sheet, row_number, starting_column+4, mising_title_tags)
    update_sheet(sheet, row_number, starting_column+5, resource_not_found)
    update_sheet(sheet, row_number, starting_column+6, permission_issues)
    update_sheet(sheet, row_number, starting_column+7, high_priority)
    update_sheet(sheet, row_number, starting_column+8, low_priority)


@keyword
def update_landingPage_error():
    sheet = client.open("Error Records").worksheet("Landing_Page_Errors")
    time = Addendums.get_current_time()
    date_time = time.split()
    date = date_time[0]
    time = date_time[1]

    starting_column = cloumn_index.get("landingPage")
    row_number = get_last_row_number(sheet, starting_column)
    serial_number = get_last_serial_number(sheet, starting_column)

    update_sheet(sheet,  row_number, starting_column, serial_number)
    update_sheet(sheet, row_number, starting_column+1, date)
    update_sheet(sheet, row_number, starting_column+2, time)

