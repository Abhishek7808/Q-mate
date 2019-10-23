import json

from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from selenium.common.exceptions import NoSuchElementException, UnexpectedAlertPresentException
from SeleniumLibrary.base import keyword, LibraryComponent
import smtplib

from string import Template

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


class ERP:

    def find_receiver(self, module_name):
        if "${HRMS.name}" == module_name:
            return True
        if "${FA.name}" == module_name:
            return True

    @keyword
    def send_error_notifications(self, url):
        qmate_email = 'q-mate@e-connectsolutions.com'
        qmate_password = 'Q-mate@141'

        # set up the SMTP server
        s = smtplib.SMTP(host='mx.e-connectsolutions.com', port=587)
        s.starttls()
        s.login(qmate_email, qmate_password)

        msg = MIMEMultipart()  # create a message

        # add in the actual person name to the message template
        message = "message"

        # Prints out the message body for our sake
        print(message)

        # setup the parameters of the message
        msg['From'] = qmate_email
        msg['To'] = self.find_receiver()
        msg['Subject'] = "This is TEST"

        # add in the message body
        msg.attach(MIMEText(message, 'plain'))

        # send the message via the server set up earlier.
        s.send_message(msg)
        del msg

        # Terminate the SMTP session and close the connection
        s.quit()

 #   def compose_message(self, list, module_name):
