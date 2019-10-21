*** Variables ***
${PLANTLIST_LINK}                    /PlantList
${ADD_CUSTOMER_BUTTON}               xpath=//button[@id='btnAddCustomer']


*** Keywords ***
Go To ERP Page PlantList Page
    Go To ERP Page  ${URL.${ENVIRONMENT}}&{SMM}[link]${PLANTLIST_LINK}
    #http://demoprojects.e-connectsolutions.com/ERP-TEST/SMM/PlantList
Go To ERP Page Add
    click button  ${ADD_CUSTOMER_BUTTON}

Fill The Form
