*** Settings ***
Resource          ../../Configuration.resource
Resource          ${RESOURCES}${/}HRMSFormHelpers${/}FillFields.robot
Resource          ${RESOURCES}${/}Common_Keywords.robot
Resource          ${RESOURCES}/ERP_Keywords.robot
Resource          ${RESOURCES}/HRMS_Keywords.robot

*** Variables ***
${HRMSconfigurations}  ${DATA}/HRMS_DATA/ConfigurationData.json

*** Test Cases ***
User should be able to declare tea rate definition
    [Tags]  tearatedefinition  createdata
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    set test variable  ${formField}  ${configData["Tea Rate Definition"]}
    FillFields.Input Value Into Field  ${formField["Declare"]}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rate"]}  ${formField["Rate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Tea Rate Entry  ${formField}

User should be able to edit tea rate definition
    [Tags]  tearatedefinition  edit
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    set test variable  ${formField}  ${configData["Tea Rate Definition Edit"]}
    FillFields.Input Value Into Field  ${formField["Edit Button"]}
    FillFields.Input Value Into Field  ${formField["Effective Date"]}  ${formField["Effective Date"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Type"]}  ${formField["Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Rate"]}  ${formField["Rate"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Tea Rate Entry  ${formField}

User should be able to delete tea rate definition
    [Tags]  tearatedefinition  delete
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Reimbursement/EntertainmentDeclareIndex
    set test variable  ${formField}  ${configData["Tea Rate Definition"]}
    FillFields.Input Value Into Field  ${formField["Delete"]}
    page should contain  Do you really want to delete selected record(s) ?
    FillFields.Input Value Into Field  ${formField["Ok"]}
    reload page
    HRMS_Keywords.Verify Tea Rate Deletion  ${formField}

User should be able to add new enquiry decision type
    [Tags]  enquirydecisiontype
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EnquiryDecision
    set test variable  ${formField}  ${configData["Enquiry Decision Type"]}
    FillFields.Input Value Into Field  ${formField["Add New"]}
    FillFields.Input Value Into Field  ${formField["Decision Name"]}  ${formField["Decision Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Enquiry Type"]}  ${formField["Enquiry Type"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Impact On"]}  ${formField["Impact On"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    sleep  5s

User should be abele to create post class
    [Tags]  postclass  create
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PostConfig/PostClassIndex
    set test variable  ${formField}  ${configData["Post Class"]}
    FillFields.Input Value Into Field  ${formField["Add New Post Class"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Class Group"]}  ${formField["Class Group"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Seniority Level"]}  ${formField["Seniority Level"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Post Class Creation  ${formField}
    sleep  5s

User should be able to update post class
    [Tags]  postclass  update
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PostConfig/PostClassIndex
    set test variable  ${formField}  ${configData["Post Class Update"]}
    FillFields.Input Value Into Field  ${formField["Update"]}
    FillFields.Input Value Into Field  ${formField["Name"]}  ${formField["Name"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Class Group"]}  ${formField["Class Group"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Seniority Level"]}  ${formField["Seniority Level"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Save"]}
    HRMS_Keywords.Verify Post Class Creation  ${formField}

User should be able to delete post class
    [Tags]  postclass  delete
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/PostConfig/PostClassIndex
    set test variable  ${formField}  ${configData["Post Class"]}
    FillFields.Input Value Into Field  ${formField["Delete Post Class"]}
    sleep  2s
    FillFields.Input Value Into Field  ${formField["Ok"]}
    HRMS_Keywords.Verify Post Class deletion  ${formField}
    sleep  5s


