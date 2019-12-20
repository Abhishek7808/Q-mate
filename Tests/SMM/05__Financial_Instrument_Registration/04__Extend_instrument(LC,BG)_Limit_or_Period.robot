*** Settings ***
Test Teardown     Go To Base State
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot

*** Test Cases ***
#TODO: not working because date can not be changed
Check edit functionality when FI period extended for approved FI's
    [Documentation]    Extends FI Date for approved FI's
    [Tags]  periodextend  peroidextend1
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Set Test Variables    Company=Company Department 2    Branch=Branch Department 1    FI=FI 1
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    ${FI["BG/LC Number"]}
    Sleep    5s
    Click Element    //span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    #Click Element    //span[contains(text(),'${FI["BG/LC Number"]}')]/../following-sibling::td/i[@title='View']
    Sleep    3s
    Input Valid Value    Financial Instrument LC/BG Date    ${FI["BG/LC Date"]}
    #Input Valid Value    Financial Instrument BG/LC Amount  ${FI["BG/LC Amount"]}
    Input Valid Value    Financial Instrument Submit Button

#Check edit functionality when FI period extended for Rejected/Pending LC/BGs
#    [Tags]    Skip
#
#To check that only Sales account executive should be given right to extend validity/amount/cancel an instrument
#    [Tags]    Skip
