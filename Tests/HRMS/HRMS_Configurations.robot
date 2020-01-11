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
    #click element  modals-bootbox-custom
    ${configData}  Common_Keywords.Load Json File  ${configurationData}
    set test variable  ${formField}  ${configData["Tea Rate Definition"]}
    FillFields.Input Value Into Field  ${formField["Declare"]}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rate"]}  ${formField["Rate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Tea Rate Entry  ${formField}
    page should contain element  //td[contains(text(),"1 ")]/following-sibling::td[contains(text(),'05-Nov-2018')]/following-sibling::td[contains(text(),'Tea Rate')]/following-sibling::td[contains(text(),'100')]
    sleep  2s


