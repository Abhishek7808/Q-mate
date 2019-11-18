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
Switch To
    [Arguments]    ${Switch To}
    ${File Name}    Run Keyword If    '${Switch To}'=='Customer'    Set Variable    ${Customer Key Description File}
    ...    ELSE    Set Variable    ${Department Key Description File}
    ${Key Description Obj}    Load Json File    ${File Name}
    set test variable    ${Key Description}    ${Key Description Obj}
    Switch Browser    ${Switch To}

set test variables
    [Arguments]    &{Variables}
    : FOR    ${Var}    IN    @{Variables.keys()}
    \    set test variable    ${${Var}}    ${Test Data["${CONFIG["${Variables["${Var}"]}"]}"]}

Delete Data Of Company
    [Arguments]    ${panNo}
    Create Session     ERP DEMO    http://demoprojects.e-connectsolutions.com/erp-demo/
    ${dict}    Get Request    ERP DEMO    api/Login/Validate?loginId=vinodrsmml&password=21232F297A57A5A743894A0E4A801FC3&ipAddress=191.11.100.148
    Log    ${dict.status_code} ${dict.json()}
    ${dict2}    Set Variable    ${dict.json()}
    ${dict1}    Create_Dictionary    AuthKey=${dict2["AuthKey"]}    AuthId=${dict2["AuthId"]}
    Log    ${dict1}
    ${Resp}    Get Request    ERP DEMO    api/Common/ErasePanNumberData?panNo=${panNo}    headers=${dict1}
    Should Be Equal As Strings    ${Resp.status_code}    200

Delete Data Of SSOID
    [Arguments]    ${ssoId}
    Create Session    ERP DEMO    http://demoprojects.e-connectsolutions.com/erp-demo/
    ${dict}    Get Request    ERP DEMO    api/Login/Validate?loginId=vinodrsmml&password=21232F297A57A5A743894A0E4A801FC3&ipAddress=191.11.100.148
    Log    ${dict.status_code} ${dict.json()}
    ${dict2}    Set Variable    ${dict.json()}
    ${dict1}    Create_Dictionary    AuthKey=${dict2["AuthKey"]}    AuthId=${dict2["AuthId"]}
    Log    ${dict1}
    ${Resp}    Get Request    ERP DEMO    api/Common/EraseSalesSSOData?ssoId=${ssoId}    headers=${dict1}
    Should Be Equal As Strings    ${Resp.status_code}    200

Start Testing
    Set Global Variables
    Open Browsers

Load Json File
    [Arguments]    ${File Name}
    [Documentation]    Loads all json files into their json objects.
    ${Data}    Get File    ${File Name}
    ${Data Obj}    evaluate    json.loads('''${Data}''', object_pairs_hook=collections.OrderedDict)    json, collections
    [Return]    ${Data Obj}

Finish Testing
    Close All Browsers

Set Global Variables
    log to console  hi
    ${Test Data Obj}    Load Json File    ${Test Data File}
    Set Global Variable    ${Test Data}    ${Test Data Obj}
    ${Config Obj}    Load Json File    ${configFile}
    Set Global Variable    ${CONFIG}    ${Config Obj}

Open Browsers
    #set test variable    ${Key Description}    ${Department Key Description}
    ${browser}  set variable  Chrome
    ${dict}    Create Dictionary    executable_path=${${BROWSER} PATH}
    Create Webdriver    driver_name=${browser}    alias=Department    kwargs=${dict}
    Maximize Browser Window
    Go To    ${LOGIN URL}
    Login From Department    archit.rsmml    admin
#    Create Webdriver    driver_name=${browser}    alias=Customer    kwargs=${dict}
#    Maximize Browser Window
#    Go To    ${LOGIN URL}/temp/sso.aspx
#    Create Webdriver    driver_name=${browser}    alias=Verify    kwargs=${dict}
#    Maximize Browser Window
#    Go To    ${LOGIN URL}
#    Login From Department    megha.rsmml    admin

Go To Base State
    Switch Browser    Customer
    Go To    ${LOGIN URL}/temp/sso.aspx
    Switch Browser    Department
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM
    Switch Browser    Verify
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM
