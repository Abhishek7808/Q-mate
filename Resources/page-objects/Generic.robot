*** Variables ***
@{moduleUrls}
@{fatalErorrs}  create list

*** Keywords ***

Get All Module Urls
    [Arguments]  ${muduleName}
    @{moduleUrls}  Filter Module Urls  ${muduleName}  ${URLS_JSON}
    return from keyword  @{moduleUrls}

Perform All Critical Generic Tests On Urls
    [Arguments]  ${moduleName}  @{moduleUrls}
    :FOR  ${url}  IN  @{moduleUrls}
    \   Open ERP Page  ${url}
    \   Run Keyword And Continue On Failure  Check Error Occurred
    \   Add Failed Url To The fatal Error List  ${url}
    Report Fatal Errors To Developers  ${moduleName}  @{fatalErorrs}

Add Failed Url To The fatal Error List
    [Arguments]   ${url}
    append to list  ${fatalErorrs}    ${url}




Report Fatal Errors To Developers
     [Arguments]  ${moduleName}  @{fatalErorrs}
     Email Fatal Error List To Concern Person  ${moduleName}  @{fatalErorrs}



#    \   Run Keyword And Continue On Failure  Check Title Tag
Get Urls List Of Fatal Errors
    [Arguments]  ${fatalErorrs}
    return from keyword  ${fatalErorrs}



Open ERP Page
    [Arguments]  ${pageUrl}
    go to  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}


Check Error Occurred
    page should not contain  Sorry! An error

Check Title Tag
    ${title}=  get title
    should not be empty  ${title}
    should not be equal  ${title}  Index