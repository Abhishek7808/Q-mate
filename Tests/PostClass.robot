*** Settings ***
Resource  ../Resources/Common_Keywords.robot
Resource  ../Resources/HRMS_Keywords.robot
Resource  ../Data/Login_Data.robot
Resource  Configuration.robot
Resource  ../Resources/page-objects/ModuleNavigation.robot

#Suite Setup  Common_Keywords.Begin Web Test
#Suite Teardown  Common_Keywords.End Web Test

# robot -d Results -i adminlogin -i postclass Tests/

*** Variables ***
#Overwrite default configuration
#${ENVIRONMENT} =  demo
#${BROWSER} =  firefox
# login data added into Data/Login_Data.robot
#${rows} =  get element count  ${Table_URL}/tbody/tr
#${Update_button} =  //*[@id="classListing"]/div[1]/table/tbody/tr[${rows}]/td[6]/div/a


*** Test Cases ***
Attempt Logout
    [Tags]  postclass
    ERP_Keywords.Attempt Logout

User should be able to access post class page
    [Tags]  postclass
    HRMS_Keywords.Open Post Class Page

Add new post class from the post class configuration
    [Tags]  postclass
    HRMS_Keywords.Add New Class

Fill details of a postclass
    [Tags]  postclass
    HRMS_Keywords.Fill Post Class Details  Sitaram1  5  0

Check weather the entry is added or not
    [Tags]  postclass
    HRMS_Keywords.Check Post Class Entry  Sitaram1

Update the new post class element
    [Tags]  postclass
    HRMS_Keywords.Update The Added Post Class Element  Ramadheer  15  1

Deleting the post class element
    [Tags]  postclass
    HRMS_Keywords.Delete The Added Post Class Element  Ramadheer


