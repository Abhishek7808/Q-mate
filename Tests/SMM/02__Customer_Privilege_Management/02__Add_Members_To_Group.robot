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



*** Test Cases ***
Check 'Add Members To Group'
    [Tags]  Addmember  addmember1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2  #Gurgaon
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Wait Until Keyword Succeeds    5s    200ms    Click Button    btnCreateGroup
    Fill Group
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    ${status}  run keyword and return status  Wait Until Keyword Succeeds    5s    200ms    Click Button    addMember
    log  ${status}
    run keyword if  ${status} == ${False}  run keyword and continue on failure  fail    addMember button not appreared
    Set Test Variable    ${Branch}    ${Test Data["${CONFIG["Branch Customer 3"]}"]}
    ${status}  run keyword and return status  Wait Until Keyword Succeeds    5s    200ms    Click Element    //td[contains(text(),'${Branch["Name"]}')]/following-sibling::td/button[@id='addF']
    log  ${status}
    run keyword if  ${status} == ${False}  run keyword and continue on failure  fail    addF button not appreared
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[@aria-hidden='true']
    Sleep    2s
    Go To  http://demoprojects.e-connectsolutions.com/ERP-DEMO/RSMML/Index/ProfileSelection
    # Wait Until Keyword Succeeds    5s    200ms    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    # Wait Until Keyword Succeeds    5s    200ms    Click Element    //a[contains(text(),'Profile Selection')]
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    Element Should Be Visible    //h2[contains(text(),'Group member')]

Check that only group admin should have right to add members in a group
    [Tags]  Addmember  addmember2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2  #jodhpur
    Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Customer/GroupList
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${Company["Enter PAN"]}')]/../following-sibling::td/i[@title='Add']
    Sleep    2s
    Page Should Not Contain Button    addMember
