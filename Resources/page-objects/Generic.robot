*** Variables ***

*** Keywords ***
Check Error Occurred
    page should not contain  Sorry! An error

Check Title Tag
    ${title}=  get title
    should not be empty  ${title}
    should not be equal  ${title}  Index