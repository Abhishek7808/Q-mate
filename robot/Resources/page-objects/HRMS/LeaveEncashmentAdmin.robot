*** Keywords ***
Go To Leave Encashment Page
    [Documentation]  Opens leave encashment page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Leave Encashment
    [Documentation]  Clicks on add leave encashment button.
    click element  //a[@id='modals-bootbox-custom']

Fill Leave Encashment Details
    [Documentation]  Fills details into leave encashment form.
    [Arguments]  ${dataDictionary}  ${EMPLOYEENAME}
    FillFields.Input Value Into Field  ${dataDictionary["Employee_Name"]}  ${EMPLOYEENAME}
    FillFields.Input Value Into Field  ${dataDictionary["Leave_Type"]}  ${dataDictionary["Leave_Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Leave_Days"]}  ${dataDictionary["Leave_Days"]["Value"]}

Submit Details
    [Documentation]  Clicks on submit button.
    click element  //input[@id='btnSave']

Verify Leave Encashment Entry In Table
    [Documentation]  Takes employee name as argument and checks that it is listed on the current page.
    [Arguments]  ${EMPLOYEENAME}
    page should contain  ${EMPLOYEENAME}