*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

Suite Setup       Start Testing
Suite Teardown    Finish Testing


*** Test Cases ***
Approve or Reject LC/BG Transfer
    [Documentation]    Approves / rejects a tranfer of Financial Instrument
    [Tags]    approvelcbg
    #Approving a Transfer Request
    Switch To    Department
    Set Test Variables    Company=Company Department 2    Branch=Branch Department 2    FI=FI 1
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    ${FI["BG/LC Number"]}
#    ${text}    get text    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td[contains(text(),'${FI["Validity Date"]["Date"]}-${FI["Validity Date"]["Month"]}-${FI["Validity Date"]["Year"]}')]/following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
#    log to console  ${text}
    #/following-sibling::td/i[@title='View']
                                                                   #//span[contains(text(),'${Branch["Name"]}')]/../preceding-sibling::td//span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../preceding-sibling::td//span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td[contains(text(),'${FI["Validity Date"]["Date"]}-${FI["Validity Date"]["Month"]}-${FI["Validity Date"]["Year"]}')]/following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Transfer${SPACE}History')]
    Set test Variables    Branch=Branch Department 1
    sleep  4s
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${FI["Transfer Amount"]}')]/../preceding-sibling::td//span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'Pending')]/../../following-sibling::td/i[contains(@title,'Edit')]
    #Wait Until Keyword Succeeds    5s    200ms    Click Element    //td[contains(text(),'${FI["Transfer Amount"]}')]/following-sibling::td[contains(text(),'${Branch["Name"]}')]/following-sibling::td//span[contains(text(),'Pending')]/ancestor::td/following-sibling::td/i[contains(@title,'Edit')]
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Transfer Financial Instrument Approve Button
    Sleep    2s
    Element Should Be Visible    //span[contains(text(),'${FI["Transfer Amount"]}')]/../preceding-sibling::td//span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'Approved')]
    #Rejecting a Transfer Request
    Switch To    Department
    Set Test Variables    Company=Company Department 2    Branch=Branch Department 2    FI=FI 1
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    ${FI["BG/LC Number"]}
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${Branch["Name"]}')]/../preceding-sibling::td//span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td[contains(text(),'${FI["Validity Date"]["Date"]}-${FI["Validity Date"]["Month"]}-${FI["Validity Date"]["Year"]}')]/following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    #Click Element    //td[contains(text(),'9660775')]/following-sibling::td[contains(text(),'15-Feb-2019')]/following-sibling::td//span[contains(text(),'Approved')]/ancestor::td/following-sibling::td/i[@title='View']
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Transfer${SPACE}History')]
    Set test Variables    Branch=Branch Department 1
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${FI["Transfer Amount"]}')]/../preceding-sibling::td//span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'Pending')]/../../following-sibling::td/i[contains(@title,'Edit')]
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Transfer Financial Instrument Reject Button
    Element Should Be Visible    //span[contains(text(),'${FI["Transfer Amount"]}')]/../preceding-sibling::td//span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//span[contains(text(),'Pending')]
