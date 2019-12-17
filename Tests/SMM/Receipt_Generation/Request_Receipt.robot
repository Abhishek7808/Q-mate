*** Settings ***
Resource          ${ROOT DIR}${/}Keywords${/}browser.robot
Resource          ${ROOT DIR}${/}Keywords${/}Fields${/}Field.robot
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections
Library           SeleniumLibrary

*** Test Cases ***
To check the process request receipt
    [Tags]    Skip
