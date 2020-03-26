*** Keywords ***
Go To Leave Encashment Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Leave Encashment
    click element  //a[@id='modals-bootbox-custom']

Fill Leave Encashment Details
    [Arguments]  ${dataDictionary}  ${EMPLOYEENAME}
    FillFields.Input Value Into Field  ${dataDictionary["Employee_Name"]}  ${EMPLOYEENAME}
    FillFields.Input Value Into Field  ${dataDictionary["Leave_Type"]}  ${dataDictionary["Leave_Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Leave_Days"]}  ${dataDictionary["Leave_Days"]["Value"]}

Submit Details
    click element  //input[@id='btnSave']

Verify Leave Encashment Entry In Table
    [Arguments]  ${EMPLOYEENAME}
    page should contain  ${EMPLOYEENAME}