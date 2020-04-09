*** Variables ***
${addNewLiabilityPayment}  //i[@class='fa fa-fw fa-plus-circle']
${saveLibilityPayments}  //input[@id='btnSave']
*** Keywords ***
Go To Liability Payments Page
    [Documentation]  Opens liability payments page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Documentation]  Clicks on add new button.
    click element  ${addNewLiabilityPayment}

Fill Liability Form Details
    [Documentation]  Fills details into liability payment form.
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
    [Documentation]  Selects type of disbursement from the dropdown.
    [Arguments]  ${disbursementType}
    click element  //label[contains(text(),'Disbursement Type')]/following-sibling::div//b[@class='caret']
    sleep  3s
    click element  //label[contains(@class,'checkbox')][contains(text(),'${disbursementType}')]

Fetch Employee
    [Documentation]  Click on fetch employee button and verifies that desired employee is listed.
    [Arguments]  ${EMPLOYEECODE}
    click element  //input[@id='btnNext']
    sleep  3s
    ${employeeDetails}  get text  //td[contains(@class,'left')]
    should contain  ${employeeDetails}  ${EMPLOYEECODE}
    capture page screenshot

Save Details
    [Documentation]  Clicks on save buttton.
    click element  ${saveLibilityPayments}

Open Filters
    [Documentation]  Clicks on open filter button.
    click element  //i[@class='fa fa-filter']
    ${status}  run keyword and return status  wait until element is enabled  //div[@class='SearchFilterHeading']
    run keyword if  ${status} == ${FALSE}  LiabilityPayments.Open Filters

Select Filters
    [Documentation]  Choose appropriate filters.
    [Arguments]  ${dataDictionary}  ${status}
    FillFields.Input Value Into Field  ${dataDictionary["Payment_Location"]}  ${dataDictionary["Payment_Location"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Liability_Type"]}  ${dataDictionary["Liability_Type"]["Value"]}
    select from list by label  //select[@id='StatusId']  ${status}

Apply Filters
    [Documentation]  Clicks on apply filter button.
    click element  //button[@id='btnformfilter']

Click On Edit Button
    [Documentation]  Clicks on edit button.
    #@{editButtons}  get webelements  //i[@class='fa fa-pencil']
    #click element  ${editButtons}[0]
    sleep  3s
    click element  //tr[1]//td[9]//a[2]
    Switch Window  NEW

Click On Update Button
    [Documentation]  Clicks on update button.
    click element  //input[@id='btnSave']

Click On Delete Button
    [Documentation]  Opens delete popup and then click on ok button.
    #@{deleteButtons}  get webelements  //a[@class='btn btn-sm btn-danger deleteLink']
    #click element  ${deleteButtons}[1]
    sleep  3s
    click element  //tr[1]//td[9]//div//a[1]
    sleep  2s
    click element  //button[contains(text(),'OK')]

Click On Generate Payment Button
    [Documentation]  Clicks on generate payment button.
    sleep  3s
    click element  //tr[1]//td[9]/a[1]

Select Ledger
    [Documentation]  Selects ledger from the dropdown.
    select from list by index  //select[@id='ACCOUNT_LEDGER_ID']  1

Verify Employee Is Listed
    [Documentation]  Takes employee code as argument and compare it with the listed employee code.
    [Arguments]  ${EMPLOYEECODE}
    ${employeeDetails}  get text  //td[@class='left']
    should contain  ${employeeDetails}  ${EMPLOYEECODE}
    capture page screenshot

Click On Generate Payment
    [Documentation]  Clicks on save button.
    click element  //input[@id='btnSave']