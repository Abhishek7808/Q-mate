*** Settings ***
Documentation    Create, edit and delete Divisions. for more info visit http://support.e-connectsolutions.com/erp/how-to/division-configuration/

*** Keywords ***

Go To Division Page
    [Documentation]  Opens division page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Documentation]  Clicks on add new button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New Division"]}

Click On Edit Button
    [Documentation]  Clicks on edit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Fill Division Form
    [Documentation]  Fills details into division form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}

Save Details
    [Documentation]  Clicks on save button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Check For Division Entry In Division Table
    [Documentation]  Checks that division entry is visible on current page.
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Division Deletion In Division Table
    [Documentation]  Checks that given division entry is not listed on the current page.
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Input Division Name Into Search Box
    [Documentation]  Takes division name as argument and enters it itno the search bar.
    [Arguments]  ${dataDictionary}  ${divisionName}
    FillFields.Input Value Into Field  ${dataDictionary["Search"]["Search Bar"]}  ${divisionName}

Click Search Button
    [Documentation]  Clicks on search button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Search"]["Search Button"]}

Delete Division Entry
    [Documentation]  Clicks on delete butto, waits for the popup to be appeared and then clicks on OK button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    page should contain   Do you really want to Delete this Division ??
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page