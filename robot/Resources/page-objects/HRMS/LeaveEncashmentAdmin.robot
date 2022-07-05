*** Keywords ***
Go To Leave Encashment Page
    [Documentation]  Opens leave encashment page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Leave Encashment
    [Documentation]  Clicks on add leave encashment button.
    click element  //a[@id='modals-bootbox-custom']

Fill Leave Encashment Details
    [Documentation]  Fills details into leave encashment form.
    [Arguments]  ${dataDictionary}  ${EMPLOYEENAME}
    #FOR  ${i}   IN RANGE    5
    #FillFields.Input Value Into Field  ${dataDictionary["Employee_Name"]}  ${EMPLOYEENAME}
    #Sleep   5S
    #${Leave_Bal}    Get Value   ${dataDictionary["Leave_Balance"]["Locator"]}
    #Exit For Loop If    ${Leave_Bal} >0
    #END
    FillFields.Input Value Into Field  ${dataDictionary["Employee_Name"]}  ${EMPLOYEENAME}
    Sleep   15S
    press keys  ${dataDictionary["Employee_Name"]["Locator"]}  ARROW_DOWN
    press keys  ${dataDictionary["Employee_Name"]["Locator"]}  ENTER
    FillFields.Input Value Into Field  ${dataDictionary["Leave_Type"]}  ${dataDictionary["Leave_Type"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Leave_Days"]}  ${dataDictionary["Leave_Days"]["Value"]}

Submit Details
    [Documentation]  Clicks on submit button.
    click element  //input[@id='btnSave']
    capture page screenshot

Verify Leave Encashment Entry In Table
    [Documentation]  Takes employee name as argument and checks that it is listed on the current page.
    [Arguments]  ${EMPLOYEENAME}
    input text
    page should contain  ${EMPLOYEENAME}