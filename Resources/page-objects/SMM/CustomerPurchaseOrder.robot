*** Settings ***


*** Test Cases ***


*** Keywords ***
Request Purchase Order
     Wait Until Keyword Succeeds    5s    200ms    Click Element    //span[(text()='Request PO')]