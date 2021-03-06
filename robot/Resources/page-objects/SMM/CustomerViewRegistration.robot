*** Variables ***
${draftText}    //button/span[contains(text(),'Draft')]
${submitButton}  btnSubmitCustDetail
${updateButton}  btnUpdateCustDetail
${textPending}  //span[text()='Pending']
${approvedText}  //span[text()='Approved']
${rejectionText}  //span[text()='Rejected']

*** Keywords ***
Check For Draft
    [Documentation]  Verifies that page contains draft text.
    Page should Contain Element    ${draftText}

Update draft registration
    [Documentation]  Clicks on submit button.
    Click Button    ${submitButton}
    Sleep    5s

Check For Pending State
    [Documentation]  Verifies that page contains pending text.
    Page should Contain Element    ${textPending}

Confirm Approval Of Customer
    [Documentation]  Verifies that page contains approve text.
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    ${approvedText}

Confirm Rejection Of Customer
    [Documentation]  Verifies that page contains reject text.
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Page should Contain Element    ${rejectionText}

Confirm That Update Button Is Interactable
    [Documentation]  Verifies that update button is enabled.
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    Click Button    ${updateButton}

View Plant Details By Customer
    [Documentation]  Opens plane details.
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //button[@id='plantDetail']
    sleep  3s
    run keyword and ignore error  click button  btnView
    run keyword and ignore error  click element   //i[contains(text(),'add_circle')]

Fill Plant Details By Customer
    [Documentation]  Fills details into plant details form.
    #[Arguments]    ${Key Description}
    Input Valid Value    Plant Location    ${Plant["Plant Location"]}
    Input Valid Value    Capacity of Production (in MT)    ${Plant["Capacity of Production (in MT)"]}
    Input Valid Value    Year of Commissioning    ${Plant["Year of Commissioning"]}
    Input Valid Value    Production(MT)(Prev. Year)    ${Plant["Production(MT)(Prev. Year)"]}
    Input Valid Value    Do you Purchase Minerals from Others    ${Plant["Do you Purchase Minerals from Others"]}
    #Input Valid Value    Ratio of Other:RSMML    ${testData["Plant 2001"]["Ratio of Other:RSMML"]}
    Input Valid Value    Estimate Yearly Req.(MT)    ${Plant["Estimate Yearly Req.(MT)"]}
    Input Valid Value    Registration Number    ${Plant["Registration Number"]}
    Input Valid Value    Approx Transport Charges    ${Plant["Approx Transport Charges"]}
    Input Valid Value    Plant Capacity    ${Plant["Plant Capacity"]}
    Input Valid Value    Document Upload    ${Plant["Document Upload"]}
    Sleep    5s
    ${Status}    Run Keyword And Return Status    Page Should Contain Button    ${Key Description["Plant Details Save Button"]["Locator"]}
    Run Keyword If    ${Status}    Input Valid Value    Plant Details Save Button
    ...    ELSE    Input Valid Value    Plant Details Submit Button