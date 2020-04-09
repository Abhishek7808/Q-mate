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
    FillFields.Input Value Into Field  ${dataDictionary["Pay_Group"]}  ${PAYGROUP}
    FillFields.Input Value Into Field  ${dataDictionary["Pay_Group"]}  ${EMPLOYEELOCATION}

Submit Details
    [Documentation]  Clicks on submit button.
    click element  //button[@id='btnForward']

