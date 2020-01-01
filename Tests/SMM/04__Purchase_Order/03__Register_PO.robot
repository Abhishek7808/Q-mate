*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}/Common_Keywords.robot
Test Teardown     Go To Base State
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary
Resource          ${RESOURCES}${/}Delete_Data.robot
Resource          ${RESOURCES}${/}SMM_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}BrowserControl.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}FormHelpers${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

*** Test Cases ***
Register PO for auctionable product
    [Documentation]    Regiters PO for an auctionable product having BID number and product price
    [Tags]  SMM  purchaseorder  registerpo  auctionableproduct
    BrowserControl.Switch To    Department
    Common_Keywords.Login From Department    archit.rsmml    admin
    SMM_Keywords.Open Purchase Order List By Department
    Common_Keywords.Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 2    PO=PO 3    SSO ID=SSOID 2
    SMM_KeywordsRegister Purchase Order From Department
    Sleep    2s

#Check edit functionality for general product, when PO registered by Marketing Head
#    [Tags]  SMM  purchaseorder    Skip
#
#Check edit functionality for auctionable product, when PO registered by Marketing Head
#    [Tags]  SMM  purchaseorder    Skip
