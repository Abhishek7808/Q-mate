*** Settings ***
Documentation    Turn off and on payslip features. For more info visit http://support.e-connectsolutions.com/erp/how-to/payslip-configuration/

*** Keywords ***
Go To pay Slip Configuration Page
    [Documentation]  Opens pay slip configurations page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Configure Page/View Name
    [Documentation]  Configures option for Page/View Name.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Page/View Name"]["Selected Values"]}  ${dataDictionary["Page/View Name"]["Selected Values"]["Value"]}

Configure Show Other Details
    [Documentation]  Configures option for Show Other Details.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Other Details"]["Show/Hide"]}  ${dataDictionary["Show Other Details"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Show Other Details"]["Selected Values"]}  ${dataDictionary["Show Other Details"]["Selected Values"]["Value"]}

Configure Show Net Payable In Words
    [Documentation]  Configures option for Show Net Payable In Words.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Net Payable In Words"]["Show/Hide"]}  ${dataDictionary["Show Net Payable In Words"]["Show/Hide"]["Value"]}

Configure Show DDO Details
    [Documentation]  Configures option for Show DDO Details.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show DDO Details"]["Show/Hide"]}  ${dataDictionary["Show DDO Details"]["Show/Hide"]["Value"]}

Configure Show Birthday Message
    [Documentation]  Configures option for Show Birthday Message.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Birthday Message"]["Show/Hide"]}  ${dataDictionary["Show Birthday Message"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Show Birthday Message"]["Selected Values"]}  ${dataDictionary["Show Birthday Message"]["Selected Values"]["Value"]}

Configure Show PF Balance
    [Documentation]  Configures option for Show PF Balance.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show PF Balance"]["Show/Hide"]}  ${dataDictionary["Show PF Balance"]["Show/Hide"]["Value"]}

Configure Show Net Payable Rounded Off
    [Documentation]  Configures option for Show Net Payable Rounded Off.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Net Payable Rounded Off"]["Show/Hide"]}  ${dataDictionary["Show Net Payable Rounded Off"]["Show/Hide"]["Value"]}

Configure Show Gross Salary with Employer Contribution
    [Documentation]  Configures option for Show Gross Salary with Employer Contribution.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Gross Salary with Employer Contribution"]["Show/Hide"]}  ${dataDictionary["Show Gross Salary with Employer Contribution"]["Show/Hide"]["Value"]}

Configure Show Loan Details
    [Documentation]  Configures option for Show Loan Details.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Loan Details"]["Show/Hide"]}  ${dataDictionary["Show Loan Details"]["Show/Hide"]["Value"]}

Configure Show Leave Balances
    [Documentation]  Configures option for Show Leave Balances.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Leave Balances"]["Show/Hide"]}  ${dataDictionary["Show Leave Balances"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Show Leave Balances"]["Selected Values"]}  ${dataDictionary["Show Leave Balances"]["Selected Values"]["Value"]}

Configure Show LWP Days
    [Documentation]  Configures option for Show LWP Days.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show LWP Days"]["Show/Hide"]}  ${dataDictionary["Show LWP Days"]["Show/Hide"]["Value"]}

Configure Language
    [Documentation]  Configures option for Language.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Language"]["Show/Hide"]}  ${dataDictionary["Language"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Language"]["Selected Values"]}  ${dataDictionary["Language"]["Selected Values"]["Value"]}

Configure Show Salary Annexure
    [Documentation]  Configures option for Show Salary Annexure.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Show Salary Annexure"]["Show/Hide"]}  ${dataDictionary["Show Salary Annexure"]["Show/Hide"]["Value"]}
    FillFields.Input Value Into Field  ${dataDictionary["Show Salary Annexure"]["Selected Values"]}  ${dataDictionary["Show Salary Annexure"]["Selected Values"]["Value"]}

Save Configurations
    [Documentation]  Clicks on save button.
    [Arguments]  ${dataDictionary}
    FillFields.Input Value Into Field  ${dataDictionary["Save"]}

