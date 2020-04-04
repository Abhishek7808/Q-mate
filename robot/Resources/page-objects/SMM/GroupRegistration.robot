*** Settings ***


*** Keywords ***

Fill Group Registration Form By Department
    [Documentation]  Fills details into group registration form.
    Input Valid Value    Customer Group Group Name    ${Branch["Group Name"]}
    Input Valid Value    Customer Group Description    ${Branch["Group Description"]}
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Company["Company Name"]} (${Company["Enter PAN"]})
    Input Valid Value    Customer Group Enter Customer PAN or Name    ${Val}
    Input Valid Value    Customer Group Add Button

Check For Alert
    [Documentation]  Takes alert text as argument and verifies that given alert text is present.
    [Arguments]  ${alertText}
    Alert Should Be Present    ${alertText}

Open Customer Group List
    [Documentation]  Opens customer group list.
    Input Valid Value    Customer Group View List Button From Add Group

