*** Settings ***
Documentation    Create, edit and delete Divisions. for more info visit http://support.e-connectsolutions.com/erp/how-to/division-configuration/

*** Keywords ***

Go To Division Page
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/division

Click On Add New Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New Division"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

Fill Division Form
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}

Save Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Check For Division Entry In Division Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Division Deletion In Division Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Input Division Name Into Search Box
    [Arguments]  ${dataDictionary}  ${value}
    FillFields.Input Value Into Field  ${dataDictionary["Search"]["Search Bar"]}  ${value}

Click Search Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Search"]["Search Button"]}

Delete Division Entry
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Delete"]}
    page should contain   Do you really want to Delete this Division ??
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}
    reload page