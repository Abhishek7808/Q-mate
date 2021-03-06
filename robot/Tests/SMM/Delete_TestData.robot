*** Settings ***
Resource          ../../Configuration.resource
Resource          ${RESOURCES}${/}Delete_Data.robot
Library           RequestsLibrary
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           Collections

*** Variables ***
${COMPANYPAN}  None
${SSOIDNAME}   None

*** Test Cases ***

Delete the data of all companies
    [Documentation]    Deletes the data of company and SSO ID
    [Tags]  SMM  delete
    [Template]  Delete All The Prewritten Data Of Company From ERP
    QMATE1234D
    QMATE1234C
    QMATE6665Q
    QMATE5555T

Delete the data of all ssoids
    [Tags]  SMM  delete
    [Template]  Delete All The Prewritten Data Of SSOID From ERP
    archit010
    chauhan.yuvi
    shahshubham
    1860
    1862
    1863

Delete Data Of Given SSOID Or Company
    [Tags]  SMM  deletegiven
    run keyword if  '${COMPANYPAN}' != 'None'  Delete_Data.Delete All The Prewritten Data Of Company From ERP  ${COMPANYPAN}
    run keyword if  '${SSOIDNAME}' != 'None'  Delete_Data.Delete All The Prewritten Data Of SSOID From ERP  ${SSOIDNAME}