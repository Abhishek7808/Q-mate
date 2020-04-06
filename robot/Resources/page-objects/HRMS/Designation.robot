*** Settings ***
Documentation    Create, edit and delete designations. For more info visit http://support.e-connectsolutions.com/erp/how-to/designation/

*** Keywords ***
Go To Designation Page
    [Documentation]  Opens designation page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Search For Designation
    [Documentation]  Searches designation by name.
    [Arguments]  ${dataDictionary}
    wait until page contains element  SearchText
    reload page
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Designation Entry In Designation Table
    [Documentation]  Takes designation name as argument and checks that it is visible on the current page.
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For Designation Deletion In Designation Table
    [Documentation]  Checks that given designation is not visible on the current page.
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Click On Add New Designation Button
    [Documentation]  Clicks on add new designation button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary}

Fill Designation Form
    [Documentation]  Fills details into designation form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Post"]}  ${dataDictionary["Post"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is Fourth Class"]}  ${dataDictionary["Is Fourth Class"]["Value"]}

Save Details
    [Documentation]  Clicks on save button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Input Designation Name Into Search Box
    [Documentation]  Takes designation name as argument and searches it in the list.
    [Arguments]  ${dataDictionary}  ${designationName}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${designationName}

Click On Search Button
    [Documentation]  Clicks on search button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}

Click On Edit Button
    [Documentation]  Waits for the edit button to appear and then clicks on it.
    [Arguments]  ${dataDictionary}
    page should contain element  //a[@class='btn btn-success OpenAddEdit']  5s
    wait until page contains element   //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]  5s
    click element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]/following-sibling::td//a[@class='btn btn-success OpenAddEdit']

Edit Designation Details
    [Documentation]  Edits details of designation.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Name"]}  ${dataDictionary["Edit Designation"]["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Post"]}  ${dataDictionary["Edit Designation"]["Post"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Designation"]["Is Fourth Class"]}  ${dataDictionary["Edit Designation"]["Is Fourth Class"]["Value"]}

Select Designation Checkbox
    [Documentation]  Takes designation name as argument and selects releated checkbox.
    [Arguments]  ${dataDictionary}  ${desingnationName}
    #FillFields.Input Value Into Field  ${dataDictionary["Select Designation"]}  ${desingnationName}
    sleep  3s
    select checkbox  //td[contains(text(),'${desingnationName}')]/preceding-sibling::td//input[@class='SelectItem']

Delete Designation Entry
    [Documentation]  Clicks on delete button then clicks on OK button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

