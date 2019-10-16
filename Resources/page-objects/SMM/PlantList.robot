*** Variables ***
${PLANTLIST_LINK}                    /PlantList
${ADD_CUSTOMER_BUTTON}               xpath=//button[@id='btnAddCustomer']


*** Keywords ***
Go To PlantList Page
    Go to  ${URL.${ENVIRONMENT}}&{SMM}[link]${PLANTLIST_LINK}
    #http://demoprojects.e-connectsolutions.com/ERP-TEST/SMM/PlantList
Go To Add
    click button  ${ADD_CUSTOMER_BUTTON}

Fill The Form
