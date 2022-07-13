*** Variables ***
${AddDisbursment}  Xpath=//a[@id='modals-bootbox-custom']
${DisbursementDate}   Xpath=//input[@id='BillDate']
${CreditDate}   Xpath=//input[@id='CreditDate']
${PendingPaybills}   Xpath=//a[@class='btn btn-primary OpenDialog']
${PaybillNo}  Xpath=//input[@class='SelectItemss']

*** Keywords ***
Go_To_LE_Disbursment_Page
    [Documentation]  Opens LE disbursement page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Disbursment button
    [Documentation]  Clicks on add disbursement button.
    click element  Xpath=//a[@id='modals-bootbox-custom']

Fill Leave Encashment Disbursment Form
    [Documentation]  Fills details in LE disbursement form.
    [Arguments]  ${dataDictionary}
    Set Todays Date
    Input Text  ${dataDictionary["Start_Date"]["Locator"]}  ${currentDay}-${currentMonth[0:3]}-${currentYear}
    Input Text  ${dataDictionary["End_Date"]["Locator"]}  ${currentDay}-${currentMonth[0:3]}-${currentYear}
    HRMS_Keywords.Select Date  ${dataDictionary["Disbursement_Date"]["Locator"]}  ${currentDay}  ${currentMonth[0:3]}  ${currentYear}
    #Input Text  ${dataDictionary["Disbursement_Date"]["Locator"]}  ${currentDay}-${currentMonth[0:3]}-${currentYear}
    Press Key   ${dataDictionary["Disbursement_Date"]["Locator"]}    \ue004
    FillFields.Input Value Into Field  ${dataDictionary["Payment Location"]}  ${dataDictionary["Payment Location"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Pay Group"]}  ${dataDictionary["Pay Group"]["Value"]}
    Sleep   5s
    FillFields.Input Value Into Field  ${dataDictionary["Paybill No"]}  ${PAYBILL_NO}       ##${PAYBILL_NO} is define in LeaveEncashmentPaybill Page-model
    Input Text      ${dataDictionary["Remarks"]["Locator"]}     ${dataDictionary["Remarks"]["Value"]}

Fill Leave Encashment Payment Details Form
    [Documentation]  Fills details in LE Payment Details.
    [Arguments]  ${dataDictionary}
    Set Todays Date
    Input Text  ${dataDictionary["Payment Detail"]["Credit_Date"]["Locator"]}  ${currentDay}/${currentMonth}/${currentYear}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Payment_Mode"]}  ${dataDictionary["Payment Detail"]["Payment_Mode"]["Value"]}
    #FillFields.Input Value Into Field  ${dataDictionary["Payment Detail"]["Company_Bank"]}  state bank of india
    sleep  5s
    select from list by label   ${dataDictionary["Payment Detail"]["Ledger"]["Locator"]}   ${dataDictionary["Payment Detail"]["Ledger"]["Value"]}

Submit Details
    [Documentation]  Clicks on submit button.
    scroll element into view    ${dataDictionary["Save"]["Locator"]}
    Click element     ${dataDictionary["Save"]["Locator"]}

Click On Pending Paybills button
    [Documentation]  Clicks on panding paybill button.
    click element   ${PendingPaybills}

Fill Pending Paybills Form
    [Documentation]  Fills details in pending paybill form.
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial_Year  ${dataDictionary}
    #HRMS_Keywords.Select Month  ${dataDictionary}
    HRMS_Keywords.Select Payment unit  ${dataDictionary}
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
    Set Todays Date
    #click element  //button[@id='btnFilter']
    Wait Until Page Contains Element    //button/i[@class='fa fa-filter']
    click element   //button/i[@class='fa fa-filter']
    ${status}  run keyword and return status  wait until page contains  Search Filter
    run keyword if  ${status} == ${FALSE}  LeaveEncashmentDisbursment.Open Filters

Select Filters
    [Documentation]  Selects values in filters.
    [Arguments]  ${status}
    Clear Element Text	    ${dataDictionary["Filters"]["Bill From Date"]["Locator"]}
    Input Text      ${dataDictionary["Filters"]["Bill From Date"]["Locator"]}     ${currentDay}/${currentMonth}/${currentYear}
    Press Keys   ${dataDictionary["Filters"]["Bill From Date"]["Locator"]}   \ue004
    Clear Element Text	    ${dataDictionary["Filters"]["Bill To Date"]["Locator"]}
    Input Text      ${dataDictionary["Filters"]["Bill To Date"]["Locator"]}     ${currentDay}/${currentMonth}/${currentYear}
    Press Keys    ${dataDictionary["Filters"]["Bill To Date"]["Locator"]}   \ue004
    FillFields.Input Value Into Field  ${dataDictionary["Filters"]["Pay Group"]}  ${dataDictionary["Filters"]["Pay Group"]["Value"]}
    LeaveEncashmentDisbursment.Select Status    ${status}

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
    select from list by label  //td//select[@id='status']  ${status}

Click On Actions Button
    [Documentation]  Clicks on action button.
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

Set Todays Date
    [Documentation]  Fetched Current Date
    ${currentYear}  Common_Keywords.Get Current Year
    ${currentDay}  Common_Keywords.Get Current Day
    ${currentDate}  get current date
    ${currentMonth}  convert date  ${currentDate}  result_format=%m
    set global variable   ${currentMonth}
    set global variable   ${currentYear}
    set global variable   ${currentDay}
    ######### Split the Day with one digit for 0-9 days of months. ############
    #Run Keyword If  ${currentDay} < 10  set global variable   ${currentDay}[1]
    #Run Keyword If  ${currentDay} > 9  set global variable   ${currentDay}
    #set global variable   ${currentMonth}
    #set global variable   ${currentYear}

Click On Pending Paybill button
    [Documentation]  Clicks on pending paybill button.
    click element  //a[@class='btn btn-primary OpenDialog']

Fill Pending Paybill Details
      [Documentation]  Select LE paybill from pending paybill pop-up.
      [Arguments]  ${dataDictionary}
      Log Many  ${dataDictionary["Pending Paybill Pop Up"]["Payment Location"]["Locator"]["Locator1"]}
      Wait Until Page Contains Element     //div[@id='s2id_AccUnitId']  15S
      FillFields.Input Value Into Field  ${dataDictionary["Pending Paybill Pop Up"]["Payment Location"]}  ${dataDictionary["Pending Paybill Pop Up"]["Payment Location"]["Value"]}
      FillFields.Input Value Into Field  ${dataDictionary["Pending Paybill Pop Up"]["Pay Group"]}  ${dataDictionary["Pending Paybill Pop Up"]["Pay Group"]["Value"]}
      Wait Until Page Does Not Contain   No Record Found       60S
      Wait Until Element Is Visible      //tbody/tr[1]/td[1]/input[1]       55S
      Input Text    ${dataDictionary["Pending Paybill Pop Up"]["Paybill No"]["Locator"]}      ${PAYBILL_NO}/${currentYear}
      Sleep     5S
      Press Keys    ${dataDictionary["Pending Paybill Pop Up"]["Paybill No"]["Locator"]}        \ue007
      Sleep     5S
      Wait Until Element Is Not Visible     //div[@id='divModel']//div[@id='classlisting']//div[@class='List']//table//tbody//tr[2]/td[1]/input[1]       50S
      set focus to element  //div[@id='divModel']//div[@id='classlisting']//div[@class='List']//table//tbody//tr//td//input
      Select Checkbox       //div[@id='divModel']//div[@id='classlisting']//div[@class='List']//table//tbody//tr//td//input
      Click Element     ${dataDictionary["Pending Paybill Pop Up"]["Disburse Button"]["Locator"]}

Create Voucher Disbursement
    [Documentation]  Clicks on action button, clicks on approve text then clicks on OK button.
    click element  //a[@class='btn btn-sm btn-primary']
    sleep  2s
    click element  //a[contains(text(),'Voucher')]
    Wait Until Page Contains Element    //input[@id='btnSave']      30s
    Click Element   //input[@id='btnSave']
    Wait Until Page Contains        Leave Encashment Disbursement Voucher Created Successfully      30s
