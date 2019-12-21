*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
#Resource          ../../../Configuration.resource
#Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

*** Variables ***
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***

Check Customer Registration Process
    [Documentation]    Done
    [Tags]  Himself  selfregistration  Himself1
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Delete_Data.Delete All The Prewritten Data Of SSOID From ERP    ${SSO ID["SSOID"]}
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  SMM_Keywords.Select Customer Type  purchaser
    SMM_Keywords.Create New User Account  customer
    SMM_Keywords.Company Registration By Customer    Fresh    Pending
    Sleep    3s

Check new branch registration when the company already have branches registered in it
    [Documentation]    Done
    [Tags]  alreadybranches  Himself  himself2
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    SMM_Keywords.Create New User Account  customer
    Sleep    2s
    SMM_Keywords.Company Registration By Customer    New    Pending
    Sleep    3s

Check the branch registration when user selects branch from an existing registered branches in a company with diffrent SSOID
    [Documentation]    This is not working when we are using same ssoid
    [Tags]  userselectsbranch  Himself  himself3
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    SSO ID=SSOID 3
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Create New User Account  customer
    SMM_Keywords.Company Registration By Customer    Existing    Pending
    Sleep    3s

Check the registration process when customer has partially filled the application
    [Documentation]    Done
    [Tags]  partially  Himself  himself4
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 6    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Create New User Account  customer
    sleep  2s
    SMM_Keywords.Company Registration By Customer    Fresh    Draft
    Sleep  1s
    SMM_Keywords.Go To Profile Selection Page
    sleep  2s
    SMM_Keywords.Select Customer By Name  ${Branch["Name"]}  ${Company["Company Name"]}
    Sleep  2s
    SMM_Keywords.View Customer Registration
    Sleep  2s
    SMM_Keywords.Check for draft state of Customer Registration


Check the draft branch visibility in 'View Branch' option on registration form
    [Documentation]    Done
    [Tags]  branchvisibility  Himself  himself5
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 3    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    SMM_Keywords.Create New User Account  customer
    Sleep    2s
    SMM_Keywords.Company Registration By Customer    New    Draft
    SMM_Keywords.Go To Profile Selection Page
    SMM_Keywords.Create New User Account  customer
    Input Text    ${Key Description["Enter PAN"]["Locator"]}    QMATE6665Q
    Set Focus To Element    ${Key Description["Enter PAN"]["Locator"]}
    Click Element    ${Key Description["Company Type"]["Locator"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should contain element    //div[contains(text(),'${Branch["Name"]}')]

Check the reject process of customer registration by departmental user
    [Documentation]    Done
    [Tags]  reject  Himself  himself6
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 6    SSO ID=SSOID 2
    BrowserControl.Switch To    Department
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Customer/PlantList
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Text    uncontrolled    ${Branch["Name"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    //div[@id='dropdownOpen']/button
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Select Checkbox    chkViewAll
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Dropdown    plantStatus    Pending
    Sleep    1s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnApplyFillter
    sleep  2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    click element  //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td/i[@title='View']
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Valid Value    Customer Branch Reject Button
    BrowserControl.Switch To    Customer
    Go To    http://demoprojects.e-connectsolutions.com/erp-demo/temp/sso.aspx
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  Click Element    //div[contains(text(),'I want to purchase mineral')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    //span[text()='Rejected']

Check the edit process of customer details when customer is not approved by department
    [Tags]  notapproved  Himself  himself7
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Sleep    2s
    SMM_Keywords.Company Registration By Customer    Fresh    Edit
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnUpdateCustDetail
    #Sleep    5s

Check the approval process of customer registration by departmental user
    [Documentation]    Done
    [Tags]  approval  Himself  himself8
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Customer/PlantList
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Text    uncontrolled    ${Branch["Name"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    //div[@id='dropdownOpen']/button
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Select Checkbox    chkViewAll
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Dropdown    plantStatus    Pending
    Sleep    2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnApplyFillter
    sleep  2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    click element  //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td/i[@title='View']
    Sleep    2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    action-Approve
    Sleep    5s
    BrowserControl.Switch To    Customer
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  Click Element    //div[contains(text(),'I want to purchase mineral')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    //span[text()='Approved']

Check the edit process of customer details when customer is approved by department
    [Documentation]    Done
    [Tags]  customerapproved  Himself  himself9
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    run keyword and ignore error  Click Element    //div[contains(text(),'I want to purchase mineral')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Element should not be visible    btnUpdateCustDetail

Check the TCS rate applicable according to customer-wise
    [Documentation]    Done
    [Tags]  TCS  Himself  himself10
    BrowserControl.Switch To    Customer
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    SSO ID=SSOID 2
    Common_Keywords.Login From Customer    ${SSO ID["SSOID"]}
    ${status}  run keyword and return status  page should contain element  //div[contains(text(),'I want to purchase mineral')]
    run keyword if  ${status} == ${True}  Click Element    //div[contains(text(),'I want to purchase mineral')]  ELSE  Select Customer
    Sleep    2s
    Input Select    ${Key Description["User Type"]["Locator"]}    Purchaser
    Sleep    2s
    Press Keys    ${Key Description["User Type"]["Locator"]}    TAB
    Element Should Be Disabled    ${Key Description["TCS Rate"]["Locator"]}
