*** Settings ***
Resource          ../Configuration.resource
Library           SeleniumLibrary  plugins=${PLUGINS}/ERP.py
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Library           ${LIBRARY}/Notifications.py
Library           ${LIBRARY}/Sheets.py
Resource          ${PAGE OBJECTS}/SMM/CustomerLogin.robot
Resource          ${PAGE OBJECTS}/HRMS/SalaryCycle.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}OldUiFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot
Resource          ${SMM_DATA_FILES}${/}website.robot
Resource          ${SMM_DATA_FILES}${/}locators.robot
Resource          ${SMM_DATA_FILES}${/}alerts.robot
Resource          ${DATA}${/}Login_Data.robot
Library           ${LIBRARY}${/}Addendums.py
Library           DateTime
*** Variables ***

#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot
#@{moduleNames}  ${HRMS.name}  ${FA.name}  ${UM.name}  ${SMM.name}  ${CPF.name}
${None}  None
${hrmsConfigurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json
${hrmsData}  ${DATA}/HRMS_DATA/HrmsData.json
${accData}  ${DATA}/ACC_DATA/AccData.json
${urlsJson}   ${DATA}/URLs.json
${financialYear}
*** Keywords ***

Begin Basic Testing
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for basic test cases.
    Set Paths               ###""" Sets paths for using custom libraries.
    Remove Files            ###""" Previously created files are deleted before the new ones are created.
    Set Basic Tests Variables
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Basic Testing
    [Documentation]  closes browser.
    close browser

Begin DV Testing
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for data validation scripts.
    Set Paths
    Remove Files
    open browser  about:blank  ${BROWSER}
    maximize browser window

End DV Testing
    [Documentation]  Sends data validation error report email and closes browser.
    run keyword if any tests failed  Send Error Email Notification  data validation  ${CONTACTS_JSON}           ###""" This keyword is defined in robot/Library/Notifications.py
    close browser                                                                                               ###""" ${CONTACTS_JSON} can be found in Configurations.resource file

Begin Generic Testing
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for generic test cases.
    Set Paths
    create file  ${ERRORFILE}
    @{moduleNames}  create list             ###""" This list is used to send error emails modulewise.
    set global variable  @{moduleNames}
    Remove Files
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Generic Testing
    [Documentation]  Sends error report email for generic test cases and updates the same on google sheet.
    FOR  ${item}  IN  @{moduleNames}
    \   run keyword if any tests failed  Send Error Email Notification  generic tests  ${CONTACTS_JSON}  ${item}
    \   Update Error Data On Sheets  ${item}
    close browser

Begin SMM Testing
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for SMM test cases.
    Set Global Variables
    BrowserControl.Open Browsers For SMM
    #Set SMM Test Variables

Set Basic Tests Variables
    [Documentation]  Sets variables for basic test cases.
    &{ADMIN_USER}  set variable if  '${ENVIRONMENT}' == 'production'  &{ADMIN_USER_LIVE}  &{ADMIN_USER}
    &{NON_ADMIN_USER}  set variable if  '${ENVIRONMENT}' == 'production'  &{NON_ADMIN_USER_LIVE}  &{NON_ADMIN_USER}
    ${invalid_username}  Generate random string             ###""" Generates randome string everytime test case runs
    set to dictionary  ${INVALID_USER}  username=${invalid_username}
    ${username}  Generate random string
    set to dictionary  ${INVALID_PASSWORD}  username=${username}
    set global variable  &{ADMIN_USER}
    set global variable  &{NON_ADMIN_USER}
    set global variable  &{INVALID_USER}
    set global variable  &{INVALID_PASSWORD}

Set Global Variables
    [Documentation]  Sets json files to use as data files.
    ${Test Data Obj}    Load Json File    ${Test Data File}
    Set Global Variable    ${Test Data}    ${Test Data Obj}
    ${Config Obj}    Load Json File    ${configFile}
    Set Global Variable    ${CONFIG}    ${Config Obj}

Load Json File
    [Documentation]    Loads all json files into their json objects.
    [Arguments]    ${File Name}
    ${Data}    Get File    ${File Name}
    ${Data Obj}    evaluate    json.loads('''${Data}''', object_pairs_hook=collections.OrderedDict)    json, collections
    [Return]    ${Data Obj}

Set DV Test Count
    [Documentation]  Resets test count for data validation test cases.
    set global variable  ${retryCount}    0
    ${retryCount}  convert to integer  ${retryCount}

Set Test Variables
    [Documentation]  Sets test variables for test data.
    [Arguments]    &{Variables}
    : FOR    ${Var}    IN    @{Variables.keys()}
    \    set test variable    ${${Var}}    ${Test Data["${CONFIG["${Variables["${Var}"]}"]}"]}

End SMM Testing
    [Documentation]  Closes browsers.
    BrowserControl.Finish Testing

Begin HRMS Testing
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for HRMS test cases.
    Set HRMS Variables  ${hrmsConfigurationData}
    open browser  about:blank  ${BROWSER}
    maximize browser window

Begin Leave Encashment Testing
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for leave encashment test cases.
    Set HRMS Variables  ${hrmsData}
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Leave Encashment Testing
    [Documentation]  Closes browser.
    close browser

Set HRMS Variables
    [Documentation]  Sets Json data files as test variables.
    [Arguments]  ${hrmsConfigurationData}
    ${configurationData}  Load Json File  ${hrmsConfigurationData}
    set global variable  ${configData}  ${configurationData}
    ${urlsDict}  Load Json File  ${urlsJson}
    set global variable  ${urlsDict}  ${urlsDict}

End HRMS Testing
    [Documentation]  Closes browsers.
    close browser

Begin Salary Automation
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for salary automation scripts.
    Set HRMS Variables  ${hrmsData}
    Set Date Time Variables
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Salary Automation
    [Documentation]  Closes browser.
    close browser

Begin Salary Testing
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for Salary disbursement test cases.
    open browser  about:blank  ${BROWSER}
    maximize browser window
    Set HRMS Variables  ${hrmsData}
    Set Date Time Variables

END Salary Testing
    [Documentation]  Closes browser.
    close browser

Begin ACC Testing
    [Documentation]  Sets environment(i.e. variables, paths, files, browsers etc.) for ACC test cases.
    open browser  about:blank  ${BROWSER}
    maximize browser window
    Set ACC Variables  ${accData}
    Set Date Time Variables

Set ACC Variables
    [Documentation]  Sets json data files as test variables for ACC test cases.
    [Arguments]  ${accData}
    ${configurationData}  Load Json File  ${accData}
    set global variable  ${configData}  ${configurationData}

END ACC Testing
    [Documentation]  Closes browser.
    close browser

Create Employee File
    [Documentation]  Creates a file. This file is used in salary test cases. Employee code is being written here.
    create file  ${EMPLOYEE_FILE}
    #set global variable  ${employees}

Set Date Time Variables
    [Documentation]  Sets variables that are used in filling forms where current date, time, financial year are to be filled.
    ${currentFinancialYear}  Common_Keywords.Get Current Financial Year        ###""" Returns Current Financial Year """
    ${currentSalaryCycleName}  SalaryCycle.Get Current Salary Cycle            ###""" Returns Current Salary Cycle """
    ${currentMonth}  Common_Keywords.Get Current Month                  ###""" Returns Current Month """
    ${currentYear}  Common_Keywords.Get Current Year                    ###""" Returns Current Year """
    set global variable  ${currentFinancialYear}
    set global variable  ${currentSalaryCycleName}
    set global variable  ${currentMonth}
    set global variable  ${currentYear}

Set Paths
    [Documentation]  Sets paths for custom libraries.
    evaluate  sys.path.append(os.path.join(r'${LIBRARY}'))  modules=os, sys

Remove Files
    [Documentation]  Deletes files so that previously filled data is deleted before new data is filled.
    remove file  ${ERRORFILE}
    remove file  ${DV_REPORT}

Read JSON File
    [Documentation]  Takes path of json file as argument and returns data of json file.
    [Arguments]  ${JSON_File}
    ${JSON}=  Get file  ${JSON_File}
    return from keyword  ${JSON}

Evaluate And Store JSON File
    [Documentation]  Loads Json file.
    [Arguments]  ${JSON}
    @{urls_list}=    Evaluate     json.loads('''${json}''')    json
    return from keyword  @{urls_list}

Change The Number Into A Formatted Amount
    [Documentation]  Changes the given salary into a floating point number
    [Arguments]  ${amount}
    ${formattedAmount}=  replace string  ${amount}  ,  ${EMPTY}
    ${formattedAmount}  run keyword if  '${formattedAmount}' != '${EMPTY}'  Evaluate  "%.2f" % ${formattedAmount}
    return from keyword  ${formattedAmount}

Read And Evaluate JSON File
    [Documentation]  Takes path of json file as an argument and loads it into a variable.
    [Arguments]  ${JSON_File}
    ${JSON}   Read JSON File  ${JSON_File}
    ${File_JSON}  Evaluate And Store JSON File  ${JSON}
    return from keyword  ${File_JSON}

Login From Customer
    [Documentation]  Takes ssoid as argument, log in with ssoid.
    [Arguments]  ${ssoid}
    CustomerLogin.Login From Customer With SSOID  ${ssoid}

Verify Element Text On The Page
    [Documentation]  Takes text and element locator as arguments and confirms that element contains the text.
    [Arguments]  ${text}  ${element}
    Element Text Should Be    ${element}    ${text}

Login From Department
    [Documentation]  Opens admin login page and logs in wiht credentials.
    [Arguments]    ${Username}    ${Password}
    login.Department Login   ${Username}    ${Password}

Show Maximum Entries on Page
    [Documentation]  Selects maximum entries that can be listed in page.
    ${status}  run keyword and return status  page should contain element  DDLpageSize
    run keyword if  ${status} == ${True}  wait until keyword succeeds  15s  ${RETRY INTERVAL}  select last dropdown element  DDLpageSize
    wait until element is not visible  //div[@id='LoadingImage']//div//img  300

Switch Tab
    [Documentation]  Switches the robot to the previous tab
    @{windowTitles}    get window handles
    ${windowToOpen}=    get from list    ${windowTitles}  -1
    Switch Window    ${windowToOpen}

Set Test Data
    [Documentation]  Sets josn data variable as dataDictionary variable as a test variable.
    [Arguments]  ${dataJson}
    set test variable  ${datadictionary}  ${dataJson}

Get Current Financial Year
    [Documentation]  Returns current financial year.
    ${currentDate}  get current date
    ${dateDictionary}  split string  ${currentDate}  -
    ${currentMonth}  convert to integer  ${dateDictionary}[1]
    ${currentYear}  convert to integer  ${dateDictionary}[0]
    ${nextYear}  set variable  ${currentYear+1}
    ${previousYear}  set variable  ${currentYear-1}
    run keyword if  ${currentMonth}>4  set global variable  ${financialYear}  ${currentYear}${nextYear}  ELSE  set global variable  ${financialYear}  ${previousYear}${currentYear}
    return from keyword  ${financialYear}

Get Current Month
    [Documentation]  Returns current month.
    ${currentDate}  get current date
    ${month}  convert date  ${currentDate}  result_format= %B
    ${month}  strip string  ${month}
    return from keyword  ${month}

Get Current Year
    [Documentation]  Returns current Year.
    ${currentDate}  get current date
    ${year}  convert date  ${currentDate}  result_format= %Y
    ${year}  strip string  ${year}
    return from keyword  ${year}

Get Current Day
    [Documentation]  Returns current day.
    ${currentDate}  get current date
    ${year}  convert date  ${currentDate}  result_format= %d
    ${year}  strip string  ${year}
    return from keyword  ${year}

Set Login Variable
    [Documentation]  Sets login variable.
    [Arguments]  ${user_credentials}
    set global variable   ${LOGIN}  ${user_credentials}

Update Error Sheet
    [Documentation]  Updates landing page errors on Error_records sheet.
    [Arguments]  ${resultStatus}
    Update Landing Page Error  ${resultStatus}
    #run keyword if any tests failed  Update LandingPage Error

#Begin Disbursement Testing
#    Set Paths
#    Remove Files
#    open browser  about:blank  ${BROWSER}
#    maximize browser window
#
#End Disbursement Testing
#    close browser
#
#Begin Login Testing
#    Set Paths
#    Remove Files
#    open browser  about:blank  ${BROWSER}
#    maximize browser window
#
#End Login Testing
#    close browser
#
#Begin Module_Navigation Testing
#    Set Paths
#    Remove Files
#    open browser  about:blank  ${BROWSER}
#    maximize browser window
#
#End Module_Navigation Testing
#    close browser