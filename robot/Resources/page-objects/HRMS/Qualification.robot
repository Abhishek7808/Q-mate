*** Settings ***
Documentation    Add, edit and delete qualifications. for more info visit http://support.e-connectsolutions.com/erp/how-to/qualification-configuration/

*** Keywords ***
Search For Qualification
    [Arguments]  ${value}
    wait until page contains element  SearchText
    reload page
    input text  SearchText  ${value}
    click button  BtnSearchfilter

Check For Qualification Entry In Qualification Table
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For Qualification Deletion In Qualification Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Qualification Name"]["Value"]}')]

Go To Qualification Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add New Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Fill Qualification Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Qualification Name"]}  ${dataDictionary["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is professional"]}  ${dataDictionary["Is professional"]["Value"]}

Click On Edit Button
    [Arguments]  ${value}
    click element  //td[contains(text(),'${value}')]

Edit Qualification Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Qualification"]["Qualification Name"]}  ${dataDictionary["Edit Qualification"]["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Qualification"]["Is professional"]}  ${dataDictionary["Edit Qualification"]["Is professional"]["Value"]}

Save Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
