*** Variables ***
${pageUrl}  SMM/Schedule

*** Keywords ***
Go To Schedule Page
    [Documentation]  Opens schedule page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Open Schedule
    [Documentation]  Takes schedule name as argument and open details of it.
    [Arguments]  ${scheduleName}
    Click Element    //span[contains(text(),'${scheduleName}')]/../following-sibling::td/i[@title='View']

Add Formula
    [Documentation]  Adds formula to the schedule.
    Input Valid Value    Product Management Clear Button
    Select From List By Value    keyword    0
    Select From List By Value    keyword    6
    Click Button    btnMultiply
    Input Text    amountFormula    70
    Input Text    calculationOrder    1
    Input Valid Value    Product Management Update Button

Add Schedule
    [Documentation]  Clicks on add schedule button.
    click button  addNewSchedule

Fill Schedule Form
    [Documentation]  Fills details into schedule form.
    Input Valid Value    Select Component    ${SC["Select Component"]}
    Input Valid Value    Start Date    ${SC["Start From"]}
    Input Valid Value    End Date    ${SC["End"]}
    Input Valid Value    Application From    ${SC["Application From"]}
    Input Valid Value    Schedule Structure    ${SC["Structure"]}
#    Input Valid Value    Schedule Product   ${SC["Product"]}
#    Input Valid Value    Schedule Customer    ${SC["Customer"]}
    Input Valid Value    Schedule Agreement    ${SC["Agreement"]}
    Input Valid Value    Agreement PO    ${SC["Agreement PO"]}
    Input Valid Value    Calculation Type    ${SC["Calculation Type"]}
    Clear Text Value  formula
    Input Valid Value    Keyword  ${SC["Schedule keyword"]}
    Input Valid Value    Multiply
    input text  amountFormula  12
    Input Valid Value    Priority    ${SC["Priority"]}
    Input Valid Value    Schedule Save Button

