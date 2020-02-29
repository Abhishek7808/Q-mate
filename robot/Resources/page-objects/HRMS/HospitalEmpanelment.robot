*** Settings ***
Documentation    Add, edit and delete Hospital Empanelment. For more info visit http://support.e-connectsolutions.com/erp/how-to/hospital-empanelment-configuration/

*** Keywords ***
Go To Hospital Empanelment Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Search For Hospital Empanelment
    [Arguments]  ${dataDictionary}
    wait until page contains element  SearchText
    reload page
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Hospital Empanelment Entry In Hospital Empanelment Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Hospital Empanelment Deletion In Hospital Empanelment Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Click On Add New Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Fill Hospital Empanelment Details
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

Save Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}