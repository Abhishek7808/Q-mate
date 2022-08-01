*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    ../../Resources/MIS_Keywords.robot
Suite Teardown   Close All Browsers

*** Test Cases ***
Annexure Report
    [Documentation]   Annexure Report Testing
    [Tags]  admin Annexure MIS
    MIS_Keywords.LoginForAnnexure
    MIS_Keywords.Open Annexure Report
    MIS_Keywords.Verify Annexure Report