*** Settings ***
Resource  ${PAGE OBJECTS}/ACC/ThirdPartyDeduction.robot
Resource  ${PAGE OBJECTS}/ACC/LiabilityPayments.robot

*** Keywords ***
Open Third Party Deduction Page
    [Documentation]  Opens third party deduction page.
    ThirdPartyDeduction.Go To Third Party Deduction Page

Add New Third Party Deduction
    [Documentation]  Fills details into third party deduction form.
    [Arguments]  ${dataDictionary}  ${employeeCode}
    ThirdPartyDeduction.Click On ADD New Entry Button
    ThirdPartyDeduction.Select Employee  ${dataDictionary}  ${employeeCode}
    ThirdPartyDeduction.Fill Third Party Deduction  ${dataDictionary}
    ThirdPartyDeduction.Save Details

Open Liability Payments Page
    [Documentation]  Opens laibility payments page.
    LiabilityPayments.Go To Liability Payments Page

Add Liability Payment
    [Documentation]  Fills details in liablity payments form.
    [Arguments]  ${dataDictionary}  ${EMPLOYEECODE}
    LiabilityPayments.Click On Add New Button
    LiabilityPayments.Fill Liability Form Details  ${dataDictionary}
    LiabilityPayments.Fetch Employee  ${EMPLOYEECODE}
    LiabilityPayments.Save Details

Set Liability Payments Filters
    [Documentation]  Opens liablity payments filters and select filters.
    [Arguments]  ${dataDictionary}  ${status}
    LiabilityPayments.Open Filters
    LiabilityPayments.Select Filters  ${dataDictionary}  ${status}
    LiabilityPayments.Apply Filters

Edit Draft Entry
    [Documentation]  Edits draft liability payment entry.
    LiabilityPayments.Click On Edit Button
    LiabilityPayments.Click On Update Button

Delete Draft Entry
    [Documentation]  Delets draft liability payment entry.
    LiabilityPayments.Click On Delete Button

Generate Payment
    [Documentation]  Generates payment for liability payment entry.
    [Arguments]  ${EMPLOYEECODE}
    LiabilityPayments.Click On Generate Payment Button
    Switch window  New
    LiabilityPayments.Select Ledger
    LiabilityPayments.Verify Employee Is Listed  ${EMPLOYEECODE}
    LiabilityPayments.Click On Generate Payment

