*** Settings ***
Resource    ../Configuration.resource
Library     SeleniumLibrary  plugins=${PLUGINS}/ERP.py
Library	    OperatingSystem
Library	    String


*** Keywords ***
Begin Web Test
    #support for the library path
    # ${libPath}  Replace String  ${CURDIR}  ${RESOURCE_DIR}  ${LIBRARY_DIR}
    #log to console  ${LIBRARY}
    evaluate  sys.path.append(os.path.join(r'${LIBRARY}'))  modules=os, sys

    #support for the plugin path
    #${pluginPath}  Replace String  ${CURDIR}  ${RESOURCE_DIR}  ${PLUGINS_DIR}
    #evaluate  sys.path.append(os.path.join(r'${PLUGINS}'))  modules=os, sys

    # remove file  ${ERRORFILE}

    open browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    close all browsers

Read JSON File
    [Arguments]  ${JSON_File}
    ${JSON}=  Get file  ${JSON_File}
    return from keyword  ${JSON}
    log

Evaluate And Store JSON File
    [Arguments]  ${JSON}
    @{urls_list}=    Evaluate     json.loads('''${json}''')    json
    return from keyword  @{urls_list}

Read And Evaluate JSON File
    [Arguments]  ${JSON_File}
    ${JSON}   Read JSON File  ${JSON_File}
    ${File_JSON}  Evaluate And Store JSON File  ${JSON}
    return from keyword  ${File_JSON}