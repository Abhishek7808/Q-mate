*** Settings ***

*** Variables ***
${CitizenServices}   \#CitizenServices
${viewRegistration}  /ERP-DEMO/RSMML/Customer/ViewRegistration
${groupList}  /ERP-DEMO/RSMML/Customer/GroupList
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

Open Group List Page
        Wait Until Keyword Succeeds    5s    200ms    Click Link    ${CitizenServices}
    Wait Until Keyword Succeeds    5s    200ms    Click Link    ${groupList}