*** Settings ***
Resource          ${RESOURCES}${/}Department${/}Department.robot

*** Keywords ***
Verify Add Customer from Department
    #Go To    ${LOGIN URL}/SMM/Customer/PlantList
    Go To Customer List
    Apply Filter    4
    input text  //input[@id='uncontrolled']  ${Branch["Name"]}
    Wait Until Keyword Succeeds    5s    250ms    Page Should Contain Element    //span[contains(text(),'${Branch["Name"]}')]
