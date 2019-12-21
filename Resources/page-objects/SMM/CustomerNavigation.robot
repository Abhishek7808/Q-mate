*** Settings ***

*** Variables ***
${CitizenServices}   \#CitizenServices
${viewRegistration}  /ERP-DEMO/RSMML/Customer/ViewRegistration

*** Keywords ***
Open Customer Registration Form
    Click Link    ${CitizenServices}
    Sleep    2s
    Click Link    ${viewRegistration}

Check For Draft
    Page should Contain Element    ${draftText}
    Click Button    ${submitButton}
    Sleep    5s
    Page should Contain Element    ${textPending}