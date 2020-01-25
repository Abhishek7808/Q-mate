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

Configure Show Net Payable In Words
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show Net Payable In Words"]["Show/Hide"]}  ${formField["Show Net Payable In Words"]["Show/Hide"]["Value"]}

Configure Show DDO Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show DDO Details"]["Show/Hide"]}  ${formField["Show DDO Details"]["Show/Hide"]["Value"]}

Configure Show Birthday Message
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show Birthday Message"]["Show/Hide"]}  ${formField["Show Birthday Message"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Birthday Message"]["Selected Values"]}  ${formField["Show Birthday Message"]["Selected Values"]["Value"]}

Configure Show PF Balance
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show PF Balance"]["Show/Hide"]}  ${formField["Show PF Balance"]["Show/Hide"]["Value"]}

Configure Show Net Payable Rounded Off
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show Net Payable Rounded Off"]["Show/Hide"]}  ${formField["Show Net Payable Rounded Off"]["Show/Hide"]["Value"]}

Configure Show Gross Salary with Employer Contribution
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show Gross Salary with Employer Contribution"]["Show/Hide"]}  ${formField["Show Gross Salary with Employer Contribution"]["Show/Hide"]["Value"]}

Configure Show Loan Details
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show Loan Details"]["Show/Hide"]}  ${formField["Show Loan Details"]["Show/Hide"]["Value"]}

Configure Show Leave Balances
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show Leave Balances"]["Show/Hide"]}  ${formField["Show Leave Balances"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Leave Balances"]["Selected Values"]}  ${formField["Show Leave Balances"]["Selected Values"]["Value"]}

Configure Show LWP Days
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show LWP Days"]["Show/Hide"]}  ${formField["Show LWP Days"]["Show/Hide"]["Value"]}

Configure Language
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Language"]["Show/Hide"]}  ${formField["Language"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Language"]["Selected Values"]}  ${formField["Language"]["Selected Values"]["Value"]}

Configure Show Salary Annexure
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Show Salary Annexure"]["Show/Hide"]}  ${formField["Show Salary Annexure"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${formField["Show Salary Annexure"]["Selected Values"]}  ${formField["Show Salary Annexure"]["Selected Values"]["Value"]}

Save Configurations
    [Arguments]  ${formField}
    FillFields.Input Value Into Field  ${formField["Save"]}