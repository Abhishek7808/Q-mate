*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${lockConfirm}  //button[contains(text(),'OK')]
${checkRequestStatusButton}     //a[contains(text(),'Check Request Status')]

*** Keywords ***
Open Leave Encashment Process Page
    [Documentation]  Opens Leave Encashment Process Page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Action Button
    [Documentation]  Clicks on action button.
    Wait Until Page Contains Element    //a[contains(text(),'Actions')]     20S
    click element  //a[contains(text(),'Actions')]

Click On Process Link
    [Documentation]  Clicks on process button.
    click element  //a[contains(text(),'Process')]
    wait until page contains element  //select[@id='ddlFinyear']  20s

Select Financial year
   [Documentation]  Takes financialyear as argument and selects it from the dropdown.
   [Arguments]  ${financialYear}
   select from list by value  //select[@id='ddlFinyear']  ${financialYear}

Select Month
   [Documentation]  Takes month as argument and selects it from the dropdown.
   [Arguments]  ${month}
   ${FY}    Split String    ${financialYear}    20
   Log Many     ${FY}[1]
   select from list by label  //select[@id='Month']  ${month} ${FY}[1]

Select Employee Location
   [Documentation]  Takes employee location as argument and selects it from the dropdown.
   [Arguments]  ${employeeLocation}
   Wait until page contains element     //select[@id='UnitFilter']
   select from list by label  //select[@id='UnitFilter']  ${employeeLocation}

Select Paygroup
   [Documentation]  Takes employee location as argument and selects it from the dropdown.
   [Arguments]  ${paygroup}
   select from list by label  //select[@id='ddlPB_GROUP_ID']  ${paygroup}

Click On Process Button
   [Documentation]  Clicks on process butoon.
   click element  //a[@id='btnSave']

Click On Final Process Button
   [Documentation]  Clicks on process butoon.
   Switch Window    Process Leave
   Wait until page contains element     //input[@id='btnSave']      10S
   click element  //input[@id='btnSave']

SearchEmployee
    [Documentation]  It will type the employee Code on Search Bar.
    input text   //input[@id='SearchText']      ${EMPLOYEEID}
    Click Element   //button[@id='BtnSearchfilter']

SelectEmployee
    [Documentation]  Selects all listed employees.
    [Arguments]  ${checkboxLocator}
    Wait Until Page Contains Element    ${checkboxLocator}   10s
    Sleep   5s
    #unselect checkbox  ${checkboxLocator}
    select checkbox  ${checkboxLocator}

Click On Lock Button
   [Documentation]  Clicks on lock butoon.
   click element  //div[contains(@class,'col-table')]//li[3]//a[1]

Lock Salary
    [Documentation]  Waits for the popup to be appreared and then clicks on OK button.
    wait until page contains  Do you really want to Lock selected record(s) ?
    sleep  2s
    click element  ${lockConfirm}
    sleep  2s
    capture page screenshot

Open Check Request Status
    [Documentation]  Clicks on Check Request Status button.
    click element   ${checkRequestStatusButton}
    Switch Window   Request Detail
    ProcessLeaveEncashment.Queue Status

Queue Status
    [Documentation]  Recusrively Check LE status until it finished.
    ${status}   Run Keyword And Ignore Error   get text    //tbody/tr[1]/td[4]
    Log Many    Value of ${status}[0], value of ${status}[1]
    capture page screenshot
    Run Keyword And Ignore Error     Run Keyword If    '${status}[1]' == '${Pending}'     Wait Status Queue
                                     ...    ELSE IF    '${status}[1]' == '${Started}'     Wait Status Queue
                                     ...    ELSE      Open Leave Encashment Process Page
    Open Leave Encashment Process Page