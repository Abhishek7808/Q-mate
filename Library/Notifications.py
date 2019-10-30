import json
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import requests
from SeleniumLibrary.base import keyword
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
# from Library.Generic import filter_module_error_url
from Library import Generic

error_dict = {"1": "error(A)", "2": "error(B)"}
error_file = BuiltIn().get_variable_value("${ERRORFILE}")


class Notifications:

    @keyword
    def send_email(self, send_to, email_subject, email_message):
        # """Sends an email to the person given as a parameter"""
        qmate_email = 'ashwani.vijay@e-connectsolutions.com'
        qmate_password = 'Joy@123'

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
    def send_error_email_notification(self, module_name):
        error_urls = Generic.filter_module_error_url(module_name)
        # check if error notifications needs to sent
        if BuiltIn().get_variable_value("${SEND_EMAIL_NOTIFICATIONS}") and len(error_urls) != 0:
            emails_ids = self.find_receiver(module_name)
            email_subject = "List of errors in " + module_name
            email_message = self.compose_error_message(module_name, error_urls)
            self.send_email(emails_ids, email_subject, email_message)

    @keyword
    def compose_error_message(self, module_name, error_urls):
        # """ Compose a html table of errors"""
        number_of_items = len(error_urls)
        html_table = """\
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
                        </tr>""" + self.table_data(number_of_items, error_urls) + """</table>
                    </body>
                    </html>"""
        message = html_table + " more content in " + module_name
        return message

    def table_data(self, number_of_itmes, error_urls):
        # """ Creates rows of the error table according to the number of errors"""
        table_data = ""
        for x in range(number_of_itmes):
            table_data += "\n" + "<tr>" + "\n" + "<td>" + error_urls[x][
                0] + "</td>" + "\n""<td>" + self.give_error_name(error_urls[x][1]) + "</td>" + "\n" + "</tr>"
        return table_data

    def give_error_name(self, error_code):
        # """ Takes error code as an argument and returns an error name corresponding to that code"""
        self.error_dict = {"1": "error(A)", "2": "error(B)"}
        return self.error_dict.get(error_code)

    def find_receiver(self, module_name):
        if BuiltIn().get_variable_value("${UM.name}") == module_name:
            email_id = "ianubhavverma@gmail.com"
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
