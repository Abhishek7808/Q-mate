*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}HRMS_Keywords.robot
Library           ${LIBRARY}${/}Addendums.py
Library           DateTime

*** Test Cases ***
Admin should able to add third party deduction
    [Documentation]  Fills third party deduction form.
    [Tags]  acc  thirdpartydeduction
    Common_Keywords.Set Test Data  ${configData["Third_Party_deduction"]}
    ACC_Keywords.Open Third Party Deduction Page
