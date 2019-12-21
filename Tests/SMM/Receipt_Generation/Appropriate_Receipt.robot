*** Settings ***
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Department${/}Company.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot



*** Test Cases ***
To check the process Appropriate Receipt
    [Documentation]    Fills receipt form and generates new receipt
    [Tags]    receipt
    BrowserControl.Switch To    Department
    Login From Department    archit.rsmml    admin
    Common_Keywords.Set Test Variables    Company=Company Department 1    Branch=Branch Department 1    Receipt=Receipt 1
    Go To Receipt Generation
    Input Valid Value    Generate Receipt Create New Button
    Sleep    5s
    Generate Receipt By Department
    Sleep    2s
    #Input Valid Value    Receipt Add Button
    #Input Valid Value    Generate Receipt Submit Button
    Sleep    3s
    View Company Details
    sleep  2s
    click button  btnactionApprove
    sleep  2s
    #Click Button    View List
    Sleep    3s
    click element    //span[contains(text(),'${Branch["Name"]}')]/../following-sibling::td//i[@title='Approve']
    Sleep    3s
