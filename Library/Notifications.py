import json
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import requests
from SeleniumLibrary.base import keyword
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
import _json

import GenericTests

error_file = BuiltIn().get_variable_value("${ERRORFILE}")


def get_error_name(error_code):
    # """ Takes error code as an argument and returns an error name corresponding to that code"""
    # self.error_dict = {"1": "error(A)", "2": "error(B)", "3": "error(c)"}
    error_messages = BuiltIn().get_variable_value("${ERROR_DETAILS}")
    # logger.console(error_messages)
    switcher = {
        1: error_messages.get(1),
        2: error_messages.get(2),
        3: error_messages.get(3)
    }
    return switcher.get(error_code, "No error code found")


def find_receiver(module_name, receivers_json):
    with open(receivers_json, 'r') as f:
        receivers_dict = json.load(f)
    return receivers_dict.get(module_name)


def table_data(number_of_items, error_urls):
    # """ Creates rows of the error table according to the number of errors"""
    table_data = ""
    for x in range(number_of_items):
        table_data += "\n" + "<tr>" + "\n" + "<td>" + error_urls[x][0] + "</td>" + "\n""<td>" + get_error_name(error_urls[x][1]) + "</td>" + "\n" + "</tr>"
    return table_data


class Notifications:

    @keyword
    def send_email(self, send_to, email_subject, email_message):
        # """Sends an email to the person given as a parameter"""
        qmate_email = BuiltIn().get_variable_value("${EMAIL.address}")
        qmate_password = BuiltIn().get_variable_value("${EMAIL.password}")

        # set up the SMTP server
        #  s = smtplib.SMTP_SSL(host='smtp.gmail.com', port=465)
        s = smtplib.SMTP(host='smtp.e-connectsolutions.com', port=587)
        s.starttls()
        # logger.console(qmate_password)
        s.login(qmate_email, qmate_password)

        msg = MIMEMultipart()  # create a message

        # Prints out the message body for our sake

        # setup the parameters of the message
        msg['From'] = qmate_email
        msg['To'] = send_to
        msg['Subject'] = email_subject

        # add in the message body
        msg.attach(MIMEText(email_message, 'html'))

        # send the message via the server set up earlier.
        s.send_message(msg)

        # Terminate the SMTP session and close the connection
        s.quit()

    @keyword
    def send_error_email_notification(self, module_name, receivers_json):
        #        logger.console(find_receiver(module_name, receivers_json).get('emailid'))
        gen_test = GenericTests
        error_urls = gen_test.filter_module_error_url(module_name)
        # check if error notifications needs to sent
        if BuiltIn().get_variable_value("${SEND_EMAIL_NOTIFICATIONS}") and len(error_urls) != 0:
            emails_ids = find_receiver(module_name, receivers_json)
            email_subject = "List of errors in " + module_name
            email_message = self.compose_error_message(module_name, error_urls)
            self.send_email(emails_ids.get('emailid'), email_subject, email_message)

    @keyword
    def compose_error_message(self, module_name, error_urls):
        # """ Compose a html table of errors"""
        number_of_items = len(error_urls)
        html_table = """
                    <html>
                    <head>
                    <style>
                    table, th, td {
                      border: 1px solid black;
                      border-collapse: collapse;
                    }
                    </style>
                    <title>Error Report</title>
                    </head>
                    <body>
                    <table>
                        <tr>
                            <th>Error Url</th>
                            <th>Error Name</th>
                        </tr>""" + table_data(number_of_items, error_urls) + """</table>
                    </body>
                    </html>"""
        message = html_table + " more content in " + module_name
        return message

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
