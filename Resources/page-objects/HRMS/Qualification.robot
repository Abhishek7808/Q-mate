*** Settings ***
Documentation    Add, edit and delete qualifications. for more info visit http://support.e-connectsolutions.com/erp/how-to/qualification-configuration/

*** Keywords ***
Search For Qualification
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Qualification Name"]["Value"]}
    click button  BtnSearchfilter

Check For Qualification Entry In Qualification Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Qualification Name"]["Value"]}')]

Check For Qualification Deletion In Qualification Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Qualification Name"]["Value"]}')]