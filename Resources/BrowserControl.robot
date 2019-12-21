*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           Collections
Resource          ../Configuration.resource
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${DATA}${/}website.robot
Resource          ${DATA}${/}locators.robot
Resource          ${DATA}${/}alerts.robot

*** Variables ***
${Test Data File}                       ${DATA}${/}testData.json
${Department Key Description File}      ${DATA}${/}KeyDescriptionDepartment.json
${Customer Key Description File}        ${DATA}${/}KeyDescriptionCustomer.json
${configFile}                           ${DATA}${/}config.json

*** Keywords ***
BrowserControl.Switch To
    [Arguments]    ${BrowserControl.Switch To}
    ${File Name}    Run Keyword If    '${BrowserControl.Switch To}'=='Customer'    Set Variable    ${Customer Key Description File}
    ...    ELSE    Set Variable    ${Department Key Description File}
    ${Key Description Obj}    Load Json File    ${File Name}
    set test variable    ${Key Description}    ${Key Description Obj}
    Switch Browser    ${BrowserControl.Switch To}

#Set Test Variables
#    [Arguments]    &{Variables}
#    : FOR    ${Var}    IN    @{Variables.keys()}
#    \    set test variable    ${${Var}}    ${Test Data["${CONFIG["${Variables["${Var}"]}"]}"]}

#Start Testing
#    Set Global Variables
#    Open Browsers

#Load Json File
#    [Arguments]    ${File Name}
#    [Documentation]    Loads all json files into their json objects.
#    ${Data}    Get File    ${File Name}
#    ${Data Obj}    evaluate    json.loads('''${Data}''', object_pairs_hook=collections.OrderedDict)    json, collections
#    [Return]    ${Data Obj}

Finish Testing
    Close All Browsers

#Set Global Variables
#    ${Test Data Obj}    Load Json File    ${Test Data File}
#    Set Global Variable    ${Test Data}    ${Test Data Obj}
#    ${Config Obj}    Load Json File    ${configFile}
#    Set Global Variable    ${CONFIG}    ${Config Obj}

Open Browsers For SMM
    #set test variable    ${Key Description}    ${Department Key Description}
    #${browser}  set variable  Chrome
    #${dict}    Create Dictionary    executable_path=${${browser} PATH}
    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}   add_argument    headless
    Call Method    ${chrome options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    ${dict}    Create Dictionary    executable_path=${${BROWSER} PATH}  #desired_capabilities=${options}
    Create WebDriver  ${BROWSER}  alias=Department  kwargs=${dict}
    #Create Webdriver    driver_name=${BROWSER}    alias=Department    #kwargs=${dict}
    Maximize Browser Window
    Go To    ${LOGIN URL}
    #Login From Department    archit.rsmml    admin
    Create WebDriver  ${BROWSER}    alias=Customer  kwargs=${dict}
    #Create Webdriver    driver_name=${BROWSER}    alias=Customer    #kwargs=${dict}
    Maximize Browser Window
    Go To    ${LOGIN URL}/temp/sso.aspx
    Create WebDriver  ${BROWSER}    alias=Verify  kwargs=${dict}
    #Create Webdriver    driver_name=${BROWSER}    alias=Verify    #kwargs=${dict}
    Maximize Browser Window
    Go To    ${LOGIN URL}
    #Login From Department    megha.rsmml    admin

Go To Base State
    Switch Browser    Customer
    Go To    ${LOGIN URL}/temp/sso.aspx
    Switch Browser    Department
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM
    Switch Browser    Verify
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM
