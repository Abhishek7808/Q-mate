*** Settings ***
Resource          ../Configuration.resource
Resource          ${RESOURCES}${/}SMM_Keywords.robot
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
    [Tags]  delete
    [Template]  Delete All The Prewritten Data Of Company From ERP
    QMATE1234D
    QMATE1234C
    QMATE6665Q
    QMATE5555T

Delete the data of all ssoids
    [Tags]  delete
    [Template]  Delete All The Prewritten Data Of SSOID From ERP
    archit010
    chauhan.yuvi
    shahshubham
    1860
    1862
    1863

Delete Data Of Given SSOID Or Company
    [Tags]  deletegiven
    run keyword if  '${COMPANYPAN}' != 'None'  SMM_Keywords.Delete Data Of Company  ${COMPANYPAN}
    run keyword if  '${SSOIDNAME}' != 'None'  SMM_Keywords.Delete Data Of SSOID  ${SSOIDNAME}