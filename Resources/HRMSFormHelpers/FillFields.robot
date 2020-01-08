*** Settings ***
Documentation    Suite description


*** Keywords ***
Input Value Into Field
    [Arguments]  ${key}  ${value}
    ${fieldType}  Get Field Type  ${key}
    ClearField.Clear ${fieldType}
    InputField.Input ${fieldType}
    ConfirmField.Confirm ${fieldType}

Get Field Type
    [Arguments]  ${Key}
    return from keyword  ${configuration["${key}"]["Type"]}