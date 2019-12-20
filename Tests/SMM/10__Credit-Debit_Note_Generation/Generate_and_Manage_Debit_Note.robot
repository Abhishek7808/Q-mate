*** Settings ***
Library           SeleniumLibrary
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Resource          ${RESOURCES}${/}Verify${/}Verify.robot


*** Test Cases ***
Check the process to Generate Debit Note
    [Documentation]    Generates debit note
    [Tags]    debitnote
    Switch To    Department
    Login From Department    archit.rsmml    admin
    Go To Differentials Adjustment
    Set Test Variables    Company=Company Customer 1    Branch=Branch Customer 2    SSO ID=SSOID 1    FI=FI 2    PO=PO 1    CRO=CRO 1  DN=DN 1
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Branch["Name"]}
    Input Valid Value    Debit Note Create Button
    Sleep    3s
    Input Valid Value    Debit Note Adjustment For    ${DN["Adjustment For"]}
    Input Valid value    Debit Note Adjustment Date    ${DN["Adjustment Date"]}
    Input Valid Value    Debit Note Customer Selection    ${Val}
    Input Valid Value    Debit Note Due Date    ${DN["Due Date"]}
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Debit Note Select CRO    PHOS/1920/194
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Debit Note Invoice List    IN-05/1819/23
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Debit Note Save Button
    Wait Until Keyword Succeeds    5s    200ms    Input Valid Value    Debit Note View List Button

#Check the process to Cancel Debit Note
#    [Tags]    Skip
#
#To check debit note generation in case of interest on delayed payment
#    [Tags]    Skip
#
#To check debit note generation in case of Royalty Difference
#    [Tags]    Skip
#
#To check when in case of Rate Difference (due to change of rate in back date) /Quantity difference
#    [Tags]    Skip
