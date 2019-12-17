*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

Suite Setup       Start Testing
Suite Teardown    Finish Testing


*** Test Cases ***
Register PO for auctionable product
    [Documentation]    Regiters PO for an auctionable product having BID number and product price
    [Tags]  registerpo
    Switch To    Department
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    PO=PO 3    SSO ID=SSOID 2
    Go To Add Purchase Order From Department
    Fill PO By Department
    Sleep    2s

#Check edit functionality for general product, when PO registered by Marketing Head
#    [Tags]    Skip
#
#Check edit functionality for auctionable product, when PO registered by Marketing Head
#    [Tags]    Skip
