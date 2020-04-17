*** Variables ***

*** Keywords ***
Open Leave Encashment Process Page
    [Documentation]  Opens Leave Encashment Process Page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Action Button
    [Documentation]  Clicks on action button.
    click element  //a[contains(text(),'Actions')]

Click On Process Link
    [Documentation]  Clicks on process button.
    click element  //a[contains(text(),'Process')]
    wait until page contains element  //select[@id='ddlFinyear']  10s

Select Financial year
   [Documentation]  Takes financialyear as argument and selects it from the dropdown.
   [Arguments]  ${financialYear}
   select from list by value  //select[@id='ddlFinyear']  ${financialYear}

Select Month
   [Documentation]  Takes month as argument and selects it from the dropdown.
   [Arguments]  ${month}
   select from list by label  //select[@id='Month']  ${month}

Select Employee Location
   [Documentation]  Takes employee location as argument and selects it from the dropdown.
   [Arguments]  ${employeeLocation}
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
   click element  //input[@id='btnSave']

Click On Lock Button
   [Documentation]  Clicks on lock butoon.
   click element  //div[contains(@class,'col-table')]//li[3]//a[1]