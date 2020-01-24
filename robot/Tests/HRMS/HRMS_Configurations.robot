*** Settings ***
Resource    ../Configuration.resource
Resource    ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot

*** Variables ***
${configurationData}  ${DATA}/HRMS_DATA/ConfigurationData.json

*** Test Cases ***
User should be able to declare tea rate definition
    [Tags]  tearatedefinition
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    click element  modals-bootbox-custom
    ${formField}  Common_Keywords.Load Json File  ${configurationData}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rate"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}  ${formField["Effective Date"]["Value"]}
    sleep  2s