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

Open Filters
    click element  //i[@class='fa fa-filter']
    ${status}  run keyword and return status  wait until element is enabled  //div[@class='SearchFilterHeading']
    run keyword if  ${status} == ${FALSE}  LiabilityPayments.Open Filters

Select Filters
    [Arguments]  ${dataDictionary}  ${status}
    FillFields.Input Value Into Field  ${dataDictionary["Payment_Location"]}  ${dataDictionary["Payment_Location"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Liability_Type"]}  ${dataDictionary["Liability_Type"]["Value"]}
    select from list by label  //select[@id='StatusId']  ${status}

Apply Filters
    click element  //button[@id='btnformfilter']

Click On Edit Button
    #@{editButtons}  get webelements  //i[@class='fa fa-pencil']
    #click element  ${editButtons}[0]
    sleep  3s
    click element  //tr[1]//td[9]//a[2]
    Switch Window  NEW

Click On Update Button
    click element  //input[@id='btnSave']

Click On Delete Button
    #@{deleteButtons}  get webelements  //a[@class='btn btn-sm btn-danger deleteLink']
    #click element  ${deleteButtons}[1]
    sleep  3s
    click element  //tr[1]//td[9]//div//a[1]
    sleep  2s
    click element  //button[contains(text(),'OK')]

Click On Generate Payment Button
    sleep  3s
    click element  //tr[1]//td[9]/a[1]

Select Ledger
    select from list by index  //select[@id='ACCOUNT_LEDGER_ID']  1

Verify Employee Is Listed
    [Arguments]  ${EMPLOYEECODE}
    ${employeeDetails}  get text  //td[@class='left']
    should contain  ${employeeDetails}  ${EMPLOYEECODE}
    capture page screenshot

Click On Generate Payment
    click element  //input[@id='btnSave']