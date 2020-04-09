#!/home/divaksh/rajerp/rajerpenv/bin python3

import datetime
from urllib.request import urlopen
from bs4 import BeautifulSoup
from pathlib import Path
import requests
import json
import time
from robot import run
import threading

open("/home/divaksh/rajerp/cron/landing_test.txt", "w").write(datetime.datetime.now().strftime("%M"))
report_counter = open("/home/divaksh/rajerp/cron/landing_test.txt").read()

# Case to check downtime .
run('/home/divaksh/rajerp/robot/Tests',
    variable=["ENVIRONMENT:production", "BROWSER:headlesschrome"],
    include=["landingpage"], exclude=["debug"],
    outputdir='/home/divaksh/rajerp/reports/test/downtime/'+datetime.datetime.now().strftime("%Y")+'/'+datetime.datetime.now().strftime("%m"),
    report="report-"+datetime.datetime.now().strftime("%d%m%Y-%H") + report_counter,
    log="log-" + datetime.datetime.now().strftime("%d%m%Y-%H") + report_counter,
    logtitle="Log "+datetime.datetime.now().strftime("%d-%m-%Y %H:") + report_counter,
    splitlog=False, timestampoutputs=False)


# Run service during the office hours only
current_time = datetime.datetime.now().strftime("%H")
if 9 < int(current_time) < 19:
    print('Service is online')
    print('</br>')


    def foolproofTime(date_time):
        # remove unwanted charaters from starting
        n = date_time[0:1]
        on = date_time[0:2]
        ons = date_time[0:3]
        if ons == " on":
            date_time = date_time[3:]
        elif on == "on":
            date_time = date_time[2:]
        elif n == "n":
            date_time = date_time[1:]

        # remove unwanted charaters from end
        s = date_time[-1:]
        sa = date_time[-2:]
        san = date_time[-3:]
        if san == " an":
            date_time = date_time[0:-3]
        elif sa == " a":
            date_time = date_time[0:-2]
        elif s == " ":
            date_time = date_time[0:-1]

        return date_time


    # $update_old is a last update info
    # $update_new is the new update info

    # Reading lastest time and date
    url = 'http://rajerp.rajasthan.gov.in/home/showupdatehistory'
    # using file() function to get content
    html = urlopen(url).read()
    update_new = BeautifulSoup(html, features="html.parser").get_text()

    # # turn array into one variable
    # $update_new = implode('',$lines_array);

    # Additional Check to Know if RajERP is Down
    Check1 = update_new[0:39]
    Check2 = "The most recent update was published on"

    if Check1 == Check2:
        # remove last dot
        update_new = update_new[0:-1]
        print(update_new)
        print('</br>')

        # Reading old time and date
        update_old = open("/home/divaksh/rajerp/cron/rajerp_update.txt", "r")
        update_old1 = update_old.read()
        print("start" + update_old.read() + "here")
        print(update_old1)
        # Old time
        published_old1 = update_old1[0:62]
        print('</br>')
        published_old = published_old1[36:]
        print('Published Old : ' + foolproofTime(published_old))
        print('</br>')
        updated_old = update_old1[76:]
        print('Updated Old : ' + foolproofTime(updated_old))
        print('</br>')

        # New time
        published_new1 = update_new[0:62]
        published_new = published_new1[36:]
        print('Published New : ' + foolproofTime(published_new))
        print('</br>')
        updated_new = update_new[76:]
        print('Updated New : ' + foolproofTime(updated_new))
        print('</br>')

        # Storing time for notification text as variables are not allowed in api
        published_text = "Raj ERP updates just sent from the e-connect headquarters on " + foolproofTime(published_new)
        print(published_text)
        print('</br>')
        updated_text = "Raj ERP just got better! updates arrived at RSDC on " + foolproofTime(updated_new)
        print(updated_text)
        print('</br>')
        open("/home/divaksh/rajerp/cron/rajerp_published.txt", "w").write(published_text)
        file = open("/home/divaksh/rajerp/cron/rajerp_updated.txt", "w")
        file.write(updated_text)

        # Checking the old and new time differece
        if update_new == update_old:
            # Again up notification
            if Path('/home/divaksh/rajerp/cron/erpdown.log').is_file():
                if not Path('/home/divaksh/rajerp/cron/erpup.log').is_file():
                    header = {"Content-Type": "application/json; charset=utf-8",
                              "Authorization": "Basic NGM0ZmJhMWMtNGI4MC00MWE5LWEyZDYtNjk5YzI5Y2QyOWQz"}

                    payload = {"app_id": "5eb5a37e-b458-11e3-ac11-000c2940e62c",
                               "included_segments": ["All"],
                               "contents": {"en": "RajERP is UP and back on the track."},
                               "heading": {"en": "RajERP is Up!"},
                               "fields": {"app_id": "eada2698-ce33-411e-b001-d488b2999608",
                                          "data": {"foo": "bar"}},
                               "url": "https://divaksh.com/rajerp/update?utm_source=notification&utm_medium=push"}

                    req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
                    print(req.status_code, req.reason)

                    # $response = sendMessage();
                    print("\n")
                    ERPup = "RajERP is Up"
                    print(ERPup)
                    file = open("/home/divaksh/rajerp/cron/erpup.log")
                    file.write(ERPup)
                else:
                    print('</br>')
                    print("Up notification already sent.")
                    print('</br>')
            print('</br>')
            print('OLD and NEW time are same.')

        else:
            # / * // Checking published date and time
            # if (strcmp($published_new, $published_old) != 0) {
            #     function
            # sendMessage()
            # {
            # $content = array(
            # "en" = > file_get_contents("rajerp_published.txt")
            # );
            # $heading = array(
            # "en" = > 'RajERP Update Published'
            # );
            # $fields = array(
            # 'app_id' = > "eada2698-ce33-411e-b001-d488b2999608",
            # 'included_segments' = > array(
            #     'All'
            # ),
            # 'data' = > array(
            #     "foo" = > "bar"
            # ),
            # 'contents' = > $content,
            # 'url' = > 'https://divaksh.com/rajerp/update?utm_source=notification&utm_medium=push',
            # 'headings' = > $heading,
            # );
            #
            # $fields = json_encode($fields);
            # print("\nJSON sent:\n");
            # print($fields);
            #
            # $ch = curl_init();
            # curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
            # curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            #     'Content-Type: application/json; charset=utf-8',
            #     'Authorization: Basic NGM0ZmJhMWMtNGI4MC00MWE5LWEyZDYtNjk5YzI5Y2QyOWQz'
            # ));
            # curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
            # curl_setopt($ch, CURLOPT_HEADER, FALSE);
            # curl_setopt($ch, CURLOPT_POST, TRUE);
            # curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
            # curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
            #
            # $response = curl_exec($ch);
            # curl_close($ch);
            #
            # return $response;
            # }
            # $response = sendMessage();
            # print("\n");
            # }
            # * /
            # Checking update date and time
            if updated_new != updated_old:
                header = {"Content-Type": "application/json; charset=utf-8",
                          "Authorization": "Basic NGM0ZmJhMWMtNGI4MC00MWE5LWEyZDYtNjk5YzI5Y2QyOWQz"}

                payload = {"app_id": "5eb5a37e-b458-11e3-ac11-000c2940e62c",
                           "included_segments": ["All"],
                           "contents": {"en": open("/home/divaksh/rajerp/cron/rajerp_updated.txt").read()},
                           "heading": {"en": "RajERP Updated"},
                           "fields": {"app_id": "eada2698-ce33-411e-b001-d488b2999608",
                                      "data": {"foo": "bar"}},
                           "url": "https://divaksh.com/rajerp/update?utm_source=notification&utm_medium=push"}

                req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
                print(req.status_code, req.reason)

                # #Execute robot case in tread
                # def run_test_scripts():
                #     # run('/home/divaksh/rajerp/robot/Tests',
                #     #     variable=["ENVIRONMENT:production", "BROWSER:headlesschrome"],
                #     #     include=["generictests"], exclude=["debug"],
                #     #     outputdir='/home/divaksh/rajerp/reports/test/',
                #     #     splitlog=True, timestampoutputs=True)
                #     # exec(open("/home/divaksh/rajerp/cron/generic.py").read())
                #
                #
                # thread = threading.Thread(target=run_test_scripts)
                # thread.start()
                # print("Thread is Working")
                # $response = sendMessage();
                print("\n")

                print('Strings do not match.')
                # if there is a differece in old and new time update the file
                update_old = open("/home/divaksh/rajerp/cron/rajerp_update.txt", "w").write(update_new)

                # Delay between update and robot run
                time.sleep(1200)

                run('/home/divaksh/rajerp/robot/Tests',
                    variable=["ENVIRONMENT:production", "BROWSER:headlesschrome"],
                    include=["generictests"], exclude=["debug"],
                    outputdir='/home/divaksh/rajerp/reports/test/',
                    splitlog=True, timestampoutputs=True)

    else:
        if not Path('/home/divaksh/rajerp/cron/erpdown.log').is_file():
            header = {"Content-Type": "application/json; charset=utf-8",
                      "Authorization": "Basic NGM0ZmJhMWMtNGI4MC00MWE5LWEyZDYtNjk5YzI5Y2QyOWQz"}

            payload = {"app_id": "5eb5a37e-b458-11e3-ac11-000c2940e62c",
                       "included_segments": ["All"],
                       "contents": {"en": "Hold tight! RajERP does not seem to be working right now. Probably update in progress."},
                       "heading": {"en": "RajERP is Down!"},
                       "fields": {"app_id": "eada2698-ce33-411e-b001-d488b2999608",
                                  "data": {"foo": "bar"}},
                       "url": "https://divaksh.com/rajerp/down?utm_source=notification&utm_medium=push"}

            req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
            print(req.status_code, req.reason)
            # $response = sendMessage();
            print("\n")
            ERPdown = "RajERP is down"
            print(ERPdown)
            open("/home/divaksh/rajerp/cron/erpdown.log").write(ERPdown)

        else:
            print('</br>')
            print("Down notification already sent.")

else:
    print('Service is offline')
