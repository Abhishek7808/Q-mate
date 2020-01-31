*** Settings ***
Documentation    Add, edit and delete sections. For more info visit http://support.e-connectsolutions.com/erp/how-to/section-details-configuration/

*** Keywords ***
Search For Section
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Section Entry In Section Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Section Deletion In Section Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]