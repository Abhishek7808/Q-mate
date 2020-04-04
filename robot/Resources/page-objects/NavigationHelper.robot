*** Variables ***
${FILTER BUTTON}  //*[@id="btnFilter"]
${APPLY FILTER}  //button[contains(text(),'Apply Filter')]
*** Keywords ***


Select Filter Menu
    [Documentation]  Opens filter menu.
    ${status}  run keyword and return status  wait until element is visible  ${FILTER BUTTON}
    run keyword if  ${status} == ${True}  wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click button  ${FILTER BUTTON}
    run keyword if  ${status} == ${False}  run keyword and continue on failure  Fail  There is an error on the page
    sleep  2s

Apply Filter
    [Documentation]  Clicks on apply filter button.
    wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click button  ${APPLY FILTER}

