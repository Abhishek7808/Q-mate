*** Settings ***

*** Variables ***
${draftText}    //button/span[contains(text(),'Draft')]
${submitButton}  btnSubmitCustDetail
${textPending}  //span[text()='Pending']

*** Keywords ***
Check For Draft
    Page should Contain Element    ${draftText}
    Click Button    ${submitButton}
    Sleep    5s
    Page should Contain Element    ${textPending}