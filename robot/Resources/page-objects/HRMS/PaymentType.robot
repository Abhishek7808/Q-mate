*** Settings ***
Documentation    Add edit and delete Payment type. For more info visit http://support.e-connectsolutions.com/erp/how-to/payment-type-configuration/

*** Keywords ***
Search For Payment Type
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Description"]["Value"]}
    click button  BtnSearchfilter

Check For Payment Type Entry In Payment Type Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Description"]["Value"]}')]

Check For Payment Type Deletion In Payment Type Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Description"]["Value"]}')]