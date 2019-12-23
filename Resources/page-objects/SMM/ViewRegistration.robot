*** Settings ***

*** Variables ***
${draftText}    //button/span[contains(text(),'Draft')]
${submitButton}  btnSubmitCustDetail
${updateButton}  btnUpdateCustDetail
${textPending}  //span[text()='Pending']
${approvedText}  //span[text()='Approved']
${rejectionText}  //span[text()='Rejected']
*** Keywords ***
Check For Draft
    Page should Contain Element    ${draftText}
    Click Button    ${submitButton}
    Sleep    5s
    Page should Contain Element    ${textPending}

Confirm Approval Of Customer
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    ${approvedText}

Confirm Rejection Of Customer
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    ${rejectionText}

Confirm That Update Button Is Interactable
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    ${updateButton}