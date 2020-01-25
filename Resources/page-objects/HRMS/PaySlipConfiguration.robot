*** Settings ***
Documentation    Suite description

*** Keywords ***
Go To pay Slip Configuration Page
    Go To ERP Page  http://demoprojects.e-connectsolutions.com/ERP-DEMO/HRM/Common/PaySlipConfiguration

Configure Page/View Name
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Page/View Name"]["Selected Values"]}  ${formField["Page/View Name"]["Selected Values"]["Value"]}

Configure Show Other Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show Other Details"]["Show/Hide"]}  ${formField["Show Other Details"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Other Details"]["Selected Values"]}  ${formField["Show Other Details"]["Selected Values"]["Value"]}
