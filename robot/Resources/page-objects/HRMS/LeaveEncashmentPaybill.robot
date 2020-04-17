*** Keywords ***
Go To Leave Encashment Paybill Page
    [Documentation]  Navigates to leave encashment paybill page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${dataDictionary["URL"]}

Click On Add Paybill Link
    [Documentation]  Clicks on add paybill link.
    click element  //a[@id='modals-bootbox-custom']