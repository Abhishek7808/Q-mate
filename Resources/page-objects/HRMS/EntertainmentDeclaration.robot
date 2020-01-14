*** Settings ***
Documentation    Suite description

*** Variables ***
${tableID}  //table[contains(@class,'table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable')]

*** Keywords ***
Check For The New Entry In Entertainment Declaration Table
    [Arguments]  ${formField}
    ${effectivefrom}  get table cell  ${tableID}  2  3
    ${type}  get table cell  ${tableID}  2  4
    ${rate}  get table cell  ${tableID}  2  5
    ${date}  set variable  ${formField["Effective Date"]["Value"]["Day"]}-${formField["Effective Date"]["Value"]["Month"]}-${formField["Effective Date"]["Value"]["Year"]}
    ${formatteddate}  set variable if  ${formField["Effective Date"]["Value"]["Day"]}<10  0${date}  ELSE  ${date}
    ${formattedrate}  Common_Keywords.Change The Number Into A Formatted Amount  ${formField["Rate"]["Value"]}
    should be equal  ${effectivefrom}  ${formatteddate}
    should be equal  ${type}  ${formField["Type"]["Value"]}
    should be equal  ${rate}  ${formattedrate}
    page should contain element  //td[contains(text(),"1 ")]/following-sibling::td[contains(text(),'${formatteddate}')]/following-sibling::td[contains(text(),'${formField["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formattedrate}')]

Check For The Deletion In Entertainment Declaration Table
    [Arguments]  ${formField}
    ${date}  set variable  ${formField["Effective Date"]["Value"]["Day"]}-${formField["Effective Date"]["Value"]["Month"]}-${formField["Effective Date"]["Value"]["Year"]}
    ${formatteddate}  set variable if  ${formField["Effective Date"]["Value"]["Day"]}<10  0${date}  ELSE  ${date}
    ${formattedrate}  Common_Keywords.Change The Number Into A Formatted Amount  ${formField["Rate"]["Value"]}
    page should not contain element  //td[contains(text(),"1 ")]/following-sibling::td[contains(text(),'${formatteddate}')]/following-sibling::td[contains(text(),'${formField["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formattedrate}')]