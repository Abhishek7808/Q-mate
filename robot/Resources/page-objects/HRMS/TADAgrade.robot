*** Settings ***
Documentation    Add, edit and delete TA/DA grade. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-grade/

*** Keywords ***
Search For TA/DA grade
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Grade"]["Value"]}
    click button  BtnSearchfilter

Check For TA/DA grade Entry In TA/DA grade Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Grade"]["Value"]}')]

Check For TA/DA grade Deletion In TA/DA grade Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Grade"]["Value"]}')]