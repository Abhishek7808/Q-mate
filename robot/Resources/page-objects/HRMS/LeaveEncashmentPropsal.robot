*** Keywords ***
Go To Leave Encashment Proposal Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Button
    click element  //a[@id='modals-bootbox-custom']

Fill Proposal Details
    [Arguments]  ${dataDictionary}  ${PAYGROUP}  ${EMPLOYEELOCATION}
    FillFields.Input Value Into Field  ${dataDictionary["Pay_Group"]}  ${PAYGROUP}
    FillFields.Input Value Into Field  ${dataDictionary["Pay_Group"]}  ${EMPLOYEELOCATION}

Submit Details
    click element  //button[@id='btnForward']

