*** Variables ***
${pageUrl}  SMM/Receipt/ReceiptList

*** Keywords ***
Go To Receipt List Page From Department
    [Documentation]  Opens reciept list page.
    Go To ERP Page  ${BASE_URL.${ENVIRONMENT}}/${pageUrl}

Add New Receipt
    [Documentation]  Clicks on add new reciept button.
    Input Valid Value    Generate Receipt Create New Button

Fill Receipt Form
    [Documentation]  Fills details into receipt form.
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Branch["Name"]} (${Company["Enter PAN"]})
    Input Valid Value    Receipt Enter Customer PAN or Name    ${Val}
    ${status}  run keyword and return status  Input Valid Value    Receipt Company Name    ${Company["Company Name"]}
    ${status}  run keyword and return status  Input Valid Value    Receipt Branch Name    ${Branch["Name"]}
    ${status}  run keyword and return status  Input Valid Value    Receipt Pincode    ${Branch["Pincode"]}
    ${status}  run keyword and return status  Input Valid Value    Receipt City    ${Branch["City"]}
    ${status}  run keyword and return status  Input Valid Value    Receipt State    ${Branch["State"]}
    Input Valid Value    Receipt Receipt Against    ${Receipt["Receipt Against"]}
    #TODO: Bank name can vary
    Input Valid Value    Receipt Deposited In    ${Receipt["Deposited In"]}
    Input Valid Value    Receipt Remarks    ${Receipt["Remarks"]}
    Input Valid Value    Receipt Instrument Type    ${Receipt["Instrument Type"]}
    Input Valid Value    Receipt Bank    ${Receipt["Bank"]}
    Input Valid Value    Receipt Instrument No.    ${Receipt["Instrument No."]}
    Input Valid Value    Receipt Instrument Details Date    ${Receipt["Date"]}
    Input Valid Value    Receipt Amount    ${Receipt["Amount"]}
    Input Valid Value    Receipt Add Button
    Input Valid Value    Generate Receipt Submit Button

View Reciept Details
    [Documentation]  Takes branch name as argument and opens reciept details of given branch.
    [Arguments]  ${branchNAme}
    Wait Until Keyword Succeeds    ${RETRY TIME}    ${RETRY INTERVAL}    click element  //span[contains(text(),'${branchName}')]/../following-sibling::td/i[@title='View']

Approve Reciept
    [Documentation]  Clicks on approve button.
    click button  btnactionApprove
