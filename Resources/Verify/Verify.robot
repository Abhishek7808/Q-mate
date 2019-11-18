*** Settings ***
Resource          ${CURDIR}${/}Keywords${/}Department${/}Department.robot

*** Keywords ***
Verify Add Customer from Department
    #Go To    ${LOGIN URL}/SMM/Customer/PlantList
    Go To Customer List
    Apply Filter    4
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //td[contains(text(),'${Branch["Name"]},${Company["Company Name"]}')]
