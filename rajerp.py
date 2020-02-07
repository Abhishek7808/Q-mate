import base64
import glob
import sys
import threading
from flask import Flask, session, request, Response, render_template, copy_current_request_context, abort, redirect, flash, \
    url_for, g
from robot import run
from config import Config
import json

app = Flask(__name__)
app.config.from_object(Config)


@app.route("/")
def hello():
    return "<h1 style='color:blue'>Hello There, RPA server is working fine!</h1>"


def check(authorization_header):
    username = "rajerp_rpa"
    password = "Q-mate@0294"
    encoded_uname_pass = authorization_header.split()[-1]
    passwordusername = username + ":" + password
    if encoded_uname_pass == base64.b64encode(passwordusername.encode()).decode():
        return True


def calculate_time(tags):
    tags_dict = {
        "login": 2,
        "generictests": 40,
        "smm": 100
    }
    tags = tags.split(",")
    print(tags)
    waiting_time = 0
    for tag in tags:
        waiting_time = waiting_time + tags_dict[tag]

    # print("Waiting time is: " + waiting_time)
    return waiting_time


@app.route('/rajerp/api/dv/', methods=['GET', 'POST'])
def confidential():
    authorization_header = request.headers.get('Authorization')
    if authorization_header and check(authorization_header):
        content = decode_json()
        print("JSON received: " + str(content))
        if content is not None:
            @copy_current_request_context
            def do_work():
                # do something that takes a long time
                return run_robot_data_validation()

            thread = threading.Thread(target=do_work)
            thread.start()
            return "Request to run robot is accepted", 202
        else:
            return "JSON is empty", 400
    else:
        abort(401)


@app.route('/rajerp/api/dv/manual', methods=['GET', 'POST'])
def run_dv():
    error = ''
    try:
        if request.method == "GET":
            print("Notifications : " + request.args.get('notifications'))
            print("Environment : " + request.args.get('environment'))
        #    print("Login for " + request.args.get('organization_id'))
            print("Disbursement Type : " + request.args.get('disbursement_type'))
            print("FINANCIAL_YEAR : " + request.args.get('financial_year'))
            print("CYCLE_ID:" + request.args.get('cycle_id'))
            print("UNIT_ID:" + request.args.get('unit_id'))
            print("Report Name : " + request.args.get('reportname'))
            print(request.args.get('mode'))
            form_submitted = request.args.get('mode')
            if form_submitted != "None":
                @copy_current_request_context
                def do_work():
                    # do something that takes a long time
                    print("Running robot script...")
                    return run('/home/divaksh/rajerp/robot/DataValidation',
                               variable=["BROWSER:" + request.args.get('mode'), "ENVIRONMENT:" + request.args.get('environment'),
                                         "SEND_EMAIL_NOTIFICATIONS:" + request.args.get('notifications'), "LOGIN:" + request.args.get('organization_id'), "UNIT_ID:" + request.args.get('unit_id'),
                                         "CYCLE_ID:" + request.args.get(
                                             'cycle_id'), "FINANCIAL_YEAR:" + request.args.get('financial_year')],
                               include=[request.args.get('disbursement_type')], exclude="debug",
                               outputdir='/home/divaksh/rajerp/reports/task/',
                               report=request.args.get('reportname') + "-report",
                               rpa=True, splitlog=True,
                               timestampoutputs=True)

                thread = threading.Thread(target=do_work)
                thread.start()
                return '''<h1>The request successfully sent, please come back after 2 minutes for the reports</h1>'''
            else:
                error = '''<h1>Invalid inputs. Try Again'''

    except Exception as e:
        return error


@app.route('/rajerp/api/tests', methods=['GET', 'POST'])
def run_test_case():
    error = ''
    try:
        if request.method == "POST":
            print(request.form.get('environment'))
            print(request.form.get('notifications'))
            print(request.form.get('testtags'))
            print(request.form.get('reportname'))
            print("Time is written below")
            calculated_time = str(calculate_time(request.form.get('testtags')))
            form_submitted = request.form.get('mode')
            if form_submitted != "None":
                @copy_current_request_context
                def do_work():
                    # do something that takes a long time
                    return run('/home/divaksh/rajerp/robot/Tests',
                               variable=["'ENVIRONMENT:" + request.form.get('environment') + "'",
                                         "BROWSER:" + form_submitted],
                               include=[request.form.get('testtags')], exclude="debug",
                               outputdir='/home/divaksh/rajerp/reports/test/',
                               report=request.form.get('reportname') + "-report",
                               splitlog=True,
                               timestampoutputs=True)

                thread = threading.Thread(target=do_work)
                thread.start()
                return '''<h1>The request successfully sent, please come back after ''' + calculated_time + ''' minutes for reports. <a href="/rajerp">Go Back!!</a></h1>'''
            else:
                error = '''<h1>Invalid inputs. Try Again'''

    except Exception as e:
        return error


@app.errorhandler(401)
def custom_401(error):
    return Response('You are not authorized to access this service!!', 401)


def run_robot_data_validation():
    content = decode_json()
    print("Running robot script...")
    return run('/home/divaksh/rajerp/robot/DataValidation', variable=[get_variables()],
               include=[content["disbursement_type"]], exclude="debug",
               outputdir='/home/divaksh/rajerp/reports/task/', rpa=True, splitlog=True)


def run_robot_test_cases(content):
    print("Running robot script...")
    return run('/home/divaksh/rajerp/robot/Tests', include=[request.form.get('environment')],
               outputdir='/home/divaksh/rajerp/reports/test/', report=[request.form.get('environment')], splitlog=True,
               timestampoutputs=True)


@app.route('/rajerp/api/emails', methods=['GET', 'POST'])
def set_emails():
    error = ''
    content = {}

    try:
        if request.method == "POST":
            # content_json = json.dumps(content, sort_keys=True)
            # print(content_json)
            form_submitted = request.form.get('mode')

            if form_submitted != "None":
                # print(request.form.get('hrm'))
                # print(request.form.get('acc'))
                # print(request.form.get('smm'))
                # print(request.form.get('cpf'))
                # print(request.form.get('urm'))
                content = dict(
                    {'HRM': request.form.get('hrm'), 'ACC': request.form.get('acc'), 'SMM': request.form.get('smm'),
                     'CPF': request.form.get('cpf'), 'URM': request.form.get('urm'), 'GPF': request.form.get('gpf'),
                     'MM': request.form.get('mm'), 'WPM': request.form.get('wpm'), 'AMS': request.form.get('ams'),
                     'TLM': request.form.get('tlm'), 'IMS': request.form.get('ims'), 'LDM': request.form.get('ldm'),
                     'DISBURSEMENT': request.form.get('disbursement')})
                print(content)
                with open('/home/divaksh/rajerp/robot/Data/Receivers.json', 'w') as json_file:
                    json.dump(content, json_file)
                return '''<h1>The configuration successfully saved. <a href="/rajerp/email">Go Back!!</a></h1>'''
            else:
                error = '''<h1>Invalid inputs. Try Again'''

    except Exception as e:
        return error


def get_variables():
    test_variables = ""
    content = decode_json()
    #    print(content["run"])
    #    print(get_variables())
    if content is None:
        print("json is empty 2")
    else:
        organization_id = "LOGIN:" + str(content["organization_id"])
        unit_id = "UNIT_ID:" + str(content["unit_id"])
        cycle_id = "CYCLE_ID:" + str(content["cycle_id"])
        financial_year = "FINANCIAL_YEAR:" + str(content["financial_year"])
        paybill_number = "PAYBILL_NUMBER:" + str(content["paybill_number"])
        date_from = "DATE_FROM:" + str(content["date_from"])
        date_till = "DATE_TILL:" + str(content["date_till"])
        variables = [organization_id, unit_id, cycle_id, financial_year, paybill_number, date_from, date_till]
        test_variables = "'"
        for item in variables:
            if item.split(':')[1] is not None:
                test_variables += "'" + item + "', "
    return test_variables[1:-2]
    # return 'login:admin', 'unitID:' + content["unit_id"], 'financial_year'


def decode_json():
    # Python dictionary
    return request.get_json(force=True, silent=True)


@app.route('/rajerp/', methods=['GET', 'POST'])
def render_static_index():
    if g.user:
        test_reports = glob.glob("/home/divaksh/rajerp/reports/test/*.html")
        task_reports = glob.glob("/home/divaksh/rajerp/reports/task/*.html")
        return render_template('index.html', test_reports=test_reports, task_reports=task_reports)
    return redirect(url_for('do_login'))


@app.route('/rajerp/email/', methods=['GET', 'POST'])
def render_static_email():
    if g.user:
        with open('/home/divaksh/rajerp/robot/Data/Receivers.json', 'r') as receivers_json:
            email_dict = json.load(receivers_json)
        return render_template('email.html', email_dict=email_dict)
    return redirect(url_for('do_login'))


@app.route('/rajerp/login/', methods=['GET', 'POST'])
def do_login():
    if request.method == 'POST':
        if request.form['password'] == 'Q-mate@0294' and request.form['username'] == 'Divaksh':
            session['user'] = request.form['username']
            return redirect(url_for('render_static_index'))
    return render_template('login.html')


@app.before_request
def before_request():
    g.user = None
    if 'user' in session:
        g.user = session['user']


@app.route('/rajerp/logout')
def do_logout():
    session.pop('user', None)
    return '<h1>Successfully logged out. <a href="/rajerp">Login Back!!</a></h1></h1>'


# @app.route('/<string:page_name>/'){% if ( (foo == 'foo' or bar == 'bar') and
# def render_static(page_name):
#     reports = glob.glob("/home/divaksh/rajerp/reports/*.html")
#     return render_template('%s.html' % page_name, reports)


def print_paths():
    # method to troubleshoot the path related issues
    for p in sys.path:
        print(p)


# @app.route('/login')
# def login():
#     form = LoginForm()
#     return render_template('login.html', title='Sign In', form=form)


if __name__ == "__main__":
    # app.debug = True
    app.run(host='0.0.0.0')
