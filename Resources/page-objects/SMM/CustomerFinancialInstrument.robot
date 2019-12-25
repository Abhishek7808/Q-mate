*** Settings ***
Documentation    Suite description

*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

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