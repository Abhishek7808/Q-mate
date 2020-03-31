*** Keywords ***
Open Login Page And Do Login
	Go To  http://rajerp.rajasthan.gov.in/home/adminlogin
	Attempt Login  ${ADMIN_USER_LIVE}

Check For Dashboard Text On The Page
    page should contain element  //span[contains(text(),'Dashboard')]

Check For Page URL
    ${pageUrl}  get location
    should contain  ${pageUrl}  Dashboard