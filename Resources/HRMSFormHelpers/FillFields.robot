*** Settings ***
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}InputFields.robot
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}ClearFields.robot
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}ConfirmFields.robot

*** Keywords ***
Input Value Into Field
    [Arguments]  ${key}  ${value}=None
    ${fieldType}  Get Field Type  ${key}
    run keyword  ClearFields.Clear ${fieldType}  ${key["Locator"]}
    run keyword  InputFields.Input ${fieldType}  ${key["Locator"]}  ${value}
    run keyword unless  '${fieldType}' == 'Button'  press keys  ${key["Locator"]}  TAB
    run keyword  ConfirmFields.Confirm ${fieldType}  ${key["Locator"]}  ${value}

Get Field Type
    [Arguments]  ${Key}
    return from keyword  ${Key["Type"]}