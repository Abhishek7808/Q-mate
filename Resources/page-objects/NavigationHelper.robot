*** Variables ***
${FILTER BUTTON}  //*[@id="btnFilter"]
${APPLY FILTER}  //button[contains(text(),'Apply Filter')]
*** Keywords ***


Select Filter Menu
     click button  ${FILTER BUTTON}
     sleep  2s


Apply Filter
     click button  ${APPLY FILTER}

