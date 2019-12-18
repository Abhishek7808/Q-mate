*** Settings ***
Test Teardown     Go To Base State
Resource          ../../../Configuration.resource
Resource          ${RESOURCES}${/}browser.robot
Resource          ${RESOURCES}${/}Department${/}Department.robot
Resource          ${RESOURCES}${/}Customer${/}Customer.robot
Resource          ${RESOURCES}${/}Fields${/}Field.robot
Library           SeleniumLibrary

Suite Setup       Start Testing
Suite Teardown    Finish Testing


*** Test Cases ***
To check the process when department user as proxy add agent from menu
    [Documentation]    Adds an agent (transporter) to a company by department
    [Tags]   Addagentasproxy  Addagentasproxy1
    Switch To    Department
    Set Test Variables    Company=Company Department 1    Branch=Branch Department 5    SSO ID=SSOID 2
    Go To Add Purchase Order From Department
    #Fill To Add Agent
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Branch["Name"]} (${Company["Enter PAN"]})
    Input Valid Value    Purchase Order Enter Customer PAN or Name    ${Val}
    #Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Add Agent Button
    #Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Add Agent SSO ID    ${SSO ID["SSOID"]}
    #Input Valid Value    Add Agent Validity Date    ${SSO ID["Validity Date"]}
    #Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Add Agent Save Button
    #Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Agent    ${SSO ID["Name"]}
    Click Button    btnAddAgentPo
    Fill Agent By Department
    sleep  3s
    input text  react-select-2-input  ${SSO ID["Name"]}
    Press Key    react-select-2-input    \\13
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Submit Button

To check the process when department user add agent from PO form
    [Documentation]    Adds an agent from PO form
    [Tags]   Addagentasproxy  Addagentasproxy2
    Switch To    Department
    Set Test Variables    Company=Company Department 1    Branch=Branch Department 3    SSO ID=SSOID 2
    Go To Add Purchase Order From Department
    #Fill To Add Agent
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Branch["Name"]} (${Company["Enter PAN"]})
    Input Valid Value    Purchase Order Enter Customer PAN or Name    ${Val}
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Add Agent Button
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Add Agent SSO ID    ${SSO ID["SSOID"]}
    Input Valid Value    Add Agent Validity Date    ${SSO ID["Validity Date"]}
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Add Agent Save Button
    ${message}  Handle Alert
    run keyword if  '${message}' == 'Agent Plant Relation is already exists'  click button  btnCancelModel
    sleep  4s
    # Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Agent    ${SSO ID["Name"]}
    Wait Until Keyword Succeeds    5s    500ms    Input Valid Value    Purchase Order Submit Button

#To check the process when DU change Agent Details by selecting PO
#    [Tags]    Skip
#
#To check the process when department user change the agent details from menu
#    [Tags]    Skip
