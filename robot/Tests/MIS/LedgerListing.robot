*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    ../../Resources/MIS_Keywords.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
Ledger Listing Report
    [Documentation]   Ledger Listing Report Testing
    [Tags]  admin Ledger Listing MIS
    MIS_Keywords.Go to ERP
    MIS_Keywords.Open Ledger Listing Report
    MIS_Keywords.Verify Ledger Listing Report
