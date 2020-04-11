*** Variables ***

${hrmsConfigurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json
${hrmsSalaryData}  ${DATA}/HRMS_DATA/HrmsData.json
${urlsJson}   ${DATA}/URLs.json
${modules}  //button[@id='on_scroll']

${filterButton}  //button[@class='btn btn-default']
${applyFilterButton}  //button[@id='btnformfilter']

${ADD_Leave}  //a[@id='modals-bootbox-custom']
${No.Leave}  //input[@id='LEAVE_DAYS_APPLIED']
${Search}  //input[@id='SearchText']
${Submit}  //input[@id='btnSave']

*** Keywords ***

Go To Employee Privilege Leave Encashment Page
    [Documentation]  Opens privilege leave encashment page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/LeaveEncashment/Index?q=8U+3wF0Q7l5j2PeQj4qX4M2S1KctwrB7

Open Filters
    [Documentation]  Clicks on open filter button.
    wait until page contains  Users
    sleep  3s
    Input text  ${Search}  Qmate 11
    sleep  2s
    click element  ${filterButton}
    ${status}  run keyword and return status  wait until element is visible  //div[@class='SearchFilterHeading']
    run keyword if  ${status} == ${FALSE}  Leave_encash.Open Filters

Apply Filters
    [Documentation]  Clicks on apply filter button.
    sleep  2s
    select from list by label  //select[@id='SearchUserTypeId']   Employee
    sleep  2s
    select from list by label  //select[@id='SearchStatusId']    Enabled
    click element  ${applyFilterButton}

Click On Add Leave Encashment Button
    [Documentation]  Clicks on add leave encashment button.
    click element  ${ADD_Leave}

Submit Leave Encashment Application
    [Documentation]  Clicks on submit leave encashment button.
    Input Text  ${No.Leave}   15
    click element  ${Submit}
    capture page screenshot
    sleep  2s


