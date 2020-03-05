*** Settings ***
Documentation     Create, edit and delete empanelled officer. For more info visit http://support.e-connectsolutions.com/erp/how-to/assigning-empanelled-officer/


*** Keywords ***
Go To Empanelled Officer Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New Entry"]}

Fill Empanelled Officer Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Name"]}  ${dataDictionary["Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Contact No."]}  ${dataDictionary["Contact No."]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective Date"]}  ${dataDictionary["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Effective Till Date"]}  ${dataDictionary["Effective Till Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Department"]}  ${dataDictionary["Department"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Designation"]}  ${dataDictionary["Designation"]["Value"]}

Save Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

Search For Empanelled Officer
    [Arguments]  ${dataDictionary}
    wait until page contains element  SearchText
    reload page
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Empanelled Officer Entry In Empanelled Officer Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Empanelled Officer Deletion In Empanelled Officer Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]


