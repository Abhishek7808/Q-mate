*** Settings ***
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}InputFields.robot
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}ClearFields.robot
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}ConfirmFields.robot

*** Keywords ***
Input Value Into Field
    [Arguments]  ${key}  ${value}=None
    ${fieldType}  Get Field Type  ${key}
    Wait Until Keyword Succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  run keyword  ClearFields.Clear ${fieldType}  ${key["Locator"]}  ${value}
    Wait Until Keyword Succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  run keyword  InputFields.Input ${fieldType}  ${key["Locator"]}  ${value}
    #run keyword and ignore error  press keys  ${key["Locator"]}  TAB
    Wait Until Keyword Succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  run keyword  ConfirmFields.Confirm ${fieldType}  ${key["Locator"]}  ${value}
    #run keyword and ignore error  press keys  ${key["Locator"]}  TAB

Get Field Type
    [Arguments]  ${Key}
    return from keyword  ${Key["Type"]}

