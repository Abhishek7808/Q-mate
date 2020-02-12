*** Variables ***
${addPaybill}  //a[@id='modals-bootbox-custom']

*** Keywords ***
Go To Salary Paybill Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Paybill button
    click element  ${addPaybill}

Fill Salary Paybill Form
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Bill Date"]}  ${dataDictionary["Bill Date"]["Value"]}
    HRMS_Keywords.Select Payment unit  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Payslip Unit"]}  ${dataDictionary["Payslip Unit"]["Value"]}

