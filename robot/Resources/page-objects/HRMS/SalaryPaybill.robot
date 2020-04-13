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
    [Documentation]  Opens salary paybill page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Go To Approve Salary Paybill Page
    [Documentation]  Opens approve salary paybill page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/SalaryPaybill/Index?q=brGN8Kdx2cCexVuJlVC+Gg==

Click On Add Paybill button
    [Documentation]  Clicks on add paybill button.
    click element  ${addPaybill}

Fill Salary Paybill Form
    [Documentation]  Fills details into salary paybill form.
    [Arguments]  ${dataDictionary}
    HRMS_Keywords.Select Financial Year  ${dataDictionary}
    HRMS_Keywords.Select Month  ${dataDictionary}
    SalaryPaybill.Unselect Employee Location
    HRMS_Keywords.Select Pay Group  ${dataDictionary}  ${PAYGROUP}
    sleep  5s
    HRMS_Keywords.Select Payment unit  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Payslip Unit"]}  ${PAYSLIPUNIT}

Unselect Employee Location
    [Documentation]  Unselects previously selected employee location.
    set focus to element  //body[contains(@class,'breakpoint-768 pace-done')]/div[@id='containerfluid']/div[@id='content']/div[@id='MainBody']/form[contains(@class,'form-horizontal')]/div[contains(@class,'layout-app')]/div[contains(@class,'col-md-12')]/div[contains(@class,'col-separator box col-separator-first col-unscrollable')]/div[contains(@class,'col-table-row')]/div[contains(@class,'col-app')]/div[contains(@class,'col-table-row')]/div[contains(@class,'col-app hasNiceScroll')]/div[contains(@class,'widget-body innerAll inner-2x')]/div[contains(@class,'row')]/div[1]/div[1]
    click element  //body[contains(@class,'breakpoint-768 pace-done')]/div[@id='containerfluid']/div[@id='content']/div[@id='MainBody']/form[contains(@class,'form-horizontal')]/div[contains(@class,'layout-app')]/div[contains(@class,'col-md-12')]/div[contains(@class,'col-separator box col-separator-first col-unscrollable')]/div[contains(@class,'col-table-row')]/div[contains(@class,'col-app')]/div[contains(@class,'col-table-row')]/div[contains(@class,'col-app hasNiceScroll')]/div[contains(@class,'widget-body innerAll inner-2x')]/div[contains(@class,'row')]/div[1]/div[1]
    click element  //label[contains(text(),'Select all')]
    click element  //label[contains(text(),'Select all')]

Submit Details
    [Documentation]  Clicks on submit button.
    click element  ${savePaybill}

Open Filters
    [Documentation]  Clicks on open filter button.
    ${status}  run keyword and return status  wait until page contains  Search Filter
    run keyword if  ${status} == ${FALSE}  SalaryPaybill.Open Filters
    click element  ${paybillFilters}

Open Approve Paybill Filters
    [Documentation]  Opens approve paybill filters.
    wait until page contains  ${paybillFilters}  15s
    click element  ${paybillFilters}

Apply Filters
    [Documentation]  Clicks on apply filter button.
    click element  ${applyPaybillFilter}

Get Latest Paybill Number
    [Documentation]  Fetches paybill number from all the paybills listed and returns latest paybill number.
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
    return from keyword  ${paybillNumbers}[0]

Get Salary Paybill Number
    [Documentation]  Fetches and returns salary paybill numbers.
    [Arguments]  ${paybill}
    ${paybillDetails}  get table cell  ${paybilltable}  ${paybill}  2
    ${paybill}  split string  ${paybillDetails}  No. :
    ${paybillNumber}  split string  ${paybill}[1]  /
    return from keyword  ${paybillNumber}[0]

Search Paybill
    [Documentation]  Searches latest paybill creted by latest paybill number.
    input text  ${searchBox}  ${latestPaybillCreated}
    click element  //button[@id='BtnSearchfilter']

Verify Paybill
    [Documentation]  Clicks on verify text then writes remarks and clicks on save button.
    click element  //${approvalButton}
    ${status}  run keyword and return status  wait until element is visible  ${verifyText}
    run keyword if  ${status} == ${FALSE}  SalaryPaybill.Verify Paybill
    click element  ${verifyText}
    sleep  3s
    click element  //input[@id='CheckSchedule']
    input text  //textarea[@id='Remarks']  xyz
    click element  //input[@id='btnSave']

Approve Paybill
    [Documentation]  Clicks on approve text then writes remarks and clicks on save button.
    click element  //${approvalButton}
    wait until element is visible  ${approveText}
    click element  ${approveText}
    sleep  3s
    click element  //input[@id='CheckSchedule']
    input text  //textarea[@id='Remarks']  xyz
    click element  //input[@id='btnSave']

Select Status
    [Documentation]  Takes status as argument and selects it from the filter dropdown.
    [Arguments]  ${status}
    select from list by label  //select[@id='status']  ${status}