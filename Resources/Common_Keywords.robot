*** Settings ***
Library  SeleniumLibrary
Resource  ../Data/Common_Data.robot

*** Keywords ***
Begin Web Test
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    close all browsers

Read JSON File
    [Arguments]  ${JSON_File}
    ${JSON}=  Get file  ${JSON_File}
    return from keyword  ${JSON}

Evaluate And Store JSON File
    [Arguments]  ${JSON}
    @{urls_list}=    Evaluate     json.loads('''${json}''')    json
    return from keyword  @{urls_list}

Read And Evaluate JSON File
    [Arguments]  ${JSON_File}
    ${JSON}   Read JSON File  ${JSON_File}
    ${File_JSON}  Evaluate And Store JSON File  ${JSON}
    return from keyword  ${File_JSON}