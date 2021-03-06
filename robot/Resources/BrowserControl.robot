*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           Collections
Resource          ../Configuration.resource
Resource          ${SMM_DATA_FILES}${/}website.robot
Resource          ${SMM_DATA_FILES}${/}locators.robot
Resource          ${SMM_DATA_FILES}${/}alerts.robot

*** Variables ***
${Test Data File}                       ${SMM_DATA_FILES}${/}testData.json
${Department Key Description File}      ${SMM_DATA_FILES}${/}KeyDescriptionDepartment.json
${Customer Key Description File}        ${SMM_DATA_FILES}${/}KeyDescriptionCustomer.json
${configFile}                           ${SMM_DATA_FILES}${/}config.json

*** Keywords ***
Switch To
    [Documentation]  Swithces data json files.(Department data & customer data)
    [Arguments]    ${Switch To}
    ${File Name}    Run Keyword If    '${Switch To}'=='Customer'    Set Variable    ${Customer Key Description File}
    ...    ELSE    Set Variable    ${Department Key Description File}
    ${Key Description Obj}    Load Json File    ${File Name}
    set test variable    ${Key Description}    ${Key Description Obj}
    Switch Browser    ${Switch To}

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
    [Documentation]  Close all browsers.
    Close All Browsers

#Set Global Variables
#    ${Test Data Obj}    Load Json File    ${Test Data File}
#    Set Global Variable    ${Test Data}    ${Test Data Obj}
#    ${Config Obj}    Load Json File    ${configFile}
#    Set Global Variable    ${CONFIG}    ${Config Obj}

Open Browsers For SMM
    [Documentation]  Opens three browsers with name department, customer and verify respectively.
    #set test variable    ${Key Description}    ${Department Key Description}
    #${browser}  set variable  Chrome
    #${dict}    Create Dictionary    executable_path=${${browser} PATH}
#    ${chrome options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${chrome options}   add_argument     ${HEADLESS}
#    Call Method    ${chrome options}   add_argument    disable-gpu
#    ${options}=     Call Method     ${chrome_options}    to_capabilities
#    ${dict}    Create Dictionary      desired_capabilities=${options}
    open browser  about:blank  ${BROWSER}  alias=Department  #desired_capabilities=${options}
    Maximize Browser Window
    Go To    ${LOGIN URL}
    open browser  about:blank  ${BROWSER}    alias=Customer  #desired_capabilities=${options}
    Maximize Browser Window
    Go To    ${LOGIN URL}/temp/sso.aspx
    open browser  about:blank  ${BROWSER}    alias=Verify  #desired_capabilities=${options}
    Maximize Browser Window
    Go To    ${LOGIN URL}

Go To Base State
    [Documentation]  Opens Login page in all three browsers.
    Switch Browser    Department
    ERP_Keywords.Attempt Logout
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM
    Switch Browser    Verify
    ERP_Keywords.Attempt Logout
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM
    Switch Browser    Customer
    Go To    ${LOGIN URL}/temp/sso.aspx
