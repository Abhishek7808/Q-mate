*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library      Screenshot


*** Variables ***
${browser}  chrome
${url}  https://demoprojects.e-connectsolutions.com/eprash-test
${groupdata}     robot/Data/ERP_MIS/MIS.json

*** Keywords ***
Logintoapp1
    open browser    ${url}     ${browser}
    wait until page contains    Password
    input text  id:LoginIdForShow       kritika.rsmml
    sleep   2s
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]

Load json1
    ${data}     Get File    ${groupdata}
    ${object}=   Evaluate    json.loads('''${data}''')   json
    set global variable     ${object}
    Log Many    &{object}       console=yes


Fill Report Filter
    [Documentation]  This keyword will fill the filters and wait until one or more employee details calculate
    Go to   ${object['Income Tax Deduction']['url']}
    Fill filters
    Recalculate details
    Recursive Loop


Fill filters
    [Documentation]  Filling the report filters
    Select from list by index   ${object['Income Tax Deduction']['Financial year']['Locator']}   ${object['Income Tax Deduction']['Financial year']['Value']}
    Click element   ${object['Income Tax Deduction']['Location']['Locator']['Locator1']}
    Input Text      ${object['Income Tax Deduction']['Location']['Locator']['Locator2']}       Head Office
    press keys      ${object['Income Tax Deduction']['Location']['Locator']['Locator2']}      \ue007

    #click element   ${object['Income Tax Deduction']['Pay Group']['Locator']['Locator1']}
    sleep  2s
    #click element   ${object['Income Tax Deduction']['Pay Group']['Locator']['Locator2']}
    sleep  2s
    #click element   ${object['Income Tax Deduction']['Division']['Locator']['Locator1']}
    #click element   ${object['Income Tax Deduction']['Division']['Locator']['Locator2']}
    #click element   ${object['Income Tax Deduction']['Division']['Locator']['Locator2']}
    #click element   ${object['Income Tax Deduction']['Employee Name']['Locator']['Locator1']}
    #click element   ${object['Income Tax Deduction']['Employee Name']['Locator']['Locator2']}
    sleep  1s
    select from list by index   ${object['Income Tax Deduction']['Report Type']['Locator']}   ${object['Income Tax Deduction']['Report Type']['Value']}


Recalculate details
    Sleep     30S
    Click element   ${object['Income Tax Deduction']['Recalculate']['Locator']}
    Wait Until Page Contains Element    //button[contains(text(),'OK')]     30s
    Wait Until Element Is Visible       //button[contains(text(),'OK')]     30s
    Click Element   //button[contains(text(),'OK')]

Recursive Loop
    [Documentation]  It will check until atleast
    Sleep   10s
    Go to   ${object['Income Tax Deduction']['url']}
    Fill filters
    Wait Until Page Contains Element        ${object['Income Tax Deduction']['Calculation done for']['Locator']}        30s
    Sleep   5s
    ${Emp_Count}=    Get Text    //b[@id='btext']/span[1]/label
    #${Emp_Count}=    Get Text
    Log Many    ${Emp_Count}
    Run Keyword If      '${Emp_Count}' == '${EMPTY}'       Recursive Loop
    Run keyword If    '${Emp_Count}' > '2'   View Report
    ...         ELSE      Recursive Loop

View Report
    Sleep   5s
    Click element   ${object['Income Tax Deduction']['View Button']['Locator']}

Verify Report
    Sleep   5s
    Switch Window   Income Tax Deduction Report
    Wait Until Page Does Not Contain        Sorry, an error occurred while processing your request      15s
    Wait Until Page Contains Element   //div[@class='widget-body innerAll ']//table[@id='export_table1']//tbody//tr[1]//td[1]      10s
    ${check} =   Get Text    //div[@class='widget-body innerAll ']//table[@id='export_table1']//tbody//tr[1]//td[1]
    Run keyword If      '${check}' >= '1'     Capture Page Screenshot