*** Settings ***
Resource          ${RESOURCES}${/}HRMFormHelpers${/}InputField.robot
Resource          ${RESOURCES}${/}HRMFormHelpers${/}ClearField.robot
Resource          ${RESOURCES}${/}HRMFormHelpers${/}ConfirmField.robot

*** Keywords ***
Input Value Into Field
    [Arguments]  ${key}  ${value}
    ${fieldType}  Get Field Type  ${key}
    ClearFields.Clear ${fieldType}  ${value}
    InputFields.Input ${fieldType}  ${value}
    ConfirmFields.Confirm ${fieldType}  ${value}

Get Field Type
    [Arguments]  ${Key}
    return from keyword  ${configuration["${key}"]["Type"]}