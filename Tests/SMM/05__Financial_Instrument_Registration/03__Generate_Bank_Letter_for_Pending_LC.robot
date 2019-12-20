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
Filter and View LC for pending payment, and print Bank letter
    [Documentation]    Generate bank letter/print the letter
    [Tags]  bankletter  bankletter1
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Set Test Variables    Company=Company Customer 2    Branch=Branch Customer 1    FI=FI 1
    Go To Financial Instrument List From Department
    Input Valid Value    Search Financial Instrument By Number    ${FI["BG/LC Number"]}
    Sleep    2s
    Wait Until Keyword Succeeds    5s    500ms    Click Element    //span[contains(text(),'Approved')]/../../following-sibling::td/i[@title='View']
    #View Company Details
    #Not Working
    Input Valid Value    Financial Instrument Print Button
    Sleep    5s

#To check that the Notification should be sent 5 days before the due payment date of all Financial Instruments for credit payment
#    [Tags]    Skip
#
#To check that on electing the instrument, its related invoice Bank Letter for receiving the payment against LC should be generated and printed through the system
#    [Tags]    Skip
