*** Settings ***

*** Variables ***
${CitizenServices}   \#CitizenServices
${viewRegistration}  /ERP-DEMO/RSMML/Customer/ViewRegistration

*** Keywords ***
Open Customer Registration Form
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    ${CitizenServices}
    Sleep    2s
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Link    ${viewRegistration}

Check For Draft
    Page should Contain Element    ${draftText}
    Click Button    ${submitButton}
    Sleep    5s
    Page should Contain Element    ${textPending}