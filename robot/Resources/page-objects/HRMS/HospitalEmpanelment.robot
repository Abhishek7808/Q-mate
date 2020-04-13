*** Settings ***
Documentation    Add, edit and delete Hospital Empanelment. For more info visit http://support.e-connectsolutions.com/erp/how-to/hospital-empanelment-configuration/

*** Keywords ***
Go To Hospital Empanelment Page
    [Documentation]  Opens hospital empanelment page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Search For Hospital Empanelment
    [Documentation]  Takes hospital name as argument and searches it in the table.
    [Arguments]  ${hospitalName}
    wait until page contains element  SearchText
    reload page
    input text  SearchText  ${hospitalName}
    click button  BtnSearchfilter

Select Hospital Empanement
    [Documentation]  Takes hospital name as argument and selects related checkbox.
    [Arguments]  ${hospitalName}
    sleep  3s
    select checkbox  //td[contains(text(),'${hospitalName}')]/preceding-sibling::td//input[1]

Delete Entry
    [Documentation]  Clicks on actions button then clicks on OK button.
    wait until page contains element  //a[contains(text(),'Actions')]
    click element  //a[contains(text(),'Actions')]
    click element  //a[@class='ActionLink']
    sleep  3s
    wait until page contains   Do you really want to delete selected record(s) ?
    click element  //button[contains(text(),'OK')]

Check For Hospital Empanelment Entry In Hospital Empanelment Table
    [Documentation]  Takes hospital name as argument and checks that it is listed on current page.
    [Arguments]  ${hospitalName}
    Page should contain element  //td[contains(text(),'${hospitalName}')]

Check For Hospital Empanelment Deletion In Hospital Empanelment Table
    [Documentation]  Takes hospital name as argument and checks that it is not listed on current page.
    [Arguments]  ${hospitalName}
    Page should not contain element  //td[contains(text(),'${hospitalName}')]

Click On Add New Button
    [Documentation]  Clicks on add new button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Click On Edit Button
    [Documentation]  Clicks on edit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Fill Hospital Empanelment Details
    [Documentation]  Fills details in hospital empanelment form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Type"]}  ${dataDictionary["Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is Exempted"]}  ${dataDictionary["Is Exempted"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Address"]}  ${dataDictionary["Address"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["State"]}  ${dataDictionary["State"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["City"]}  ${dataDictionary["City"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Contact No"]}  ${dataDictionary["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Alternate Contact No"]}  ${dataDictionary["Alternate Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Discount Rate"]}  ${dataDictionary["Discount Rate"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Last Validate"]}  ${dataDictionary["Last Validate"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Category"]}  ${dataDictionary["Category"]["Value"]}

Edit Hospital Empanelment Details
    [Documentation]  Edits details in hospital empanelment form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Name"]}  ${dataDictionary["Edit Hospital Empanelment"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Type"]}  ${dataDictionary["Edit Hospital Empanelment"]["Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Is Exempted"]}  ${dataDictionary["Edit Hospital Empanelment"]["Is Exempted"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Address"]}  ${dataDictionary["Edit Hospital Empanelment"]["Address"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["State"]}  ${dataDictionary["Edit Hospital Empanelment"]["State"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["City"]}  ${dataDictionary["Edit Hospital Empanelment"]["City"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Contact No"]}  ${dataDictionary["Edit Hospital Empanelment"]["Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Alternate Contact No"]}  ${dataDictionary["Edit Hospital Empanelment"]["Alternate Contact No"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Discount Rate"]}  ${dataDictionary["Edit Hospital Empanelment"]["Discount Rate"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Last Validate"]}  ${dataDictionary["Edit Hospital Empanelment"]["Last Validate"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Hospital Empanelment"]["Category"]}  ${dataDictionary["Edit Hospital Empanelment"]["Category"]["Value"]}

Save Details
    [Documentation]  Clicks on save button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}