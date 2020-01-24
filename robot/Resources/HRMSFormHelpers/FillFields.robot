*** Settings ***
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}InputFields.robot
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}ClearFields.robot
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}ConfirmFields.robot

*** Keywords ***
Input Value Into Field
    [Arguments]  ${key}  ${value}
    ${fieldType}  Get Field Type  ${key}
    ClearFields.Clear ${fieldType}  ${key["Locator"]}  ${value}
    InputFields.Input ${fieldType}  ${key["Locator"]}  ${value}
    ConfirmFields.Confirm ${fieldType}  ${key["Locator"]}  ${value}
    press key  ${key["Locator"]}  TAB

Get Field Type
    [Arguments]  ${Key}
    return from keyword  ${Key["Type"]}