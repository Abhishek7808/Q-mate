*** Settings ***
Documentation    Add, edit and delete Hospital Empanelment. For more info visit http://support.e-connectsolutions.com/erp/how-to/hospital-empanelment-configuration/

*** Keywords ***
Go To Hospital Empanelment Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Search For Hospital Empanelment
    [Arguments]  ${value}
    wait until page contains element  SearchText
    reload page
    input text  SearchText  ${value}
    click button  BtnSearchfilter

Select Hospital Empanement
    [Arguments]  ${value}
    select checkbox  //td[contains(text(),'${value}')]/preceding-sibling::td//input[1]

Delete Entry
    click element  //a[contains(text(),'Actions')]
    wait until page contains  //a[contains(text(),'Actions')]
    click element  //a[contains(text(),'Actions')]
    wait until page contains   Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  //button[contains(text(),'OK')]


Check For Hospital Empanelment Entry In Hospital Empanelment Table
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For Hospital Empanelment Deletion In Hospital Empanelment Table
    [Arguments]  ${value}
    Page should not contain element  //td[contains(text(),'${value}')]

Click On Add New Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit"]}

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

Edit Hospital Empanelment Details
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
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}