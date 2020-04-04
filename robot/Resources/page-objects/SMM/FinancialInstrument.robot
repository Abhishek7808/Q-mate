*** Settings ***


*** Variables ***
${FiListLink}    SMM/Finance/InstrumentList

*** Keywords ***
Go To Financial Instrument List Page
    [Documentation]  Opens financial instrument list page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${FiListLink}

Apply Financial Instrument Filter
    [Documentation]  Selects instrument type from the dropdown.
    [Arguments]  ${instrumentType}
    Click Element    dropdownOpen
    Run Keyword If    '${instrumentType}'=='Letter of Credit (LC)'    Select From List By Label    instrumentType    Letter of Credit (LC)
    ...    ELSE    Select From List By Label    instrumentType    Bank Guarantee (BG)
    Click Button    btnApply

Open Financial Instrument By Branch Name
    [Documentation]  Takes branch name as argument and Opens corresponding financial instrument.
    [Arguments]  ${branchName}
    Sleep    3s
    ${Status}    Run Keyword And Return Status    Page Should Contain Element    //span[contains(text(),'${branchName}')]/../following-sibling::td/i[contains(text(),'visibility')]
    Run Keyword If    '${Status}'=='False'    Click Button    Next
    Sleep    2s
    Click Element    //span[contains(text(),'${branchName}')]/../following-sibling::td/i[contains(text(),'visibility')]

Approve Financial Instrument
    [Documentation]  Clicks on approves butto.
    Sleep    3s
    Click Button    action-Approve
    Sleep    2s

Check For Presence Of Update Button
    [Documentation]  Checks that upadate button is visible on the page and returns TRUE or FALSE status.
    ${status}  run keyword and return status  Page Should Not Contain Button    btnUpdate
    log  ${status}

Search Financial Instrument
    [Documentation]  Takes FI number as argument and searches financial instrument.
    [Arguments]  ${fiNumber}
    Input Valid Value    Search Financial Instrument By Number    ${fiNumber}

Open Financial Instrument By FI Number
    [Documentation]  Takes FI number as argument and opens details of corresponding financial instrument.
    [Arguments]  ${fiNumber}
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${fiNumber}')]/../following-sibling::td/i[@title='View']

#Open Approved Financial Instrument By FI Number
#    [Arguments]  ${fiNumber}
#    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${fiNumber}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']

Check For Approved State Of Financial Instruments
    [Documentation]  Takes FI number as argument and and checks for 'Approved' tag in the listing of corresponding financial instrument.
    [Arguments]  ${fiNumber}
    Element Should Be Visible    //*[contains(text(),'${fiNumber}')]/../following-sibling::td/button/span[contains(text(),'Approved')]

Reject Financial Instrument
    [Documentation]  Opens details of financial instrument and clicks on rejects button.
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'Pending')]/../../following-sibling::td/i[@title='View']
    Input Valid Value    Financial Instrument Reject Button
    Sleep    2s

Check For Financial Instrument Is Rejected
    [Documentation]  Takes FI number as argument and and checks for 'Rejected' tag in the listing of corresponding financial instrument.
    [Arguments]  ${fiNumber}
    Element Should Be Visible    //span[contains(text(),'${fiNumber}')]/../following-sibling::td/button/span[contains(text(),'Rejected')]

Print FI
    [Documentation]  Opens details of financial instrument and clicks on print button.
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    Input Valid Value    Financial Instrument Print Button
    Sleep    5s

Open Financial Instrument By FI Number For Selected Branch
    [Documentation]  Takes FI number and branch name as argument and opens details of corresponding financial instrument.
    [Arguments]  ${fiNumber}  ${branchName}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${branchName}')]/../preceding-sibling::td//span[contains(text(),'${fiNumber}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']

Approve Transfer Request
    [Documentation]  Takes FI amount as argument, opens transfer history and then clicks on listing in which given fi amount is written, approves it.
    [Arguments]  ${branchName}  ${fiAmount}
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Transfer${SPACE}History')]
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'${fiAmount}')]/../preceding-sibling::td//span[contains(text(),'${branchName}')]/../following-sibling::td//span[contains(text(),'Pending')]/../../following-sibling::td/i[contains(@title,'Edit')]
    Wait Until Keyword Succeeds    5s    200ms    Click Button    actionName-Approve
    Element Should Be Visible    //span[contains(text(),'${fiAmount}')]/../preceding-sibling::td//span[contains(text(),'${branchName}')]/../following-sibling::td//span[contains(text(),'Approved')]

Open Financial Instrument From Department
    [Documentation]  Takes FI number, branch name and validity date as argument and opens details of corresponding financial instrument.
    [Arguments]  ${branchName}  ${fiNumber}  ${validityDate}
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${branchName}')]/../preceding-sibling::td//span[contains(text(),'${fiNumber}')]/../following-sibling::td[contains(text(),'${validityDate["Date"]}-${validityDate["Month"]}-${validityDate["Year"]}')]/following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']