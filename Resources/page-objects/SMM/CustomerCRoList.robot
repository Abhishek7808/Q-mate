*** Settings ***

*** Test Cases ***


*** Keywords ***
Open CRO List By Customer
    Wait Until Keyword Succeeds    5s    200ms    Click Link    \#CustomerServices
    Wait Until Keyword Succeeds    5s    200ms    Click Link    /ERP-DEMO/RSMML/ContractReleaseOrder

Request CRO
    Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[contains(text(),'Request CRO')]