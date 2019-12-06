import json
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import requests
from SeleniumLibrary.base import keyword
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
import base64

import GenericTests

error_file = BuiltIn().get_variable_value("${ERRORFILE}")
disbursement_file = BuiltIn().get_variable_value(r"${DV_REPORT}")
Beneficiary_report_file = BuiltIn().get_variable_value(r"${CPF_REPORT}")

def notify_false_error_link(url, error_code):
    base_url = BuiltIn().get_variable_value("${NOTIFY_FALSE_ERROR_LINK}")
    return base_url + create_false_error_json(url, error_code)


def create_false_error_json(url, error_code):
    json_content = '{"url": "' + url + '", "error_code":' + error_code + '}'
    return base64.b64encode(json_content.encode('utf-8')).decode("utf-8")  # Converted bytes to string python 3


def get_error_name(error_code):
    # """ Takes error code as an argument and returns an error name corresponding to that code"""
    # self.error_dict = {"1": "error(A)", "2": "error(B)", "3": "error(c)"}
    error_messages = BuiltIn().get_variable_value("${ERROR_DETAILS}")
    # logger.console(error_messages)
    # logger.console(error_messages.get('1 '))
    switcher = {
        "1": error_messages.get('1'),
        "2": error_messages.get('2'),
        "3": error_messages.get('3'),
        "4": error_messages.get('4')
    }
    return switcher.get(error_code, "No error code found")


def find_receiver(module_name, receivers_json):
    with open(receivers_json, 'r') as f:
        receivers_dict = json.load(f)
    return receivers_dict.get(module_name)


def get_generic_table_data(number_of_items, error_urls):
    # """ Creates rows of the error table according to the number of errors"""
    table_data = ""
    count = 1
    for x in range(number_of_items):
        if count % 2 != 0:
            table_data += '<tr>' + set_table_cell(str(count), 'white') +\
                          set_table_cell(error_urls[x][0], 'white', 'link', error_urls[x][0]) +\
                          set_table_cell(get_error_name(error_urls[x][1]), 'white') +\
                          set_table_cell('Notify', 'white', 'link', notify_false_error_link(error_urls[x][0], error_urls[x][1])) +\
                          '</tr>'
        else:
            table_data += '<tr>' + set_table_cell(str(count), 'grey') +\
                          set_table_cell(error_urls[x][0], 'grey', 'link', error_urls[x][0]) +\
                          set_table_cell(get_error_name(error_urls[x][1]), 'grey') +\
                          set_table_cell('Notify', 'grey', 'link', notify_false_error_link(error_urls[x][0], error_urls[x][1])) +\
                          '</tr>'
        count += 1
    return table_data


def get_disbursement_table_data(number_of_items, disbursement_list):
    table_data = ""
    count = 1
    for x in range(number_of_items):
        if count % 2 != 0:
            table_data += '<tr>' + set_table_cell(str(count),'white') +\
                           set_table_cell(disbursement_list[x][0],'white') + \
                          set_table_cell(disbursement_list[x][1], 'white') + \
                          set_table_cell(disbursement_list[x][2], 'white') + \
                          '</tr>'
        else:
            table_data += '<tr>' + set_table_cell(str(count),'grey') +\
                           set_table_cell(disbursement_list[x][0],'grey') + \
                          set_table_cell(disbursement_list[x][1], 'grey') + \
                          set_table_cell(disbursement_list[x][2], 'grey') + \
                          '</tr>'
        count += 1
    return table_data



def set_table_cell(cell_data, color, element_type = None, link = None):
    if element_type is None:
        if color is 'white':
            return '<td bgcolor="#fff">'+cell_data+'</td>'
        if color is 'grey':
            return '<td bgcolor="#f1f1f1">' + cell_data + '</td>'

    if element_type is 'link':
        if color is 'white':
            return '<td bgcolor="#fff"><a href="' + link + '">' + cell_data + '</a></td>'
        if color is 'grey':
            return '<td bgcolor="#f1f1f1"><a href="' + link + '">' + cell_data + '</a></td>'

def get_Beneficiary_table_data(number_of_items, Beneficiary_list):
    table_data = ""
    count = 1
    for x in range(number_of_items):
        if count % 2 != 0:
            table_data += '<tr>' + set_table_cell(str(count),'white') +\
                          set_table_cell(Beneficiary_list[x][0], 'white') + \
                          set_table_cell(Beneficiary_list[x][1], 'white') + \
                          set_table_cell(Beneficiary_list[x][2], 'white') + \
                          set_table_cell(Beneficiary_list[x][3], 'white') + \
                          '</tr>'
        else:
            table_data +='<tr>' + set_table_cell(str(count),'white') +\
                          set_table_cell(Beneficiary_list[x][0], 'grey') + \
                          set_table_cell(Beneficiary_list[x][1], 'grey') + \
                          set_table_cell(Beneficiary_list[x][2], 'grey') + \
                          set_table_cell(Beneficiary_list[x][3], 'grey') + \
                          '</tr>'
        count += 1
    return table_data

def compose_error_message(module_name, error_urls):
    # """ Compose a html table of errors"""
    number_of_items = len(error_urls)
    html_table = """
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title></title>

  <style type="text/css">
th, td {
    vertical-align: middle;
    align:left;
}
  </style>    

</head>
<body style="margin:0; padding:0; background-color:#fff;">
    <table  width="100%" border="1" cellpadding="7" cellspacing="0" bordercolor="#CCCCCC">
                    <tr>
                        <th bgcolor="#d1d1d1"> Sr. No. </th>
                        <th bgcolor="#d1d1d1"> URL </th>
                        <th bgcolor="#d1d1d1"> Issue </th>
                        <th bgcolor="#d1d1d1"> False Positive </th>
                    </tr>""" + get_generic_table_data(number_of_items, error_urls) + """</table>
                </body>
                </html>"""
    message = "Namaste,<br>RajERP Bot recently went for an audit on  " + module_name + " module on " + BuiltIn().get_variable_value(
        "${ENVIRONMENT}") + " environment and found possible issues on following pages <br><br>" + html_table + "<br><b>Important: </b>This is an automated email fired by RajERP Bot. There are very thin chances of any false positive report, but just in case, if you find any, please do let us know about it by clicking on the <u>Notify</u> link right next to the URL."

    #    logger.console(message)

    return message

def compose_disbursement_message(disbursement_list):
    number_of_items = len(disbursement_list)
    html_table = """
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html lang="en">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">

      <title></title>

      <style type="text/css">
    th, td {
        vertical-align: middle;
        align:left;
    }
      </style>    

    </head>
    <body style="margin:0; padding:0; background-color:#fff;">
        <table  width="100%" border="1" cellpadding="7" cellspacing="0" bordercolor="#CCCCCC">
                        <tr>
                            <th bgcolor="#d1d1d1"> Sr. No. </th>
                            <th bgcolor="#d1d1d1"> Disbursement Type </th>
                            <th bgcolor="#d1d1d1"> Paybill No. </th>
                            <th bgcolor="#d1d1d1"> Employee ID </th>
                        </tr>""" + get_disbursement_table_data(number_of_items, disbursement_list) + """</table>
                    </body>
                    </html>"""
    # message = "Namaste,<br>RajERP Bot recently went for an audit on  " + module_name + " module on " + BuiltIn().get_variable_value(
    #     "${ENVIRONMENT}") + " environment and found possible issues on following pages <br><br>" + html_table + "<br><b>Important: </b>This is an automated email fired by RajERP Bot. There are very thin chances of any false positive report, but just in case, if you find any, please do let us know about it by clicking on the <u>Notify</u> link right next to the URL."

    #    logger.console(message)

    return html_table

def compose_Beneficiary_report_message(Beneficiary_list):
    number_of_items = len(Beneficiary_list)
    html_table = """
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html lang="en">
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <meta http-equiv="X-UA-Compatible" content="IE=edge">

          <title></title>

          <style type="text/css">
        th, td {
            vertical-align: middle;
            align:left;
        }
          </style>    

        </head>
        <body style="margin:0; padding:0; background-color:#fff;">
            <table  width="100%" border="1" cellpadding="7" cellspacing="0" bordercolor="#CCCCCC">
                            <tr>
                                <th bgcolor="#d1d1d1"> Sr. No. </th>
                                <th bgcolor="#d1d1d1"> Organisation Name </th>
                                <th bgcolor="#d1d1d1"> Employee Code </th>
                                <th bgcolor="#d1d1d1"> Financial Year </th>
                                <th bgcolor="#d1d1d1"> Error Field </th>
                            </tr>""" + get_Beneficiary_table_data(number_of_items, Beneficiary_list) + """</table>
                        </body>
                        </html>"""
    # message = "Namaste,<br>RajERP Bot recently went for an audit on  " + module_name + " module on " + BuiltIn().get_variable_value(
    #     "${ENVIRONMENT}") + " environment and found possible issues on following pages <br><br>" + html_table + "<br><b>Important: </b>This is an automated email fired by RajERP Bot. There are very thin chances of any false positive report, but just in case, if you find any, please do let us know about it by clicking on the <u>Notify</u> link right next to the URL."

    #    logger.console(message)

    return html_table

class Notifications:

    @keyword
    def send_email(self, send_to, email_subject, email_message):
        # """Sends an email to the person given as a parameter"""
        qmate_email = BuiltIn().get_variable_value("${EMAIL.address}")
        qmate_password = BuiltIn().get_variable_value("${EMAIL.password}")
        # set up the SMTP server
        #  s = smtplib.SMTP_SSL(host='smtp.gmail.com', port=465)
        smtp_obj = smtplib.SMTP(host='smtp.e-connectsolutions.com', port=587)
        # debug mode
        #       smtp_obj.set_debuglevel(1)

        smtp_obj.starttls()
        # logger.console(qmate_password)ehlo()
        smtp_obj.login(qmate_email, qmate_password)
        msg = MIMEMultipart()  # create a message

        # Prints out the message body for our sake
        # smtp_obj.ehlo()
        # max_limit_in_bytes = int(smtp_obj.esmtp_features['size'])
        # logger.console(max_limit_in_bytes)

        # setup the parameters of the message
        msg['From'] = qmate_email
        msg['To'] = send_to
        msg['Subject'] = email_subject

        # add in the message body
        msg.attach(MIMEText(email_message, 'html'))

        # send the message via the server set up earlier.
        #        smtp_obj_response = smtp_obj.send_message(msg.as_string())
        smtp_obj.sendmail(qmate_email, msg["To"].split(","), msg.as_string())

        # check the email response
        #        logger.console(smtp_obj_response)

        # Terminate the SMTP session and close the connection
        smtp_obj.quit()

    @keyword
    def send_error_email_notification(self, module_name=None, receivers_json=None):
        #        logger.console(find_receiver(module_name, receivers_json).get('emailid'))
        error_urls = []
        gen_test = GenericTests
        if module_name is not None:
            error_urls = gen_test.filter_module_error_url(module_name)
        disbursement_list = gen_test.read_file_return_list(disbursement_file)
        Beneficiary_list = gen_test.read_file_return_list(Beneficiary_report_file)
        # logger.console(error_urls)

        # check if error notifications needs to sent
        if BuiltIn().get_variable_value("${SEND_EMAIL_NOTIFICATIONS}") and len(error_urls) != 0:
            emails_ids = find_receiver(module_name, receivers_json)
            email_subject = "Audit Report of " + module_name
            email_message = compose_error_message(module_name, error_urls)
            self.send_email(emails_ids.get('emailid'), email_subject, email_message)

        if BuiltIn().get_variable_value("${SEND_EMAIL_NOTIFICATIONS}") and len(disbursement_list) != 0:
            email_message = compose_disbursement_message(disbursement_list)
            email_subject = "Disbursement Report"
            emails_ids = 'anubhav.verma@e-connectsolutions.com,divaksh.jain@e-connectsolutions.com'
            self.send_email(emails_ids, email_subject, email_message)

        if BuiltIn().get_variable_value("${SEND_EMAIL_NOTIFICATIONS}") and len(Beneficiary_list) != 0:
            email_message = compose_Beneficiary_report_message(Beneficiary_list)
            email_subject = "Beneficiary Report"
            emails_ids = 'anubhav.verma@e-connectsolutions.com,divaksh.jain@e-connectsolutions.com'
            self.send_email(emails_ids, email_subject, email_message)


    @keyword
    def send_error_push_notification(self):
        # error_urls = self.filter_module_error_urls(module_name)

        # if BuiltIn().get_variable_value("${SEND_PUSH_NOTIFICATIONS}") and len(error_urls) != 0:

        header = {"Content-Type": "application/json; charset=utf-8",
                  "Authorization": "BASIC MTc2YzhjNGMtNTUwYy00MDk2LTgyZGYtMzRiNjU3YzMzYjEy"}

        payload = {"app_id": "1a67aae1-fc4a-410d-8391-a39693d82147",
                   "included_segments": ["All"],
                   "contents": {"en": "Click here to see test report"},
                   "headings": {"en": "Q-mate Test Report"},
                   "url": "https://divaksh.com/qmate-reports"
                   }

        req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
        logger.console(req.status_code)
        logger.console(req.reason)
