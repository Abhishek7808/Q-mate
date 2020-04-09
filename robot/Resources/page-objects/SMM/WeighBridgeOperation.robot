*** Settings ***
Documentation    Suite description

*** Variables ***
${pageUrl}  SMM/WeighBridge/WeighBridgeOperation

*** Keywords ***
Go To Weighbridge Operations Page
    [Documentation]  Opens weighbridge operations page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Fill Inward Slip
    [Documentation]  Fills details in inward slip form.
    [Arguments]  ${croNumber}
    input text  searchByCRO  ${croNumber}${SPACE}
    Sleep    4s
    click element   //span[contains(text(),'${croNumber}')]/../following-sibling::td//button
    #Input Valid Value    Generate In Slip
    Sleep    2s
    Input Valid Value    Enter Vehicle Number    ${Dispatch["Enter Vehicle Number"]}
    Input Valid Value    Select Vehicle Type    ${Dispatch["Select Vehicle Type"]}
    Input Valid Value    Tare Weight    ${Dispatch["Tare Weight"]}
    Input Valid Value    Max Capacity    ${Dispatch["Max Capacity"]}
    Input Valid Value    Driver Name    ${Dispatch["Driver Name"]}
    Input Valid Value    Driver Mobile    ${Dispatch["Driver Mobile"]}
    Input Valid Value    In Weight    ${Dispatch["In Weight"]}
    Input Valid Value    Max Product Capacity    ${CRO["Product Quantity Required"]}
    Input Valid Value    Lease Id    ${Dispatch["Lease Id"]}
    Input Valid Value    Select Stock Location    ${Dispatch["Select Stock Location"]}
    Input Valid Value    Generate In Slip Button

Fill Outward Slip
    [Documentation]  Fills details in outward slip form.
    [Arguments]  ${croNumber}
    Input Valid Value    Tab In Vehicle
    Sleep    1s
    Input Text Value    ${Key Description["Search In Vehicle"]["Locator"]}    ${croNumber}${SPACE}
    Set To Dictionary    ${Key Description["Generate Out Slip"]}    Locator=//SPAN[contains(text(),'${Dispatch["Enter Vehicle Number"]}')]/../following-sibling::td/button
    Sleep    4s
    Input Valid Value    Generate Out Slip
    Sleep    2s
    Input Valid Value    Gross Weight    ${Dispatch["Gross Weight"]}
    Input Valid Value    Generate Out Slip Button