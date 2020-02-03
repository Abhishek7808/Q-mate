*** Settings ***
Documentation    Suite description


*** Keywords ***
Go To Self Verification Configuration Page
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/EMPSELFVERIFICATION/SelfVerificationConfiguration

Configure Self Varication Popup
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Raise Self Verification Popup"]}  ${dataDictionary["Raise Self Verification Popup"]["Value"]}

Configure Self Varication Mandatory
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Is Self Verification Mandatory"]}  ${dataDictionary["Is Self Verification Mandatory"]["Value"]}

Configure Send SMS Notification
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Send SMS Notification"]}  ${dataDictionary["Send SMS Notification"]["Value"]}

Configure Send Email Notification
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Send Email Notification"]}  ${dataDictionary["Send Email Notification"]["Value"]}

Configure Self Verification of Enrollment Detail
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Enable Self Verification of Enrollment Detail"]}  ${dataDictionary["Enable Self Verification of Enrollment Detail"]["Value"]}

Configure Self Verification of Personal Detail
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Enable Self Verification of Personal Detail"]}  ${dataDictionary["Enable Self Verification of Personal Detail"]["Value"]}

Configure Self Verification of Official Detail
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Enable Self Verification of Official Detail"]}  ${dataDictionary["Enable Self Verification of Official Detail"]["Value"]}

Configure Self Verification of Salary Detail
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Enable Self Verification of Salary Detail"]}  ${dataDictionary["Enable Self Verification of Salary Detail"]["Value"]}

Configure Self Verification of Other Detail
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Enable Self Verification of Other Detail"]}  ${dataDictionary["Enable Self Verification of Other Detail"]["Value"]}

Configure Self Verification of Nominee Detail
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Enable Self Verification of Nominee Detail"]}  ${dataDictionary["Enable Self Verification of Nominee Detail"]["Value"]}

Click On Save Button
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}
