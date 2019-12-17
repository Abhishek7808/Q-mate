*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot

Suite Setup       Start Testing
Suite Teardown    Finish Testing

*** Test Cases ***
Reject group request process
    [Tags]  Accept  reject1
    Switch To    Customer
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2  #Gurgaon
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Click Element    //td[contains(text(),'${Branch["Name"]}')]/following-sibling::td/span/i[@title='Reject']
#    ${status}  run keyword and return status  Click Element    //td[contains(text(),'${Branch["Name"]}')]/following-sibling::td/span/i[@title='Approve']
#    log  ${status}
#    run keyword if  ${status} == ${False}  run keyword and continue on failure  fail    Approved button not appeard
#    Sleep    2s
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    # Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    # Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    ${status}  run keyword and return status  Element Should Not Be Visible    //h2[contains(text(),'Group member')]
    log  ${status}
    run keyword if  ${status} == ${False}  run keyword and continue on failure  fail    Reject group request process

Accept group request process
    [Tags]  Accept  accept2
    Switch To    Customer
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    ${status}  run keyword and return status  Click Button    sendAddreq
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    # Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    # Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Sleep    2s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Element   //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Sleep    2s
    ${status}  run keyword and return status  Click Element     //td[contains(text(),'${Branch["Name"]}')]/following-sibling::td/span/i[@title='Approve']
    log  ${status}
    run keyword if  ${status} == ${False}  run keyword and continue on failure  fail    approved button not appeared
    Sleep    2s
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    # Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    # Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Element     //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    ${status}  run keyword and return status  Element Should Be Visible    //h2[contains(text(),'Group member')]
    log  ${status}
    run keyword if  ${status} == ${False}  run keyword and continue on failure  fail    Accept group request process
