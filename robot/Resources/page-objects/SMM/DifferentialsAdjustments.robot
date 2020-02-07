*** Settings ***
Documentation    Suite description


*** Variables ***
${pageUrl}  SMM/Invoice/Adjustment

*** Keywords ***
Go To Differentials Adjustments Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Fill Debit Note Form
    [Arguments]  ${croNumber}  ${invoiceNumber}
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Branch["Name"]}
    Input Valid Value    Debit Note Create Button
    Sleep    3s
    Input Valid Value    Debit Note Adjustment For    ${DN["Adjustment For"]}
    Input Valid value    Debit Note Adjustment Date    ${DN["Adjustment Date"]}
    Input Valid Value    Debit Note Customer Selection    ${Val}
    Input Valid Value    Debit Note Due Date    ${DN["Due Date"]}
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Debit Note Select CRO   ${croNumber}
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Debit Note Invoice List    ${invoiceNumber}
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Debit Note Save Button
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Debit Note View List Button