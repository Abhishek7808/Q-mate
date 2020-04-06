*** Settings ***
Documentation    Add, edit and delete qualifications. for more info visit http://support.e-connectsolutions.com/erp/how-to/qualification-configuration/

*** Keywords ***
Go To Qualification Page
    [Documentation]  Opens Qualification page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Search For Qualification
    [Documentation]  Takes qualfication name as argument and searhces it in the list.
    [Arguments]  ${value}
    wait until page contains element  SearchText
    reload page
    input text  SearchText  ${value}
    click button  BtnSearchfilter

Check For Qualification Entry In Qualification Table
    [Documentation]  Takes qualfication name as argument and checks that it is visible on the current page.
    [Arguments]  ${value}
    Page should contain element  //td[contains(text(),'${value}')]

Check For Qualification Deletion In Qualification Table
    [Documentation]  Takes qualfication name as argument and checks that it is not visible on the current page.
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Qualification Name"]["Value"]}')]

Click On Add New Button
    [Documentation]  Clicks on add new button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Add New"]}

Fill Qualification Details
    [Documentation]  Fills details in qualification form.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Qualification Name"]}  ${dataDictionary["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Is professional"]}  ${dataDictionary["Is professional"]["Value"]}

Click On Edit Button
    [Documentation]  Clicks on edit button.
    [Arguments]  ${value}
    click element  //td[contains(text(),'${value}')]

Edit Qualification Details
    [Documentation]  Edits details in qualification from.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Qualification"]["Qualification Name"]}  ${dataDictionary["Edit Qualification"]["Qualification Name"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Edit Qualification"]["Is professional"]}  ${dataDictionary["Edit Qualification"]["Is professional"]["Value"]}

Save Details
    [Documentation]  Clicks on submit button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
