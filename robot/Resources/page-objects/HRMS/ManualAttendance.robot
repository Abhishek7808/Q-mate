*** Variables ***
${markAttendance}  //a[contains(@class,'btn btn-primary OpenAddEdit')]
${process}  //a[contains(text(),"Process")]
${openFilters}  //i[@class='fa fa-filter']
${financialYearFilter}  ddlFinyearFilter
${salaryCycleFilter}  //select[@id='ddlSalaryCycleIdFilter']
${applyFilters}  //button[@id='btnformfilter']
${actionButton}  //a[@class='btn btn-primary drpWorkflowAction']
${verify}  //a[contains(text(),'Verify')]
${confirmVerify}  //button[contains(text(),'OK')]
${approve}  //a[contains(text(),'Approve')]
${confirmApprove}  //button[contains(text(),'OK')]
${employeeTable}  //table[@id='tab']

*** Keywords ***
Go To Manual Attendance Page
    [Documentation]  Opens Manual Attendance Page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Mark Attendance Button
    [Documentation]  Clicks on Mark Attendance button and opens Mark Attendance filter.
    Click element  ${markAttendance}
    sleep  2s
    wait until page contains  Financial Year

Apply Criteria
    [Documentation]  Clicks on Apply Filter Button.
    click element  ${process}


Select Employees
    [Documentation]  Switches to new tab and selects all employees.
    switch window  NEW
    select checkbox  //input[@id='chk_all']
#    FOR  ${employee}  IN RANGE  1  ${NUMBER_OF_EMPLOYEES}+1
#    \   select checkbox  ${employeeTable}/tbody/tr[${employee}]/td[1]/input

Select First Employee
    [Documentation]  Switches to new tab and selects top most listed employee.
    switch window  NEW
    Select checkbox  //tr[1]//td[1]//input[1]

Load Employee Code
    [Documentation]  Fetches employee code of the top most listed employee and appends it to a file.
    ${employeeCode}  get text  //tr[1]//td[3]
    log  ${employeeCode}
    Common_Keywords.Create Employee File
    append to file  ${EMPLOYEE_FILE}  ${employeeCode}

Search Employee
    [Documentation]  Takes employee code as argument and searhces it in the list.
    [Arguments]  ${employeeCode}
    switch window  NEW
    input text  //div[@class='col-md-8']//input[@class='form-control']  ${employeeCode}

Select Given Employee
    [Documentation]  Takes employee code as argument and selects related checkbox.
    [Arguments]  ${employeeCode}
    select checkbox  //input[@class='SelectItem']

Click On Submit Button
    [Documentation]  Clicks on submit button.
    click element  //input[@id='btnsave']

Verify Submit Popup
    [Documentation]  Checks that submit popup text is visible on the current page.
    wait until page contains  Do you want to submit attendance for the selected employees?

Click On Ok Button
    [Documentation]  Clicks on OK button.
    sleep  4s
    click element  //button[contains(@class,'btn btn-primary')]
    sleep  4s

Open Filters
    [Documentation]  Waits until filter button is appears on the page and then clicks on it.
    wait until element is enabled  ${openFilters}  50s
    click element  ${openFilters}
    ${status}  run keyword and return status  wait until element is enabled  //div[@class='SearchFilterHeading']
    run keyword if  ${status} == ${FALSE}  ManualAttendance.Open Filters

Select Financial Year Filter
    [Documentation]  Selects financial year from the dropdown.
    select from list by value  ${financialYearFilter}  ${financialYear}

Select Salary Cycle Filter
    [Documentation]  If user gives salary cycle id then selects salary cycle from the dropdown by the given id else selects current salary cycle.
    run keyword if  ${SALARYCYCLEID} != None  select from list by value  ${salaryCycleFilter}  ${SALARYCYCLEID}
    run keyword if  ${SALARYCYCLEID} == None  select from list by label   ${salaryCycleFilter}  ${salaryCycleName}

Apply Filters
    [Documentation]  Clicks on apply filter button.
    click element  ${applyFilters}

Click On Actions Button
    [Documentation]  Takes status and paygroup as argument and clicks on action button of the listed entry in which both given status and paygroup is visible.
    [Arguments]  ${status}  ${payGroup}
    click element  //td[contains(text(),'${payGroup}')]/following-sibling::td[contains(text(),'${status}')]/following-sibling::td${actionButton}

Verify Attendance
    [Documentation]  Waits until verify text is visible on the page then clicks on it and then wait for the popup to be appeared and then clicks on OK button.
    wait until element is visible  ${verify}
    click element  ${verify}
    wait until page contains  Do you really want to Verify selected record(s) ?
    wait until element is enabled  ${confirmVerify}
    sleep  2s
    click element  ${confirmVerify}

Choose Approve
    [Documentation]  Waits until Approve text is visible on the page then clicks on it and then wait for the popup to be appeared and then clicks on OK button.
    wait until element is visible  ${approve}
    click element  ${approve}
    wait until page contains  Do you really want to Approve selected record(s) ?
    wait until element is enabled  ${confirmApprove}
    sleep  2s
    click element  ${confirmApprove}

Select Status
    [Documentation]  Takes status as argument and selects it from the dropdown.
    [Arguments]  ${status}
    select from list by label  //select[@id='Status']  ${status}