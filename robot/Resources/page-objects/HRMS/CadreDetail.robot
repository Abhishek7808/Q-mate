*** Settings ***
Documentation    Create, edit and delete cadre, For more info visit http://support.e-connectsolutions.com/erp/how-to/cadre-configuration/

*** Keywords ***
Search For Cadre Detail
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Name"]["Value"]}
    click button  BtnSearchfilter

Check For Cadre Detail Entry In Cadre Detail Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]

Check For Cadre Detail Deletion In Cadre Detail Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Name"]["Value"]}')]