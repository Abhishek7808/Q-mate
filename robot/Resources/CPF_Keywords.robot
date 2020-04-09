*** Settings ***
Resource  ${PAGE OBJECTS}${/}${CPF.name}/RegisteredBenificiary.robot

*** Variables ***
${beneficiaryTable}  //*[@id="classListing"]

*** Keywords ***
Open Registered Benificiary Page
    [Documentation]  Opens registered benificieary page.
    RegisteredBenificiary.Go To Registered Benificiary Page

Check Registered Benificiary
    [Documentation]  Checks for each employee's ledger.
    FOR  ${item}  IN RANGE  1  6
    \   ${organisatioName}  RegisteredBenificiary.Apply Organisation Filter  ${item}
    \   ${tableRows}  get element count  ${beneficiaryTable}/div/table/tbody/tr
    \   log to console  ${tableRows} table rows
    \   RegisteredBenificiary.Check For Errors In Registered Benificiary Table  ${tableRows}  ${organisatioName}
    Send CPF Test Report To Developers


