*** Settings ***
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}InputFields.robot
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}ClearFields.robot
Resource          ${RESOURCES}${/}NewUiFormHelpers${/}ConfirmFields.robot

*** Keywords ***
Input Value Into Field
    [Documentation]  Takes json key and value to filled as argument, Gets field type from the key, calls for clear, input and confirm keywords for the given json key.
    [Arguments]  ${key}  ${value}=None
    ${fieldType}  Get Field Type  ${key}
    LOG MANY    ${key}
    Wait Until Keyword Succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  run keyword  ClearFields.Clear ${fieldType}  ${key["Locator"]}  ${value}
    Wait Until Keyword Succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  run keyword  InputFields.Input ${fieldType}  ${key["Locator"]}  ${value}
    #run keyword and ignore error  press keys  ${key["Locator"]}  TAB
    Wait Until Keyword Succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  run keyword  ConfirmFields.Confirm ${fieldType}  ${key["Locator"]}  ${value}
    #run keyword and ignore error  press keys  ${key["Locator"]}  TAB

Get Field Type
    [Documentation]  Takes json key as argument and returns field type.
    [Arguments]  ${Key}
    return from keyword  ${Key["Type"]}

