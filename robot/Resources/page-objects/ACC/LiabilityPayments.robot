*** Variables ***
${addNewLiabilityPayment}  //i[@class='fa fa-fw fa-plus-circle']
${saveLibilityPayments}  //input[@id='btnSave']
*** Keywords ***
Go To Liability Payments Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    click element  ${addNewLiabilityPayment}

Fill Liability Form Details
    [Arguments]  ${dataDictionary}
    select from list by value  ${dataDictionary["Financial_Year"]["Locator"]}  ${currentFinancialYear}
#    set to dictionary  ${dataDictionary["Disbursement_From_Date"]["Value"]}  Day=1  Month=${currentMonth[0:3]}  Year=${currentYear}
#    InputFields.Input Date  ${dataDictionary["Start_Date"]["Locator"]}  ${dataDictionary["Start_Date"]["Value"]}
#    LiabilityPayment.Select Disbursement Type  ${DISBURSEMENTTYPE}
    FillFields.Input Value Into Field  ${dataDictionary["Payment_Location"]}  ${dataDictionary["Payment_Location"]["Value"]}
    LiabilityPayments.Select Disbursement Type  Salary
#    FillFields.Input Value Into Field  ${dataDictionary["Disbursement_Type"]}  ${dataDictionary["Disbursement_Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Salary_Period"]}  ${currentSalaryCycleName}
    FillFields.Input Value Into Field  ${dataDictionary["Liability_Type"]}  ${dataDictionary["Liability_Type"]["Value"]}
    set to dictionary  ${dataDictionary["Payment_Date"]["Value"]}  Day=1  Month=${currentMonth[0:3]}  Year=${currentYear}
    InputFields.Input Date  ${dataDictionary["Payment_Date"]["Locator"]}  ${dataDictionary["Payment_Date"]["Value"]}

Select Disbursement Type
    [Arguments]  ${disbursementType}
    click element  //label[contains(text(),'Disbursement Type')]/following-sibling::div//b[@class='caret']
    sleep  3s
    click element  //label[contains(@class,'checkbox')][contains(text(),'${disbursementType}')]

Fetch Employee
    [Arguments]  ${EMPLOYEECODE}
    click element  //input[@id='btnNext']
    sleep  3s
    ${employeeDetails}  get text  //td[contains(@class,'left')]
    should contain  ${employeeDetails}  ${EMPLOYEECODE}
    capture page screenshot

Save Details
    click element  ${saveLibilityPayments}
