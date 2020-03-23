*** Settings ***
Resource  ${PAGE OBJECTS}/ACC/ThirdPartyDeduction.robot
Resource  ${PAGE OBJECTS}/ACC/LiabilityPayments.robot

*** Keywords ***
Open Third Party Deduction Page
    ThirdPartyDeduction.Go To Third Party Deduction Page

Add New Third Party Deduction
    [Arguments]  ${dataDictionary}  ${employeeName}
    ThirdPartyDeduction.Click On ADD New Entry Button
    ThirdPartyDeduction.Select Employee  ${dataDictionary}  ${employeeName}
    ThirdPartyDeduction.Fill Third Party Deduction  ${dataDictionary}
    ThirdPartyDeduction.Save Details

Open Liability Payments Page
    LiabilityPayments.Go To Liability Payments Page

Add Liability Payment
    [Arguments]  ${dataDictionary}  ${EMPLOYEECODE}
    LiabilityPayments.Click On Add New Button
    LiabilityPayments.Fill Liability Form Details  ${dataDictionary}
    LiabilityPayments.Fetch Employee  ${EMPLOYEECODE}
    LiabilityPayments.Save Details

Set Liability Payments Filters
    [Arguments]  ${dataDictionary}  ${status}
    LiabilityPayments.Open Filters
    LiabilityPayments.Select Filters  ${dataDictionary}  ${status}
    LiabilityPayments.Apply Filters

Edit Draft Entry
    LiabilityPayments.Click On Edit Button
    LiabilityPayments.Click On Update Button

Delete Draft Entry
    LiabilityPayments.Click On Delete Button

Generate Payment
    [Arguments]  ${EMPLOYEECODE}
    LiabilityPayments.Click On Generate Payment Button
    Switch window  New
    LiabilityPayments.Select Ledger
    LiabilityPayments.Verify Employee Is Listed  ${EMPLOYEECODE}
    LiabilityPayments.Click On Generate Payment

