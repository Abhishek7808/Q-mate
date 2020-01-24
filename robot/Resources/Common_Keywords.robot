*** Settings ***
Resource          ../Configuration.resource
Library           SeleniumLibrary  plugins=${PLUGINS}/ERP.py
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Library           ${LIBRARY}/Notifications.py
Resource          ${PAGE OBJECTS}/SMM/CustomerLogin.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}SMMFormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot
Resource          ${SMM_DATA_FILES}${/}website.robot
Resource          ${SMM_DATA_FILES}${/}locators.robot
Resource          ${SMM_DATA_FILES}${/}alerts.robot

*** Variables ***

#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot
@{moduleNames}  ${HRMS.name}  ${FA.name}  ${UM.name}  ${SMM.name}  ${CPF.name}
${None}  None

*** Keywords ***

Begin Basic Testing
    Set Paths
    Remove Files
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
    Remove Files
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Generic Testing
    FOR  ${item}  IN  @{moduleNames}
    \   run keyword if any tests failed  Send Error Email Notification  generic tests  ${CONTACTS_JSON}  ${item}
    close browser

Begin SMM Testing
    Set Global Variables
    BrowserControl.Open Browsers For SMM
    #Set SMM Test Variables

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

Set Test Variables
    [Arguments]    &{Variables}
    : FOR    ${Var}    IN    @{Variables.keys()}
    \    set test variable    ${${Var}}    ${Test Data["${CONFIG["${Variables["${Var}"]}"]}"]}

End SMM Testing
    BrowserControl.Finish Testing

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