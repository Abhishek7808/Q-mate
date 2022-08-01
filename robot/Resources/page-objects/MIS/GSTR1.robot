*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library     Screenshot
#Library     SeleniumScreenshots

*** Variables ***
${browser}  chrome
${url}  https://demoprojects.e-connectsolutions.com/eprash-test
#Data folder moved from resource to Qmate
${groupdata}    robot/Data/ERP_MIS/MIS.json

*** Keywords ***
GSTR1_Login
    open browser    ${url}     ${browser}
    wait until page contains    Password
    Maximize Browser Window
    input text  id:LoginIdForShow       kritika.rsmml
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]
    GSTR1.Load json

Load json
    ${data}     Get File    ${groupdata}
    ${object}=   Evaluate    json.loads('''${data}''')   json
    set global variable     ${object}
    Log Many    &{object}       console=yes

Open Report
    go to  ${object["GSTR1"]["url"]}

Fill GSTR1 Report
    FOR     ${i}     IN RANGE     6
            GSTR1.Select Filters  ${i}
            GSTR 1 Verfiy Report
    END

Select Filters
    [Arguments]  ${reprot_index}
    GSTR1.Open Report
    #From and To Date Selection
    Wait Until Page Contains Element       ${object["GSTR1"]["GSTR Type"]["Locator"]}
    select from list by index    ${object["GSTR1"]["GSTR Type"]["Locator"]}   ${reprot_index}
    click element   ${object["GSTR1"]["Viewbutton"]["Locator"]}
    sleep    2s

From and To Date Selection
    click element    ${object["GSTR1"]["From Date"]["Locator"]["Locator1"]}
    select from list by index    ${object["GSTR1"]["From Date"]["Locator"]["Locator2"]}   1
    select from list by index    ${object["GSTR1"]["From Date"]["Locator"]["Locator3"]}   0
    Get WebElement      ${object["GSTR1"]["From Date"]["Locator"]["Locator4"]}
    @{alldates} =   Get WebElements    ${object["GSTR1"]["From Date"]["Locator"]["Locator4"]}
    log many   @{alldates}
    FOR     ${date}     IN       @{all dates}
            ${date_text} =    Get Text   ${date}
            Run Keyword If        ${date_text} == 1    Click element     //tbody/tr/td/a [text()=${date_text}]
            Exit For Loop If      ${date_text} == 1
    END
    sleep  2s
    click element    ${object["GSTR1"]["To Date"]["Locator"]["Locator1"]}
    select from list by index    ${object["GSTR1"]["To Date"]["Locator"]["Locator2"]}   2
    select from list by index    ${object["GSTR1"]["To Date"]["Locator"]["Locator3"]}   1
    Get WebElement      ${object["GSTR1"]["To Date"]["Locator"]["Locator4"]}
    @{alldates} =   Get WebElements    ${object["GSTR1"]["To Date"]["Locator"]["Locator4"]}
    log many   @{alldates}
    FOR     ${date}     IN       @{all dates}
            ${date_text} =    Get Text   ${date}
            Run Keyword If        ${date_text} == 5    Click element     //tbody/tr/td/a [text()=${date_text}]
            Exit For Loop If      ${date_text} == 5
    END

    ${currentdate}=  Get Current Date
    ${convert}=     Convert Date    ${currentdate}      result_format=%d-%b-%Y
    Log         ${convert}      console=yes

GSTR 1 Verfiy Report
    [Documentation]  Verify if Page Contains any Error or Data drawn
    Sleep   5S
    Switch Window   GSTR1 Report
    Wait Until Page Does Not Contain    Sorry, an error occurred while processing your request, 15s
    Wait Until Page Does Not Contain        No Record Found      15s
    Wait Until Element Is Not Visible       xpath://div[@id='LoadingImage']     timeout=120
    ${check} =   Get Text       xpath://table[@class='table export_table']//tbody//tr[2]//td[1]
    Run Keyword And Ignore Error      '${check}' == '1'     Capture Page Screenshot