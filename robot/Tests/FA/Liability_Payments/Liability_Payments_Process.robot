*** Settings ***
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}${/}ERP_Keywords.robot
Resource          ${RESOURCES}${/}ACC_Keywords.robot
Library           ${LIBRARY}${/}Addendums.py
Library           DateTime

*** Variables ***
${EMPLOYEENAME}  (1097) - Qmate ${SPACE}56
${PAYGROUP}

*** Test Cases ***
Admin should able to add third party deduction
    [Documentation]  Fills third party deduction form.
    [Tags]  acc  liabilitypayments  thirdpartydeduction
    Common_Keywords.Set Test Data  ${configData["Third_Party_Deduction"]}
    ACC_Keywords.Open Third Party Deduction Page
    ACC_Keywords.Add New Third Party Deduction  ${dataDictionary}  ${EMPLOYEENAME}

Admin should able to disburse the salary of the selected employee.
    [Documentation]  Selects an employee and process his/her salary.
    [Tags]  acc  liabilitypayments  markattendance

