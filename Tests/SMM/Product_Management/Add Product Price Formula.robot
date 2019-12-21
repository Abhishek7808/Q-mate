*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           RequestsLibrary
Resource          ../../../Configuration.resource
Library   SeleniumLibrary  plugins=${PLUGINS}${/}ERP.py
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Department${/}Company.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot


*** Test Cases ***
Check the process to Add Product price formula
    [Tags]    addproduct
#    Set Test Variable    ${Key Description}    ${Department Key Description}
#    Set Test Variable    ${Schedule}    ${testData["Schedule On"]}
#    Switch Browser    Department
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables  PD=PD 1  SC=SC 1
    Go To Add Product From Department
    sleep  1s
    click button  btnAddProduct
    sleep  1s
    Fill Product By Department
    Go To Schedule In Product Management From Department
    click button  addNewSchedule
    Fill Schedule By Department

#    #Sleep    5s
#    Schedule On
#    Sleep    5s
#    Product Structure
#    Sleep    5s
#    Click Button    btnSaveUpdate
#    [Teardown]    Close All Browsers

To check that user can create a new formula using fields
    [Tags]    checkformula
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    #Set Test Variable    ${Key Description}    ${Department Key Description}
    Common_Keywords.Set Test Variables    SC=SC 2  PD=PD 1
    Go To    http://demoprojects.e-connectsolutions.com/ERP-DEMO/SMM/Product/AddEditProduct
    Fill Product By Department
    sleep  5s
    Click Element    xpath=//span[contains(text(),'Schedules')]
    Sleep    3s
    Click Button    btnAddNew
    sleep  3s
    Sleep    3s
    Edit Schedule By Department
    [Teardown]    Close All Browsers
