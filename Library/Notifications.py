import json
import requests

from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from selenium.common.exceptions import NoSuchElementException, UnexpectedAlertPresentException
from SeleniumLibrary.base import keyword, LibraryComponent
import smtplib

from string import Template

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from subprocess import call


class Notifications:

    @keyword
    def send_email(self, send_to, email_subject, email_message):
        qmate_email = 'q-mate@divaksh.com'
        qmate_password = 'Q-mate@141'

        # set up the SMTP server
        s = smtplib.SMTP(host='divaksh.com', port=25)
        #         s = smtplib.SMTP(host='support.e-connectsolutions.com', port=25)
        s.starttls()
        s.login(qmate_email, qmate_password)

        msg = MIMEMultipart()  # create a message

        # add in the actual person name to the message template
        message = email_message

        # Prints out the message body for our sake
        print(message)

        # setup the parameters of the message
        msg['From'] = qmate_email
        msg['To'] = send_to
        msg['Subject'] = email_subject

        # add in the message body
        msg.attach(MIMEText(message, 'plain'))

        # send the message via the server set up earlier.
        s.send_message(msg)
        del msg

        # Terminate the SMTP session and close the connection
        s.quit()

    @keyword
    def send_error_email_notification(self, module_name):
        error_urls = self.filter_module_error_urls(module_name)
        # check if error notifications needs to sent
        if BuiltIn().get_variable_value("${SEND_EMAIL_NOTIFICATIONS}") and len(error_urls) != 0:
            emails_ids = self.find_receiver(module_name)
            email_subject = "List of errors in " + module_name
            email_message = self.compose_error_message(error_urls, module_name)
            self.send_email(emails_ids, email_subject, email_message)

    def compose_error_message(self, error_urls, module_name):
        message = error_urls + " more content in " + module_name
        return message

    def find_receiver(self, module_name):
        if BuiltIn().get_variable_value("${HRMS.name}") == module_name:
            email_id = "divaksh.jain@e-connectsolutions.com"
            return True
        if "${FA.name}" == module_name:
            return True

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
#        call('echo "I like potatos"', shell=True)

    @keyword
    def last(self):
        call('robotmetrics --inputpath Results --logo "http://support.e-connectsolutions.com/erp/wp-content/uploads/2018/10/rajerp-loader.png"', shell=True)
