*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library      Screenshot
#Resource    ../../Resource/Keywords.robot (Circular import is a bad practice ;) )

*** Variables ***

${browser}  chrome
${url}  https://demoprojects.e-connectsolutions.com/eprash-test
#Data folder moved from resource to Qmate
${groupdata}    Resource/Data/MIS.json
@{alldates}
${date_text}
${date}
${check}


*** Keywords ***
Logintoapp
    open browser    ${url}     ${browser}
    maximize browser window
    wait until page contains    Password
    input text  id:LoginIdForShow       kritika.rsmml
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]

Load json
    ${data}     Get File    ${groupdata}
    ${object}=   Evaluate    json.loads('''${data}''')   json
    set global variable     ${object}
    Log Many    &{object}       console=yes

ViewSalary
    go to       ${object["Monthly Report"]["url"]}
    click element       ${object["Monthly Report"]["Filter button"]}
    Select From List By Label   ${object["Monthly Report"]["Financial Year"]["Locator"]}    ${object["Monthly Report"]["Financial Year"]["Value"]}
    Select From List By Label   ${object["Monthly Report"]["Cycle Type"]["Locator"]}    Salary
    Select From List By Index   ${object["Monthly Report"]["Salary Cycle"]["Locator"]}    1
    click element   ${object["Monthly Report"]["Checkbox"]["Locator"]}
    sleep   2s
    click element   ${object["Monthly Report"]["Apply filter"]["Locator"]}

VerifyReportOfSalary
    Wait Until Page Does Not Contain        No Record Found      120s
    Wait Until Element Is Not Visible       xpath://div[@id='LoadingImage']     timeout=120
    ${check} =   Get Text       xpath://*[@id="export_table"]/tbody/tr/td/table/tbody/tr[1]/td[1]
    Run keyword If      '${check}' == '1'     Capture Page Screenshot

ViewArrear
    #go to       ${object["Monthly Report"]["url"]}
    click element       ${object["Monthly Report"]["Filter button"]}
    Select From List By Label   ${object["Monthly Report"]["Financial Year"]["Locator"]}    ${object["Monthly Report"]["Financial Year"]["Value"]}
    Select From List By Label   ${object["Monthly Report"]["Cycle Type"]["Locator"]}    Arrear
    sleep   1s
    Select From List By Index   ${object["Monthly Report"]["Salary Cycle"]["Locator"]}    1
    #Scroll Element Into View    ${object["Monthly Report"]["Checkbox"]["Locator"]}
    click element   ${object["Monthly Report"]["Checkbox"]["Locator"]}
    sleep   2s
    click element   ${object["Monthly Report"]["Apply filter"]["Locator"]}

VerifyReportOfArrear
    Wait Until Page Does Not Contain        Sorry, an error occurred while processing your request      120s
    Wait Until Element Is Not Visible       xpath://div[@id='LoadingImage']     timeout=120
    ${check} =   Get Text       xpath://*[@id="export_table"]/tbody/tr/td/table/tbody/tr[1]/td[1]
    Run keyword If      '${check}' == '1'     Capture Page Screenshot

ViewLeaveEncashment
    click element       ${object["Monthly Report"]["Filter button"]}
    Select From List By Label   ${object["Monthly Report"]["Financial Year"]["Locator"]}    ${object["Monthly Report"]["Financial Year"]["Value"]}
    Select From List By Label   ${object["Monthly Report"]["Cycle Type"]["Locator"]}    Leave Encashment
    #Select From List By Index   ${object["Monthly Report"]["Salary Cycle"]["Locator"]}    1
    sleep   1s
    click element   ${object["Monthly Report"]["Checkbox"]["Locator"]}
    click element   ${object["Monthly Report"]["Apply filter"]["Locator"]}

VerifyLeaveEncashment
    Wait Until Page Does Not Contain        Sorry, an error occurred while processing your request      120s
    Wait Until Element Is Not Visible       xpath://div[@id='LoadingImage']     timeout=120
    ${check} =   Get Text       xpath://*[@id="export_table"]/tbody/tr/td/table/tbody/tr[1]/td[1]
    Run keyword If      '${check}' == '1'     Capture Page Screenshot

ViewBonus
    click element       ${object["Monthly Report"]["Filter button"]}
    Select From List By Label   ${object["Monthly Report"]["Financial Year"]["Locator"]}    ${object["Monthly Report"]["Financial Year"]["Value"]}
    Select From List By Label   ${object["Monthly Report"]["Cycle Type"]["Locator"]}    Bonus
    sleep   5s
    Select From List By Index   ${object["Monthly Report"]["Salary Cycle"]["Locator"]}    1
    sleep   1s
    click element   ${object["Monthly Report"]["Checkbox"]["Locator"]}
    click element   ${object["Monthly Report"]["Apply filter"]["Locator"]}

VerifyBonus
    Wait Until Page Does Not Contain        Sorry, an error occurred while processing your request      120s
    Wait Until Page Does Not Contain        No Record Found      30s
    Wait Until Element Is Not Visible       xpath://div[@id='LoadingImage']     timeout=120
    ${check} =   Get Text       xpath://*[@id="export_table"]/tbody/tr/td/table/tbody/tr[1]/td[1]
    Run keyword If      '${check}' == '1'     Capture Page Screenshot