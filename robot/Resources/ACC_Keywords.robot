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