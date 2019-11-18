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
*** Variables ***
${RETRY TIME}     5s
${RETRY INTERVAL}    200ms

*** Test Cases ***
Testing API
    [Documentation]    Deletes the data of company and SSO ID
    set test variable    ${panNo}    QMATE1234D
    Delete Data Of Company    ${panNo}
    set test variable    ${panNo}    QMATE1234C
    Delete Data Of Company    ${panNo}
    set test variable    ${panNo}    QMATE5555Q
    Delete Data Of Company    ${panNo}
    set test variable    ${panNo}    QMATE5555T
    Delete Data Of Company    ${panNo}
    set test variable    ${ssoId}    archit010
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    chauhan.yuvi
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    1860
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    1862
    Delete Data Of SSOID    ${ssoId}
    set test variable    ${ssoId}    1863
    Delete Data Of SSOID    ${ssoId}

Check Customer Registration Process
    [Documentation]    Done
    Switch To    Customer
    Delete Data of Company    ${Test Data["${CONFIG["Company Customer 1"]}"]["Enter PAN"]}
    Delete Data of Company    ${Test Data["${CONFIG["Company Customer 2"]}"]["Enter PAN"]}
    set test variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1
    Delete Data Of SSOID    ${SSO ID["SSOID"]}
    Login From Customer    ${SSO ID["SSOID"]}
    Click Element    //div[contains(text(),'I want to purchase mineral')]
    Sleep    2s
    Company Registration By Customer    Fresh    Pending
    Sleep    3s

Check new branch registration when the company already have branches registered in it
    [Documentation]    Done
    Switch To    Customer
    set test variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1
    Login From Customer    ${SSO ID["SSOID"]}
    Sleep    2s
    Click Element    xpath=//div/button//span[text()='Customer']
    Sleep    2s
    Company Registration By Customer    New    Pending
    Sleep    3s

Check the branch registration when user selects branch from an existing registered branches in a company
    [Documentation]    Done
    Switch To    Customer
    set test variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 2
    Login From Customer    ${SSO ID["SSOID"]}
    Click Element    //div[contains(text(),'I want to purchase mineral')]
    Company Registration By Customer    Existing    Pending
    Sleep    3s

Check the registration process when customer has partially filled the application
    [Documentation]    Done
    Switch To    Customer
    set test variables    Company=Company Customer 2    Branch=Branch Customer 4    SSO ID=SSOID 1
    Login From Customer    ${SSO ID["SSOID"]}
    Click element    xpath=//div/button//span[text()='Customer']
    Sleep    2s
    Company Registration By Customer    Fresh    Draft
    Sleep    3s
    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    Sleep    2s
    Click Element    //a[contains(text(),'Profile Selection')]
    Sleep    2s
    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Sleep    2s
    Click Link    \#CitizenServices
    Sleep    2s
    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Sleep    2s
    Page should Contain Element    //button/span[contains(text(),'Draft')]
    Click Button    btnSubmitCustDetail
    Sleep    5s
    Page should Contain Element    //span[text()='Pending']

Check the draft branch visibility in 'View Branch' option on registration form
    [Documentation]    Done
    Switch To    Customer
    set test variables    Company=Company Customer 1    Branch=Branch Customer 3    SSO ID=SSOID 1
    Login From Customer    ${SSO ID["SSOID"]}
    Click element    xpath=//div/button//span[text()='Customer']
    Sleep    2s
    Company Registration By Customer    New    Draft
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Mouse Over    //span[contains(text(),'${SSO ID["Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //a[contains(text(),'Profile Selection')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click element    xpath=//div/button//span[text()='Customer']
    Input Text    ${Key Description["Enter PAN"]["Locator"]}    QMATE5555Q
    Set Focus To Element    ${Key Description["Enter PAN"]["Locator"]}
    Click Element    ${Key Description["Company Type"]["Locator"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should contain element    //div[contains(text(),'${Branch["Name"]}')]

Check the reject process of customer registration by departmental user
    [Documentation]    Done
    set test variables    Company=Company Customer 2    Branch=Branch Customer 4    SSO ID=SSOID 1
    Switch To    Department
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Customer/PlantList
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Text    uncontrolled    ${Branch["Name"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    //div[@id='dropdownOpen']/button
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Select Checkbox    chkViewAll
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Dropdown    plantStatus    Pending
    Sleep    1s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnApplyFillter
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //td[contains(text(),'${Branch["Name"]},${Company["Company Name"]}')]/following-sibling::td/i[contains(text(),'visibility')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Valid Value    Customer Branch Reject Button
    Switch To    Customer
    Go To    http://demoprojects.e-connectsolutions.com/erp-demo/temp/sso.aspx
    Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    //span[text()='Rejected']

Check the edit process of customer details when customer is not approved by department
    Switch To    Customer
    set test variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1
    Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Sleep    2s
    Company Registration By Customer    Fresh    Edit
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnUpdateCustDetail
    #Sleep    5s

Check the approval process of customer registration by departmental user
    [Documentation]    Done
    Switch To    Department
    set test variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Customer/PlantList
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Text    uncontrolled    ${Branch["Name"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    //div[@id='dropdownOpen']/button
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Select Checkbox    chkViewAll
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Input Dropdown    plantStatus    Pending
    Sleep    0.2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    btnApplyFillter
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //td[contains(text(),'${Branch["Name"]},${Company["Company Name"]}')]/following-sibling::td/i[contains(text(),'visibility')]
    Sleep    2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    action-Approve
    Sleep    5s
    Switch To    Customer
    Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    //span[text()='Approved']

Check the edit process of customer details when customer is approved by department
    [Documentation]    Done
    Switch To    Customer
    set test variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1
    Login From Customer    ${SSO ID["SSOID"]}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    \#CitizenServices
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    /ERP-DEMO/RSMML/Customer/ViewRegistration
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Element should not be visible    btnUpdateCustDetail

Check the TCS rate applicable according to customer-wise
    [Documentation]    Done
    Switch To    Customer
    set test variables    Company=Company Customer 1    Branch=Branch Customer 1    SSO ID=SSOID 1
    Login From Customer    ${SSO ID["SSOID"]}
    Click element    xpath=//div/button//span[text()='Customer']
    Sleep    2s
    Input Select    ${Key Description["User Type"]["Locator"]}    Purchaser
    Sleep    2s
    Press Key    ${Key Description["User Type"]["Locator"]}    //09
    Element Should Be Disabled    ${Key Description["TCS Rate"]["Locator"]}
