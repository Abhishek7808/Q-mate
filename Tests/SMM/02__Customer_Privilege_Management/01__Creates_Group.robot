*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
#Library           SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot



*** Test Cases ***
Check Group Creation
    [Tags]  group  creation  group1
    Switch To    Customer
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2  #Gurgaon
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    run keyword and ignore error  Click Element    //div[contains(text(),'${Branch["Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnCreateGroup
    Fill Group
    #Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    #Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Element should be visible    //span[contains(text(),'${Company["Enter PAN"]}')]

Check group creation, when already a group exists with same code/PAN no
    [Tags]  group  galready  group2
    Switch To    Customer
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2  #jodhpur
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Button    btnCreateGroup
    Sleep    2s
    Fill Group
    ${status}  run keyword and return status  Page should not contain button    btnCreateGroupPopup
    log  ${status}

Request to join existing group, having same PAN no. as that of customer.
    [Tags]  group  samePan  group3
    Switch To    Customer
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2   #jodhpur
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    run keyword and ignore error  Click Button    sendAddreq
    Sleep    2s
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    #Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    #Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Sleep    2s
    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 2"]}"]}
    ${status}  run keyword and return status  Element should be visible    //td[contains(text(),'${Branch["Name"]}')]/following-sibling::td/span/i[@title='Approve']
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  run keyword and continue on failure  fail    No Approve title appeared        