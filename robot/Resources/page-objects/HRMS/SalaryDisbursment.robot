*** Variables ***
${AddDisbusment}  Xpath=//*[@id="modals-bootbox-custom"]//a[3]

*** Keywords ***
Go To Salary Disbustment Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Disbusment button
    click element  ${AddDisbusment}

Fill Salary Disbusment Form
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    #Select from list by index    ${MultiSelectBoxLocator}    0    1
    #FillFields.Input Value Into Field  ${dataDictionary["Bill Date"]}  ${dataDictionary["Bill Date"]["Value"]}
    HRMS_Keywords.Select Payment unit  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Payslip Unit"]}  ${dataDictionary["Payslip Unit"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Disbursement_Date"]}  ${dataDictionary["Disbursement_Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Credit_Date"]}  ${dataDictionary["Credit_Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Payment_Mode"]}  ${dataDictionary["Payment_Mode"]["Value"]}
