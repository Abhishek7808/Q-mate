*** Variables ***
@{moduleUrls}

*** Keywords ***

Get All Module Urls
    [Arguments]  ${muduleName}
    @{moduleUrls}  Filter Module Urls  ${muduleName}  ${URLS_JSON}
    return from keyword  @{moduleUrls}

Perform All Critical Generic Tests On Urls
    [Arguments]  @{moduleUrls}
    :For  ${url}  IN  @{moduleUrls}
    \   Open ERP Page  ${url}
    \   Run Keyword And Continue On Failure  Check Error Occurred

#    \   Run Keyword And Continue On Failure  Check Title Tag

Open ERP Page
    [Arguments]  ${pageUrl}
    go to  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Check Error Occurred
    page should not contain  Sorry! An error

Check Title Tag
    ${title}=  get title
    should not be empty  ${title}
    should not be equal  ${title}  Index