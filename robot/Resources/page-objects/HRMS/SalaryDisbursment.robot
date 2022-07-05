*** Variables ***
${AddDisbursment}  Xpath=//a[3]//i[1]
${DisbursementDate}   Xpath=//input[@id='BillDate']
${CreditDate}   Xpath=//input[@id='CreditDate']
${PendingPaybills}   Xpath=//a[@class='btn btn-primary OpenDialog']
${PaybillNo}  Xpath=//input[@class='SelectItemss']
*** Keywords ***
Go To Salary Disbursment Page
    [Documentation]  Opens salary disbursement page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Disbursment button
    [Documentation]  Clicks on add disbursement button.
    click element  ${AddDisbursment}

Fill Salary Disbursment Form
    [Documentation]  Fills details in salary disbursement form.
    [Arguments]  ${dataDictionary}
    ${currentMonth}  Common_Keywords.Get Current Month                  ###""" Returns Current Month """
    ${currentYear}  Common_Keywords.Get Current Year
    ${currentDay}  Common_Keywords.Get Current Day
    set global variable   ${currentYear}
    #HRMS_Keywords.Select Date  ${DisbursementDate}  ${currentDay}  ${currentMonth[0:3]}  ${currentYear}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Payment_Mode"]}  ${dataDictionary["Payment Detail"]["Payment_Mode"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Company_Bank"]}  state bank of india
    sleep  3s
    select from list by index  AccountLedger  1

Submit Details
    [Documentation]  Clicks on submit button.
    Click element     //input[@id='btnSave']

Click On Pending Paybills button
    [Documentation]  Clicks on panding paybill button.
    click element   ${PendingPaybills}

Fill Pending Paybills Form
    [Documentation]  Fills details in pending paybill form.
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial_Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    #HRMS_Keywords.Select Payment unit  ${dataDictionary}
    #HRMS_Keywords.Select Pay Group   ${dataDictionary}  ${PAYGROUP}
    sleep  2s
    Page should contain element   //input[@class='SelectItemss']
    Wait Until Element Is Visible  //input[@class='SelectItemss']
    set focus to element  //input[@class='SelectItemss']
    Click element   //input[@class='SelectItemss']
    click element  //a[@id='btnDisburse']

Disburse Details
    [Documentation]  Clicks on disburse button.
    Click element     //a[@id='btnDisburse']

Open Filters
    [Documentation]  Opens filter.
    sleep  4s
    #click element  //button[@id='btnFilter']
    click element   //button/i[@class='fa fa-filter']
    ${status}  run keyword and return status  wait until page contains  Search Filter
    run keyword if  ${status} == ${FALSE}  SalaryDisbursment.Open Filters

Select Filters
    [Documentation]  Selects values in filters.
    [Arguments]  ${status}
    HRMS_Keywords.Select Financial Year  ${dataDictionary["Filters"]}
    HRMS_Keywords.Select Month   ${dataDictionary["Filters"]}
    #HRMS_Keywords.Select Pay Group   ${dataDictionary["Filters"]}  ${PAYGROUP}
    #FillFields.Input Value Into Field  ${dataDictionary["Filters"]["Payment Location"]}  Select All
    SalaryDisbursment.Select Status  ${status}

Apply Filters
    [Documentation]  Clicks on apply filter button.
    wait until element is enabled  //button[contains(text(),'Apply Filter')]
    set focus to element  //button[contains(text(),'Apply Filter')]
    click element  //button[contains(text(),'Apply Filter')]

Verify Disbursement
    [Documentation]  Clicks on action button, clicks on verify text then clicks on OK button.
    wait until page contains element  //th[contains(text(),'Disbursement Detail')]  50s
    click element  //a[@class='btn btn-primary drpWorkflowAction']
    sleep  2s
    wait until page contains  //a[contains(text(),'Verify')]
    click element  //a[contains(text(),'Verify')]
    sleep  3s
    wait until page contains  Do you really want to Verify selected record(s) ?
    click element  //button[contains(text(),'OK')]

Approve Disbursement
    [Documentation]  Clicks on action button, clicks on approve text then clicks on OK button.
    click element  //a[@class='btn btn-primary drpWorkflowAction']
    sleep  2s
    click element  //a[contains(text(),'Approve')]
    sleep  3s
    wait until page contains  Do you really want to Approve selected record(s) ?
    click element  //button[contains(text(),'OK')]

Select Status
    [Documentation]  Takes status as argument and selects repective filter from the dropdown.
    [Arguments]  ${status}
    select from list by label  //select[@id='Status']  ${status}

Click On Actions Button
    [Documentation]  Clicks on action button.
    page should contain element  //span[contains(text(),'Voucher Not Generated')]
    click element  //span[contains(text(),'Voucher Not Generated')]/../following-sibling::td//a[contains(@class,'btn btn-sm btn-primary')]
    sleep  2s

Select Voucher
    [Documentation]  Clicks on voucher text.
    click element  //span[contains(text(),'Voucher Not Generated')]/../following-sibling::td//a[contains(text(),'Voucher')]

Save Voucher
    [Documentation]  Clicks on save voucher button.
    wait until element is not visible  //div[@id='divModel']//div//img  150s
    wait until element is enabled  //input[@id='btnSave']  15s
    click element  //input[@id='btnSave']