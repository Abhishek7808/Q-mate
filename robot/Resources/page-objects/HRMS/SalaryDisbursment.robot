*** Variables ***
${AddDisbursment}  Xpath=//a[3]//i[1]

*** Keywords ***
Go To Salary Disbursment Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Disbursment button
    click element  ${AddDisbursment}

Fill Salary Disbursment Form
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial_Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Disbursment_Date"]}  ${dataDictionary["Disbursment_Date"]["Value"]}
    HRMS_Keywords.Select Payment unit  ${dataDictionary}
    HRMS_Keywords.Select Multi Paygroups   //*[@id="SalaryPayments"]/div[2]/div[1]/div/button
    HRMS_Keywords.Select Multi Paybills    //*[@id="SalaryPayments"]/div[2]/div[2]/div/button
    FillFields.Input Value Into Field  ${dataDictionary["Remarks"]}  ${dataDictionary["Remarks"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Credit_Date"]}  ${dataDictionary["Payment Detail"]["Credit_Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Payment_Mode"]}  ${dataDictionary["Payment Detail"]["Payment_Mode"]["Value"]}
Submit Details
    Click element     //input[@id='btnSave']




