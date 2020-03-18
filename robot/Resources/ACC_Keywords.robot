*** Settings ***
Resource  ${PAGE OBJECTS}/ACC/ThirdPartyDeduction.robot

*** Keywords ***
Open Third Party Deduction Page
    ThirdPartyDeduction.Go To Third Party Deduction Page

Add New Third Party Deduction
    [Arguments]  ${dataDictionary}  ${employeeName}
    ThirdPartyDeduction.Click On ADD New Entry Button
    ThirdPartyDeduction.Select Employee  ${dataDictionary}  ${employeeName}
    ThirdPartyDeduction.Fill Third Party Deduction  ${dataDictionary}
    ThirdPartyDeduction.Save Details