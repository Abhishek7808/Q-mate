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
Go To Leave Encashment Paybill Page
    [Documentation]  Navigates to leave encashment paybill page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Paybill Link
    [Documentation]  Clicks on add paybill link.
    click element  //a[@id='modals-bootbox-custom']
    Wait Until Page Contains        Leave Encashment Paybill        10S

Fill LE Paybill Form
    [Documentation]  Fills details into LE paybill form.
    [Arguments]  ${dataDictionary}
    Fetch Todays Date
    Input Text  ${dataDictionary["Start Date"]["Locator"]}    ${CurrentDay}/${CurrentMonth}/${CurrentFY}
    Input Text  ${dataDictionary["End Date"]["Locator"]}      ${CurrentDay}/${CurrentMonth}/${CurrentFY}
    #Click Element   ${dataDictionary["End Date"]["Locator"]}
    HRMS_Keywords.Select Pay Group    ${dataDictionary}  ${dataDictionary["Pay Group"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Payment Location"]}     ${dataDictionary["Payment Location"]["Value"]}
    Input Text  ${dataDictionary["Remark"]["Locator"]}      ${dataDictionary["Remark"]["Value"]}
    Select from list by label       ${dataDictionary["Pay with"]["Locator"]}        ${dataDictionary["Pay with"]["Value"]}
    Scroll Element InTo View      ${dataDictionary["Save"]["Locator"]}
    Wait until Page contains       ${EMPLOYEEID}        10S


Fetch Todays Date
    [Documentation]  Get Current Date and bi-furcated into Day, Month and FY
    ${currentDate}  get current date
    ${Date}    Split String    ${currentDate}    -
    ${Day}    Split String    ${Date}[2]    ${EMPTY}
    ######Split into variables########
    ${CurrentFY}   set variable     ${Date}[0]
    ${CurrentMonth}   set variable  ${Date}[1]
    ${CurrentDay}   set variable    ${Day}[0]
    Set Global Variable      ${CurrentFY}
    Set Global Variable      ${CurrentMonth}
    Set Global Variable      ${CurrentDay}

Save Details
    [Documentation]  Clicks on save button.
    Click Button    ${dataDictionary["Save"]["Locator"]}
    Wait Until Page Contains    Paybill Saved Successfully !        10s

Open Filters
    [Documentation]  Clicks on open filter button.
    ${status}  run keyword and return status  wait until page contains  Search Filter
    run keyword if  ${status} == ${FALSE}  LeaveEncashmentPaybill.Open Filters
    click element  ${paybillFilters}

Select Status
    [Documentation]  Takes status as argument and selects it from the filter dropdown.
    [Arguments]  ${status}
    select from list by label  //select[@id='status']  ${status}

Apply Filters
    [Documentation]  Clicks on apply filter button.
    click element  ${applyPaybillFilter}

Go To Approve LE Paybill Page
    [Documentation]  Opens approve LE paybill page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/HRM/LeaveEncashmentPaybill?q=brGN8Kdx2cCexVuJlVC+Gg==

Get Latest Paybill Number
    [Documentation]  Fetches paybill number from all the paybills listed and returns latest paybill number.
    #Common_Keywords.Show Maximum Entries On Page
    #${allPaybills}  get element count  ${paybilltable}//tr
    ${paybilNumber}  Get LE Paybill Number   1
    ${paybilNumber}  convert to integer  ${paybilNumber}
    append to list  ${paybillNumbers}  ${paybilNumber}
    sort list  ${paybillNumbers}
    ${listLength}  get length  ${paybillNumbers}
    ${lastIndex}  set variable  ${listLength-1}
    log to console  ${paybillNumbers}[${lastIndex}]
    set global variable  ${latestPaybillCreated}  ${paybillNumbers}[${lastIndex}]
    return from keyword  ${paybillNumbers}[0]

Get LE Paybill Number
    [Documentation]  Fetches and returns salary paybill numbers.
    [Arguments]  ${paybill}
    Wait until Page Contains Element     //div[@class='List']//tbody/tr[1]/td[2]
    Sleep  3s
    capture page screenshot
    ${paybillDetails}   get text    //div[@class='List']//tbody/tr[1]/td[2]
    ${paybill}  split string  ${paybillDetails}  No:
    ${paybillNumber}  split string  ${paybill}[1]  /
    ${PAYBILL_NO}    Set Variable      ${paybillNumber}[0]
    set global variable     ${PAYBILL_NO}
    LOG MANY    @ ${PAYBILL_NO}
    return from keyword  ${paybillNumber}[0]

Search Paybill
    [Documentation]  Searches latest paybill creted by latest paybill number.
    input text  ${searchBox}  ${latestPaybillCreated}
    click element  //button[@id='BtnSearchfilter']

Approve Paybill
    [Documentation]  Clicks on approve text then writes remarks and clicks on save button.
    click element  //${approvalButton}
    wait until element is visible  ${approveText}
    click element  ${approveText}
    sleep  3s
    #click element  //input[@id='CheckSchedule']
    input text  //textarea[@id='Remarks']  xyz
    sleep  3s
    click element  //input[@id='btnSave']
    Wait Until Element Is Not Visible       //input[@id='btnSave']          20s
    sleep  3s

Verify LE Approved Paybill
    [Documentation]  Does varification of approved paybill.
    Log     ${latestPaybillCreated}
    Wait Until Page Contains   ${latestPaybillCreated}       10s