*** Settings ***
Documentation    Suite description

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
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/LeaveEncashment/Index?q=8U+3wF0Q7l5j2PeQj4qX4M2S1KctwrB7


Open Filters
    wait until page contains  Users
    sleep  3s
    Input text  ${Search}  Qmate 11
    sleep  2s
    click element  ${filterButton}
    ${status}  run keyword and return status  wait until element is visible  //div[@class='SearchFilterHeading']
    run keyword if  ${status} == ${FALSE}  Leave_encash.Open Filters

Apply Filters
     sleep  2s
    select from list by label  //select[@id='SearchUserTypeId']   Employee
     sleep  2s
    select from list by label  //select[@id='SearchStatusId']    Enabled
    click element  ${applyFilterButton}

Select Employee
    #wait until element is not visible  //div[@id='LoadingImage']//div//img  300
    #FOR  ${employee}  IN RANGE  1  ${NUMBER_OF_EMPLOYEES}+1

Click On Add Leave Encashment Button
    click element  ${actionEMP}

Submit Leave Encashment Application
   Input Text  ${No.Leave}   15
   click element  ${Submit}
   capture page screenshot
   sleep  2s



#Go To Leave Encash Rule Page
    #Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

#Click On Add New Leave Encash Rule Button
    #[Arguments]  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

#Fill Leave Encash Rule Details
    #[Arguments]  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Leave Type"]}  ${dataDictionary["Leave Type"]["Value"]}
    #FillFields.Input Value Into Field  ${dataDictionary["Service Status"]}  ${dataDictionary["Service Status"]["Value"]}

#Save Details
    #[Arguments]  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Save"]}

#Click On Edit Button
    #[Arguments]  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

#Click On fltIcon Button
    #[Arguments]  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

#Edit Rule Detail
    #[Arguments]  ${dataDictionary}
    #FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    #FillFields.Input Value Into Field  ${dataDictionary["Order By"]}  ${dataDictionary["Order By"]["Value"]}
