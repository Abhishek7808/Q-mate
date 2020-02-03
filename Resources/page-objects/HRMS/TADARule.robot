*** Settings ***
Documentation   Add, edit and delete TA/DA rules. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-ta-da-rule/

*** Keywords ***
Search For TA/DA Rule
    [Arguments]  ${dataDictionary}
    input text  SearchText  ${dataDictionary["Grade"]["Value"]}
    click button  BtnSearchfilter

Check For TA/DA Rule Entry In TA/DA Rule Table
    [Arguments]  ${dataDictionary}
    Page should contain element  //td[contains(text(),'${dataDictionary["Grade"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]

Check For TA/DA Rule Deletion In TA/DA Rule Table
    [Arguments]  ${dataDictionary}
    Page should not contain element  //td[contains(text(),'${dataDictionary["Grade"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Effective From"]["Value"]["Day"]}-${dataDictionary["Effective From"]["Value"]["Month"]}-${dataDictionary["Effective From"]["Value"]["Year"]}')]