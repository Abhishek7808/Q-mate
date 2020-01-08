*** Settings ***
Resource          ${RESOURCES}${/}HRMFormHelpers${/}InputField.robot
Resource          ${RESOURCES}${/}HRMFormHelpers${/}ClearField.robot
Resource          ${RESOURCES}${/}HRMFormHelpers${/}ConfirmField.robot

*** Keywords ***
Input Value Into Field
    [Arguments]  ${key}  ${value}
    ${fieldType}  Get Field Type  ${key}
    ClearFields.Clear ${fieldType}  ${key["Locator"]}  ${value}
    InputFields.Input ${fieldType}  ${key["Locator"]}  ${value}
    ConfirmFields.Confirm ${fieldType}  ${key["Locator"]}  ${value}

Get Field Type
    [Arguments]  ${Key}
    return from keyword  ${Key["Type"]}