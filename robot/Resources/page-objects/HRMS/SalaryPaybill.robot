*** Variables ***
${addPaybill}  //a[@id='modals-bootbox-custom']
${savePaybill}  //input[@id='btnSave']
${paybillFilters}  //button[@class='btn btn-default']
${applyPaybillFilter}  //button[@id='btnformfilter']
${paybilltable}  //table[@class='table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable']
${searchBox}  //input[@id='SearchText']
${approvalButton}  a[contains(@class,'btn btn-primary drpWorkflowAction')]
${verifyText}  //a[contains(text(),'Verify and Forward for Approval')]
${approveText}  //a[contains(text(),'Approve')]
@{paybillNumbers}
*** Keywords ***
Go To Salary Paybill Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Go To Approve Salary Paybill Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/SalaryPaybill/Index?q=brGN8Kdx2cCexVuJlVC+Gg==

Click On Add Paybill button
    click element  ${addPaybill}

Fill Salary Paybill Form
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    SalaryPaybill.Unselect Employee Location
#    ${PAYGROUP}  set variable if  ${TEST_PAYGROUP} == None  ${PAYGROUP}  ${TEST_PAYGROUP}
#    set global variable  ${PAYGROUP}
    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${PAYGROUP}
    sleep  5s
    #HRMS_Keywords.Select Employee Location  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Bill Date"]}  ${dataDictionary["Bill Date"]["Value"]}
    HRMS_Keywords.Select Payment unit  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Payslip Unit"]}  ${PAYSLIPUNIT}

Unselect Employee Location
    set focus to element  //body[contains(@class,'breakpoint-768 pace-done')]/div[@id='containerfluid']/div[@id='content']/div[@id='MainBody']/form[contains(@class,'form-horizontal')]/div[contains(@class,'layout-app')]/div[contains(@class,'col-md-12')]/div[contains(@class,'col-separator box col-separator-first col-unscrollable')]/div[contains(@class,'col-table-row')]/div[contains(@class,'col-app')]/div[contains(@class,'col-table-row')]/div[contains(@class,'col-app hasNiceScroll')]/div[contains(@class,'widget-body innerAll inner-2x')]/div[contains(@class,'row')]/div[1]/div[1]
    click element  //body[contains(@class,'breakpoint-768 pace-done')]/div[@id='containerfluid']/div[@id='content']/div[@id='MainBody']/form[contains(@class,'form-horizontal')]/div[contains(@class,'layout-app')]/div[contains(@class,'col-md-12')]/div[contains(@class,'col-separator box col-separator-first col-unscrollable')]/div[contains(@class,'col-table-row')]/div[contains(@class,'col-app')]/div[contains(@class,'col-table-row')]/div[contains(@class,'col-app hasNiceScroll')]/div[contains(@class,'widget-body innerAll inner-2x')]/div[contains(@class,'row')]/div[1]/div[1]
    click element  //label[contains(text(),'Select all')]
    click element  //label[contains(text(),'Select all')]

Submit Details
    click element  ${savePaybill}

Open Filters
    ${status}  run keyword and return status  wait until page contains  Search Filter
    run keyword if  ${status} == ${FALSE}  SalaryPaybill.Open Filters
    click element  ${paybillFilters}

Open Approve Paybill Filters
    wait until page contains  ${paybillFilters}  15s
    click element  ${paybillFilters}

Apply Filters
    click element  ${applyPaybillFilter}

Get Latest Paybill Number
    Common_Keywords.Show Maximum Entries On Page
    ${allPaybills}  get element count  ${paybilltable}//tr
    FOR  ${paybill}  IN RANGE  2  ${allPaybills+1}
    \   ${paybilNumber}  Get Salary Paybill Number  ${paybill}
    \   ${paybilNumber}  convert to integer  ${paybilNumber}
    \   append to list  ${paybillNumbers}  ${paybilNumber}
    sort list  ${paybillNumbers}
    ${listLength}  get length  ${paybillNumbers}
    ${lastIndex}  set variable  ${listLength-1}
    log to console  ${paybillNumbers}[${lastIndex}]
    set global variable  ${latestPaybillCreated}  ${paybillNumbers}[${lastIndex}]

#    remove from list  ${DISBURSEMENT_PAYBILLS}  0
#    append to list  ${DISBURSEMENT_PAYBILLS}  ${latestPaybillCreated}
#    set global variable  ${DISBURSEMENT_PAYBILLS}
    return from keyword  ${paybillNumbers}[0]

Get Salary Paybill Number
    [Arguments]  ${paybill}
    ${paybillDetails}  get table cell  ${paybilltable}  ${paybill}  2
    ${paybill}  split string  ${paybillDetails}  No. :
    ${paybillNumber}  split string  ${paybill}[1]  /
    return from keyword  ${paybillNumber}[0]

Search Paybill
    input text  ${searchBox}  ${latestPaybillCreated}
    click element  //button[@id='BtnSearchfilter']

Verify Paybill
    #click element  //td[contains(text(),'Pending')]/following-sibling::${approvalButton}
    click element  //${approvalButton}
    ${status}  run keyword and return status  wait until element is visible  ${verifyText}
    run keyword if  ${status} == ${FALSE}  SalaryPaybill.Verify Paybill
    click element  ${verifyText}
    sleep  3s
    #wait until page contains  Do you really want to Verify and Forward for Approval selected record(s) ?
    click element  //input[@id='CheckSchedule']
    input text  //textarea[@id='Remarks']  xyz
    click element  //input[@id='btnSave']

Approve Paybill
    #click element  //td[contains(text(),'Verified')]/following-sibling::${approvalButton}
    click element  //${approvalButton}
    wait until element is visible  ${approveText}
    click element  ${approveText}
    sleep  3s
    click element  //input[@id='CheckSchedule']
    input text  //textarea[@id='Remarks']  xyz
    #wait until page contains  Do you really want to Forward For Approval selected record(s) ?
    click element  //input[@id='btnSave']

Select Status
    [Arguments]  ${status}
    select from list by label  //select[@id='status']  ${status}