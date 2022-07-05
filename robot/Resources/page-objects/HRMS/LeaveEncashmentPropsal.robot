*** Keywords ***
Go To Leave Encashment Proposal Page
    [Documentation]  Opens leave encashment proposal page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Button
    [Documentation]  Clicks on add new link.
    click element  //a[@id='modals-bootbox-custom']

Fill Proposal Details
    [Documentation]  Fills details into leave encashment proposal form.
    [Arguments]  ${dataDictionary}  ${PAYGROUP}  ${EMPLOYEELOCATION}
    FillFields.Input Value Into Field  ${dataDictionary["Location"]}  ${EMPLOYEELOCATION}
    FillFields.Input Value Into Field  ${dataDictionary["Pay_Group"]}  ${PAYGROUP}




Submit Details
    [Documentation]  Clicks on submit button.
    Wait Until Page Contains    ${EMPLOYEEID}
    click element  //button[@id='btnForward']
    capture page screenshot
    #click element  //button[@id='btnForward']


Verify Details
    [Documentation]  Verify the Record on List.
    Wait Until Page Contains Element    //input[@id='SearchText']
    Input Text   //input[@id='SearchText']      ${EMPLOYEEID}
    Click Element    //button[@id='BtnSearchfilter']
    Wait Until Page Contains Element    //div[@id='classListing']//table//tbody//tr[1]
    capture page screenshot


