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
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}SMMFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot
Resource          ${SMM_DATA_FILES}${/}website.robot
Resource          ${SMM_DATA_FILES}${/}locators.robot
Resource          ${SMM_DATA_FILES}${/}alerts.robot
Resource          ${DATA}${/}Login_Data.robot

*** Variables ***

#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot
#@{moduleNames}  ${HRMS.name}  ${FA.name}  ${UM.name}  ${SMM.name}  ${CPF.name}
${None}  None
${hrmsConfigurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json
${hrmsAutomationData}  ${DATA}/HRMS_DATA/HrmsData.json
${urlsJson}   ${DATA}/URLs.json
${financialYear}
*** Keywords ***

Begin Basic Testing
    Set Paths
    Remove Files
    Set Basic Tests Variables
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Basic Testing
    close browser

Begin DV Testing
    Set Paths
    Remove Files
    open browser  about:blank  ${BROWSER}
    maximize browser window

End DV Testing
    run keyword if any tests failed  Send Error Email Notification  data validation  ${CONTACTS_JSON}
    close browser

Begin Generic Testing
    Set Paths
    create file  ${ERRORFILE}
    @{moduleNames}  create list
    set global variable  @{moduleNames}
    Remove Files
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Generic Testing
    FOR  ${item}  IN  @{moduleNames}
    \   run keyword if any tests failed  Send Error Email Notification  generic tests  ${CONTACTS_JSON}  ${item}
    \   Update Error Data On Sheets  ${item}
    close browser

Begin SMM Testing
    Set Global Variables
    BrowserControl.Open Browsers For SMM
    #Set SMM Test Variables

Set Basic Tests Variables
    &{ADMIN_USER}  set variable if  '${ENVIRONMENT}' == 'production'  &{ADMIN_USER_LIVE}  &{ADMIN_USER}
    &{NON_ADMIN_USER}  set variable if  '${ENVIRONMENT}' == 'production'  &{NON_ADMIN_USER_LIVE}  &{NON_ADMIN_USER}
    ${invalid_username}  Generate random string
    set to dictionary  ${INVALID_USER}  username=${invalid_username}
    ${username}  Generate random string
    set to dictionary  ${INVALID_PASSWORD}  username=${username}
    set global variable  &{ADMIN_USER}
    set global variable  &{NON_ADMIN_USER}
    set global variable  &{INVALID_USER}
    set global variable  &{INVALID_PASSWORD}

Set Global Variables
    ${Test Data Obj}    Load Json File    ${Test Data File}
    Set Global Variable    ${Test Data}    ${Test Data Obj}
    ${Config Obj}    Load Json File    ${configFile}
    Set Global Variable    ${CONFIG}    ${Config Obj}

Load Json File
    [Arguments]    ${File Name}
    [Documentation]    Loads all json files into their json objects.
    ${Data}    Get File    ${File Name}
    ${Data Obj}    evaluate    json.loads('''${Data}''', object_pairs_hook=collections.OrderedDict)    json, collections
    [Return]    ${Data Obj}

Set DV Test Count
    set global variable  ${retryCount}    0
    ${retryCount}  convert to integer  ${retryCount}

Set Test Variables
    [Arguments]    &{Variables}
    : FOR    ${Var}    IN    @{Variables.keys()}
    \    set test variable    ${${Var}}    ${Test Data["${CONFIG["${Variables["${Var}"]}"]}"]}

End SMM Testing
    BrowserControl.Finish Testing

Begin HRMS Testing
    Set HRMS Variables  ${hrmsConfigurationData}
    open browser  about:blank  ${BROWSER}
    maximize browser window

Set HRMS Variables
    [Arguments]  ${hrmsConfigurationData}
    ${configurationData}  Load Json File  ${hrmsConfigurationData}
    set global variable  ${configData}  ${configurationData}
    ${urlsDict}  Load Json File  ${urlsJson}
    set global variable  ${urlsDict}  ${urlsDict}

End HRMS Testing
    close browser

Begin HRMS Automation
    Set HRMS Variables  ${hrmsAutomationData}
    open browser  about:blank  ${BROWSER}
    maximize browser window

End HRMS Automation
    Close Browser

Set Paths
    evaluate  sys.path.append(os.path.join(r'${LIBRARY}'))  modules=os, sys

Remove Files
    remove file  ${ERRORFILE}
    remove file  ${DV_REPORT}

Read JSON File
    [Arguments]  ${JSON_File}
    ${JSON}=  Get file  ${JSON_File}
    return from keyword  ${JSON}
    log

Evaluate And Store JSON File
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
    [Arguments]  ${JSON_File}
    ${JSON}   Read JSON File  ${JSON_File}
    ${File_JSON}  Evaluate And Store JSON File  ${JSON}
    return from keyword  ${File_JSON}

Login From Customer
    [Arguments]  ${ssoid}
    CustomerLogin.Login From Customer With SSOID  ${ssoid}

Verify Element Text On The Page
    [Arguments]  ${text}  ${element}
    Element Text Should Be    ${element}    ${text}

Login From Department
    [Arguments]    ${Username}    ${Password}
    login.Department Login   ${Username}    ${Password}

Show Maximum Entries on Page
    ${status}  run keyword and return status  page should contain element  DDLpageSize
    run keyword if  ${status} == ${True}  wait until keyword succeeds  15s  ${RETRY INTERVAL}  select last dropdown element  DDLpageSize
    wait until element is not visible  //div[@id='LoadingImage']//div//img  300

Switch Tab
    [Documentation]  Switches the robot to the previous tab
    @{windowTitles}    get window handles
    ${windowToOpen}=    get from list    ${windowTitles}  -1
    Select Window    ${windowToOpen}

Set Test Data
    [Arguments]  ${dataJson}
    set test variable  ${datadictionary}  ${dataJson}

Get Current Financial Year
    ${currentDate}  get current date
    ${dateDictionary}  split string  ${currentDate}  -
    ${currentMonth}  convert to integer  ${dateDictionary}[1]
    ${currentYear}  convert to integer  ${dateDictionary}[0]
    ${nextYear}  set variable  ${currentYear+1}
    ${previousYear}  set variable  ${currentYear-1}
    run keyword if  ${currentMonth}>4  set test variable  ${financialYear}  ${currentYear}${nextYear}  ELSE  set test variable  ${financialYear}  ${previousYear}${currentYear}
    return from keyword  ${financialYear}

Get Current Month
    ${currentDate}  get current date
    ${month}  convert date  ${currentDate}  result_format= %B
    ${month}  strip string  ${month}
    return from keyword  ${month}

Get Current Year
    ${currentDate}  get current date
    ${year}  convert date  ${currentDate}  result_format= %Y
    ${year}  strip string  ${year}
    return from keyword  ${year}

Get Current Day
    ${currentDate}  get current date
    ${year}  convert date  ${currentDate}  result_format= %d
    ${year}  strip string  ${year}
    return from keyword  ${year}

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