*** Variables ***
${FILTER BUTTON}  //*[@id="btnFilter"]
${APPLY FILTER}  //button[contains(text(),'Apply Filter')]
*** Keywords ***


Select Filter Menu
     wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click button  ${FILTER BUTTON}
     sleep  2s


Apply Filter
     wait until keyword succeeds  ${RETRY TIME}  ${RETRY INTERVAL}  click button  ${APPLY FILTER}

