*** Settings ***


*** Test Cases ***


*** Keywords ***

Fill Group Registration Form By Department
    Input Valid Value    Customer Group Group Name    ${Branch["Group Name"]}
    Input Valid Value    Customer Group Description    ${Branch["Group Description"]}
    &{Val}    Create Dictionary    Input=${Company["Enter PAN"]}    Search=${Company["Company Name"]} (${Company["Enter PAN"]})
    Input Valid Value    Customer Group Enter Customer PAN or Name    ${Val}
    Input Valid Value    Customer Group Add Button

Check For Alert
    [Arguments]  ${alertText}
    Alert Should Be Present    ${alertText}

Open Customer Group List
    Input Valid Value    Customer Group View List Button From Add Group

