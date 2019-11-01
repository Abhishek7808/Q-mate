*** Settings ***
Resource  ../Data/Common_Data.robot
Library  SeleniumLibrary  plugins=${PLUGINS}/ERP.py
Library	 OperatingSystem
Library	 String


*** Keywords ***
Begin Web Test
#    Set Global Variable  ${ROOT}  ${CURDIR}
#    Set Global Variable  ${TESTS}  ${CURDIR}${/}..${/}Tests
#    Set Global Variable  ${RESOURCES}  ${CURDIR}${/}..${/}Resources
#    Set Global Variable  ${PLUGINS}  ${CURDIR}${/}..${/}Plugins
    #${FILE}  Get file  ${ErrorFile}
    #${x}  Evaluate  ${File}

    #support for the library path
    ${libPath}  Replace String  ${CURDIR}  ${RESOURCE_DIR}  ${LIBRARY_DIR}
#    log to console  ${Update123}
    evaluate  sys.path.append(os.path.join(r'${libPath}'))  modules=os, sys

#    ${resultPath}  Replace String  ${CURDIR}  ${RESOURCE_DIR}  ${RESULTS_DIR}
#    Remove File  ${resultPath}/${REPORT_NAME}
#    log to console  ${resultPath}/${REPORT_NAME}
#    log to console  ${resultPath}${/}${REPORT_NAME}

    ${UpperDir}  ${Leaf}  Split String From Right  ${CURDIR}   ${/}    1
#    log to console    ${UpperDir}${/}${RESULTS_DIR}${/}${REPORT_NAME}
    Remove File  ${UpperDir}${/}${RESULTS_DIR}${/}${REPORT_NAME}
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