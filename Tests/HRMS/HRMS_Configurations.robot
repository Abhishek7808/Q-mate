*** Settings ***
Resource    ../Configuration.resource
Resource    ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
#Library           SeleniumLibrary  plugins=${PLUGINS}/ERP.py
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot

*** Variables ***
${configurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json

*** Test Cases ***
User should be able to declare tea rate definition
    [Tags]  tearatedefinition
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    click element  modals-bootbox-custom
    ${configData}  Common_Keywords.Load Json File  ${configurationData}
    set test variable  ${formField}  ${configData["Tea Rate Definition"]}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rate"]}  ${formField["Rate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    sleep  3s
