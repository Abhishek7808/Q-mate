*** Settings ***
Resource          ${RESOURCES}${/}HRMConfigFormHelpers${/}InputField.robot
Resource          ${RESOURCES}${/}HRMConfigFormHelpers${/}ClearField.robot
Resource          ${RESOURCES}${/}HRMConfigFormHelpers${/}ConfirmField.robot

*** Keywords ***
Input Value Into Field
    [Arguments]  ${key}  ${value}
    ${fieldType}  Get Field Type