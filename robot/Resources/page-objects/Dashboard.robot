*** Keywords ***
Open Login Page And Do Login
    [Documentation]  Opens login page and do login.
	Go To  http://rajerp.rajasthan.gov.in/home/adminlogin
	Attempt Login  ${ADMIN_USER_LIVE}

Check For Dashboard Text On The Page
    [Documentation]  Checks for "Dashboard" text on the page.
    page should contain element  //span[contains(text(),'Dashboard')]

Check For Page URL
    [Documentation]  Fetches page url and verifies that it contains "Dashboard" text.
    ${pageUrl}  get location
    should contain  ${pageUrl}  Dashboard