*** Settings ***
Documentation    Turn off and on payslip features. For more info visit http://support.e-connectsolutions.com/erp/how-to/payslip-configuration/

*** Variables ***
${pageUrl}  HRM/Common/PaySlipConfiguration


*** Keywords ***
Go To pay Slip Configuration Page
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Configure Page/View Name
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Page/View Name"]["Selected Values"]}  ${dataDictionary["Page/View Name"]["Selected Values"]["Value"]}

Configure Show Other Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Other Details"]["Show/Hide"]}  ${dataDictionary["Show Other Details"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Show Other Details"]["Selected Values"]}  ${dataDictionary["Show Other Details"]["Selected Values"]["Value"]}

Configure Show Net Payable In Words
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Net Payable In Words"]["Show/Hide"]}  ${dataDictionary["Show Net Payable In Words"]["Show/Hide"]["Value"]}

Configure Show DDO Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show DDO Details"]["Show/Hide"]}  ${dataDictionary["Show DDO Details"]["Show/Hide"]["Value"]}

Configure Show Birthday Message
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Birthday Message"]["Show/Hide"]}  ${dataDictionary["Show Birthday Message"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Show Birthday Message"]["Selected Values"]}  ${dataDictionary["Show Birthday Message"]["Selected Values"]["Value"]}

Configure Show PF Balance
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show PF Balance"]["Show/Hide"]}  ${dataDictionary["Show PF Balance"]["Show/Hide"]["Value"]}

Configure Show Net Payable Rounded Off
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Net Payable Rounded Off"]["Show/Hide"]}  ${dataDictionary["Show Net Payable Rounded Off"]["Show/Hide"]["Value"]}

Configure Show Gross Salary with Employer Contribution
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Gross Salary with Employer Contribution"]["Show/Hide"]}  ${dataDictionary["Show Gross Salary with Employer Contribution"]["Show/Hide"]["Value"]}

Configure Show Loan Details
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Loan Details"]["Show/Hide"]}  ${dataDictionary["Show Loan Details"]["Show/Hide"]["Value"]}

Configure Show Leave Balances
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Leave Balances"]["Show/Hide"]}  ${dataDictionary["Show Leave Balances"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Show Leave Balances"]["Selected Values"]}  ${dataDictionary["Show Leave Balances"]["Selected Values"]["Value"]}

Configure Show LWP Days
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show LWP Days"]["Show/Hide"]}  ${dataDictionary["Show LWP Days"]["Show/Hide"]["Value"]}

Configure Language
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Language"]["Show/Hide"]}  ${dataDictionary["Language"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Language"]["Selected Values"]}  ${dataDictionary["Language"]["Selected Values"]["Value"]}

Configure Show Salary Annexure
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Salary Annexure"]["Show/Hide"]}  ${dataDictionary["Show Salary Annexure"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Show Salary Annexure"]["Selected Values"]}  ${dataDictionary["Show Salary Annexure"]["Selected Values"]["Value"]}

Save Configurations
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

