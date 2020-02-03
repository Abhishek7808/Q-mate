*** Settings ***
Documentation    Add, edit and delete tea rate definition. For more info visit http://support.e-connectsolutions.com/erp/how-to/configure-tea-rate-definition/

*** Variables ***
${tableID}  //table[contains(@class,'table table-bordered table-condensed table-striped table-primary table-vertical-center checkboxs js-table-sortable ui-sortable')]
${pageUrl}  HRM/Reimbursement/EntertainmentDeclareIndex


*** Keywords ***
Go To Entertainment Declaration Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Declare Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Declare"]}

Search Tea Rate Definition In Entertainment Declaration Table
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Search box"]}  ${dataDictionary["Search box"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Search button"]}

Click On Filter
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Filter"]}

Select Type In Dropdown
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Filter Type"]}  ${dataDictionary["Filter Type"]["Value"]}

Apply Filter
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Apply Filter"]}

Click On Edit Button
    [Arguments]  ${dataDictionary}
    Wait Until Keyword Succeeds    10s    250ms   click element  //td[contains(text(),'${dataDictionary["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Rate"]["Value"]}')]/following-sibling::${dataDictionary["Edit Button"]["Locator"]}
    #FillFields.Input Value Into Field  ${dataDictionary["Edit Button"]}
    #/following-sibling::td[contains(text(),'${dataDictionary["Rate"]["Value"]}')]

Click On Delete Button
    [Arguments]  ${dataDictionary}
    Wait Until Keyword Succeeds    10s    250ms  click element  //td[contains(text(),'${dataDictionary["Edit Tea Rate Definition"]["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${dataDictionary["Edit Tea Rate Definition"]["Rate"]["Value"]}')]/following-sibling::${dataDictionary["Delete"]["Locator"]}

Confirm Delete Entry Popup Appeared
    page should contain  Do you really want to delete selected record(s) ?

Delete Selected Entry
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Ok"]}

Fill Entertainment Declaration Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Effective Date"]}  ${dataDictionary["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Type"]}  ${dataDictionary["Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Rate"]}  ${dataDictionary["Rate"]["Value"]}

Submit Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}


Check For The New Entry In Entertainment Declaration Table
    [Arguments]  ${dataDictionary}
    ${effectivefrom}  get table cell  ${tableID}  2  3
    ${type}  get table cell  ${tableID}  2  4
    ${rate}  get table cell  ${tableID}  2  5
    ${date}  set variable  ${dataDictionary["Effective Date"]["Value"]["Day"]}-${dataDictionary["Effective Date"]["Value"]["Month"]}-${dataDictionary["Effective Date"]["Value"]["Year"]}
    ${formatteddate}  set variable if  ${dataDictionary["Effective Date"]["Value"]["Day"]}<10  0${date}  ELSE  ${date}
    ${formattedrate}  Common_Keywords.Change The Number Into A Formatted Amount  ${dataDictionary["Rate"]["Value"]}
    should be equal  ${effectivefrom}  ${formatteddate}
    should be equal  ${type}  ${dataDictionary["Type"]["Value"]}
    should be equal  ${rate}  ${formattedrate}
    page should contain element  //td[contains(text(),"1 ")]/following-sibling::td[contains(text(),'${formatteddate}')]/following-sibling::td[contains(text(),'${dataDictionary["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formattedrate}')]

Check For The Deletion In Entertainment Declaration Table
    [Arguments]  ${dataDictionary}
    ${date}  set variable  ${dataDictionary["Effective Date"]["Value"]["Day"]}-${dataDictionary["Effective Date"]["Value"]["Month"]}-${dataDictionary["Effective Date"]["Value"]["Year"]}
    ${formatteddate}  set variable if  ${dataDictionary["Effective Date"]["Value"]["Day"]}<10  0${date}  ELSE  ${date}
    ${formattedrate}  Common_Keywords.Change The Number Into A Formatted Amount  ${dataDictionary["Rate"]["Value"]}
    reload page
    page should not contain element  //td[contains(text(),"1 ")]/following-sibling::td[contains(text(),'${formatteddate}')]/following-sibling::td[contains(text(),'${dataDictionary["Type"]["Value"]}')]/following-sibling::td[contains(text(),'${formattedrate}')]