*** Keywords ***
Go To Dashboard
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/Dashboard

Check For Dashboard Text On The Page
    page should contain element  //span[contains(text(),'Dashboard')]
    capture page screenshot

Check For Page URL
    ${pageUrl}  get location
    should contain  ${pageUrl}  Dashboard