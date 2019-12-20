*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot


*** Test Cases ***
To check the approval process of FI requests
    [Documentation]    Approves the Financial Instrument submitted by the customer
    [Tags]  Approvefinancial  Approvefinancial1  apfn1
    #Switch To    Customer
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    FI=FI 1    SSO ID=SSOID 2
    #Login From Customer    ${SSO ID["SSOID"]}
    #Sleep    2s
    #Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    #Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    #Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    #Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Financial Instrument Add Button
    #Fill FI
    #Sleep    3s
    #Element Should Be Visible    //td[contains(text(),'${FI["BG/LC Number"]}')]/following-sibling::td//span[contains(text(),'Pending')]/ancestor::td/following-sibling::td/i[@title='View']
    Switch To    Department
    Login From Department    archit.rsmml    admin
    #Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    FI=FI 1
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    ${FI["BG/LC Number"]}
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    ${status}  run keyword and return status  Input Valid Value    Financial Instrument Approve Button
    log  ${status}
    run keyword and continue on failure  run keyword if  ${status} == ${False}  fail  approve button has not appreared
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    ${FI["BG/LC Number"]}
    Sleep    2s
    Element Should Be Visible    //*[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/button/span[contains(text(),'Approved')]

Cancel Financial Instruments, not used in any Active CROs
    [Documentation]    Rejects the Financial Instrument submitted by the customer
    [Tags]  Approvefinancial  Approvefinancial2  apfn2
    #Switch To    Customer
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    FI=FI 2    SSO ID=SSOID 2
    #Login From Customer    ${SSO ID["SSOID"]}
    #Sleep    2s
    #Click Element    //div[contains(text(),'${Branch["Name"]}, ${Company["Company Name"]}')]
    #Sleep    2s
    #Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    #Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/Finance/InstrumentList
    # Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Financial Instrument Add Button
    # Fill FI
    #Sleep    3s
    #Element Should Be Visible    //td[contains(text(),'${FI["BG/LC Number"]}')]/following-sibling::td//span[contains(text(),'Pending')]/ancestor::td/following-sibling::td/i[@title='View']
    Switch To    Department
    Login From Department    archit.rsmml    admin
    #Set Test Variables    Company=Company Department 2    Branch=Branch Department 1    FI=FI 2
    Go To Financial Instrument List From Department
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Search Financial Instrument By Number    ${FI["BG/LC Number"]}
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'Pending')]/../../following-sibling::td/i[@title='View']
    Input Valid Value    Financial Instrument Reject Button
    Sleep    2s
    Switch To    Verify
    Login From Department    megha.rsmml    admin
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    ${FI["BG/LC Number"]}
    Sleep    2s
    Element Should Be Visible    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/button/span[contains(text(),'Rejected')]

#To check the process when FI is Edit and Update
#    [Tags]    Skip
#
#Check cancel financial instruments when shared between the group members
#    [Tags]    Skip
#
#Cancel Financial Instruments, used in Active CRO
#    [Tags]    Skip
