*** Settings ***
Documentation    Suite description

*** Keywords ***

Add Financial Instrument
     Wait Until Keyword Succeeds    5s    200ms    Click Button    btnAddFiInstrument

Fill Financial Instrument By Customer
    ${Status}    Run Keyword And Return Status    Should Be Equal    ${FI["Instrument Type"]}    Letter of Credit (LC)
    Input Valid Value    Financial Instrument Instrument Type    ${FI["Instrument Type"]}
    Input Valid Value    Financial Instrument Unit Name    ${FI["Unit Name"]}
    Input Valid Value    Financial Instrument BG/LC Number    ${FI["BG/LC Number"]}
    Input Valid Value    Financial Instrument LC/BG Date    ${FI["BG/LC Date"]}
    Input Valid Value    Financial Instrument BG/LC Amount    ${FI["BG/LC Amount"]}
    Input Valid Value    Financial Instrument Validity Date    ${FI["Validity Date"]}
    Input Valid Value    Financial Instrument Bank    ${FI["Bank"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Presentation Days    ${FI["Presentation Days"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Negotiating Bank    ${FI["Negotiating Bank"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Negotiating Bank Account Number    ${FI["Negotiating Bank Account Number"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument LC Type    ${FI["LC Type"]}
    Input Valid Value    Financial Instrument File Upload    ${FI["Document Upload"]}
    Input Valid Value    Financial Instrument Remark    ${FI["Remark"]}
    Sleep    3s
    ${Status}    Run Keyword And Return Status    Page Should Not Contain Button    ${Key Description["Financial Instrument Update Button"]["Locator"]}
    Run Keyword If    ${Status}    Input Valid Value    Financial Instrument Submit Button
    ...    ELSE    Input Valid Value    Financial Instrument Update Button

Open Financial Instrument By FI Number
    [Arguments]  ${fiNumber}
    Element Should Be Visible    //span[contains(text(),'${fiNumber}')]/../following-sibling::td/i[@title='View']

Open Approved Financial Instrument By FI Number
    [Arguments]  ${fiNumber}
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'${fiNumber}')]/../following-sibling::td//span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']

Request Transfer Instument
    [Arguments]  ${branchName}  ${amount}=5000
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'Transfer History')]
    sleep  2s
    Wait Until Keyword Succeeds    5s    500ms    Click Button    btnTransferInstrument
    Sleep    1s
    Wait Until Keyword Succeeds    5s    200ms    Select From List By Label    //select[@id='member']    ${branchName}
    Wait Until Keyword Succeeds    5s    200ms    Input Text    Amount    ${amount}
    Click Button    btnRequestTransfer
    sleep  4s

Check For Transfer Instrument Group Members
    Click Element    //span[contains(text(),'Transfer History')]
    Sleep    2s
    Click Button    btnTransferInstrument
    Sleep    2s
    Click Element    member
    ${Labels}    Wait Until Keyword Succeeds    5s    200ms    Get Text    member
    ${Labels}    Split String    ${Labels}    \n
    Log    ${Labels}
    set test variable  ${Branch}   ${Test Data["${CONFIG["Branch Customer 1"]}"]}
    Should Be Equal    ${Labels}[0]    ${Branch["Name"]}
    set test variable  ${Branch}   ${Test Data["${CONFIG["Branch Customer 3"]}"]}
    Should Be Equal    ${Labels}[1]    ${Branch["Name"]}

Get Amount Value
    ${Amount}    Get Text    //button[@id='btnHourglassEmpty']//div[text()='Available Value']/preceding-sibling::div
    ${Amount}    Remove String    ${Amount}    ,
    ${Amount}    Evaluate    ${Amount}
    return from keyword  ${Amount}