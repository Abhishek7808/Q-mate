*** Variables ***
${AddDisbursment}  Xpath=//a[3]//i[1]
${DisbursementDate}   Xpath=//input[@id='BillDate']
${CreditDate}   Xpath=//input[@id='CreditDate']
${PendingPaybills}   Xpath=//a[@class='btn btn-primary OpenDialog']
${PaybillNo}  Xpath=//input[@class='SelectItemss']
*** Keywords ***
Go To Salary Disbursment Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Disbursment button
    click element  ${AddDisbursment}

Fill Salary Disbursment Form
    [Arguments]  ${dataDictionary}
    ${currentMonth}  Common_Keywords.Get Current Month                  ###""" Returns Current Month """
    ${currentYear}  Common_Keywords.Get Current Year
    ${currentDay}  Common_Keywords.Get Current Day
    set global variable   ${currentYear}
    #HRMS_Keywords.Select Financial_Year  ${dataDictionary}
    #HRMS_Keywords.Select Month  ${dataDictionary}
    #set to dictionary  ${dataDictionary["Disbursment_Date"]["Value"]}  Day=${currentDay}  Month=${currentMonth[0:3]}  Year=${currentYear}
    HRMS_Keywords.Select Date  ${DisbursementDate}  ${currentDay}  ${currentMonth[0:3]}  ${currentYear}
    #FillFields.Input Value Into Field  ${dataDictionary["Disbursment_Date"]}  ${dataDictionary["Disbursment_Date"]["Value"]}
    #HRMS_Keywords.Select Payment unit  ${dataDictionary}
    #sleep  2s
    #HRMS_Keywords.Select Multi Paygroups   //*[@id="SalaryPayments"]/div[2]/div[1]/div/button
    #sleep  5s
    #HRMS_Keywords.Select Multi Paybills    //*[@id="SalaryPayments"]/div[2]/div[2]/div/button
    #FillFields.Input Value Into Field  ${dataDictionary["Remarks"]}  ${dataDictionary["Remarks"]["Value"]}
    #sleep  3s
    #set to dictionary  ${dataDictionary["Payment Detail"]["Credit_Date"]["Value"]}  Day=1  Month=${currentMonth[0:3]}  Year=${currentYear}
    #FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Credit_Date"]}  ${dataDictionary["Payment Detail"]["Credit_Date"]["Value"]}
    #HRMS_Keywords.Select Date  ${CreditDate}  ${currentDay}  ${currentMonth[0:3]}  ${currentYear}
    ####   FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Payment Location"]}  ${PAYMENTUNIT}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Payment_Mode"]}  ${dataDictionary["Payment Detail"]["Payment_Mode"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Company_Bank"]}  state bank of india
    sleep  3s
    select from list by index  AccountLedger  1

    #HRMS_Keywords.Select Employee Location  ${dataDictionary}

Submit Details
    Click element     //input[@id='btnSave']

Click On Pending Paybills button
    click element   ${PendingPaybills}

Fill Pending Paybills Form
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial_Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Payment unit  ${dataDictionary}
    HRMS_Keywords.Select Pay Group   ${dataDictionary}  ${PAYGROUP}
    sleep  2s
    Page should contain element   //input[@class='SelectItemss']
    Wait Until Element Is Visible  //input[@class='SelectItemss']
    set focus to element  //input[@class='SelectItemss']
    #Select Checkbox   //input[@class='SelectItemss']
    Click element   //input[@class='SelectItemss']
    click element  //a[@id='btnDisburse']

Disburse Details
    Click element     //a[@id='btnDisburse']

Open Filters
    click element  //button[@id='btnFilter']
    ${status}  run keyword and return status  wait until page contains  Search Filter
    run keyword if  ${status} == ${FALSE}  SalaryDisbursment.Open Filters

Select Filters
    ${finYear}  Common_Keywords.Get Current Financial Year
    select from list by value  //select[@id='Finyear']  ${finYear}
    select from list by label  //select[@id='SalaryCycleId']  ${SALARYCYCLENAME}
    HRMS_Keywords.Select Pay Group   ${dataDictionary["Filters"]}  ${PAYGROUP}
    FillFields.Input Value Into Field  ${dataDictionary["Filters"]["Payment Location"]}  Select All

Apply Filters
    wait until element is enabled  //button[contains(text(),'Apply Filter')]
    set focus to element  //button[contains(text(),'Apply Filter')]
    click element  //button[contains(text(),'Apply Filter')]

Verify Disbursement
    wait until page contains element  //th[contains(text(),'Disbursement Detail')]  50s
    click element  //a[@class='btn btn-primary drpWorkflowAction']
    sleep  2s
    click element  //a[contains(text(),'Verify')]
    sleep  3s
    wait until page contains  Do you really want to Verify selected record(s) ?
    click element  //button[contains(text(),'OK')]

Approve Disbursement
    click element  //a[@class='btn btn-primary drpWorkflowAction']
    sleep  2s
    click element  //a[contains(text(),'Approve')]
    sleep  3s
    wait until page contains  Do you really want to Approve selected record(s) ?
    click element  //button[contains(text(),'OK')]