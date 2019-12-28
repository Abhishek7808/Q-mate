*** Settings ***
Resource  ../../Resources/Common_Keywords.robot

Suite Setup          Common_Keywords.Begin SMM Testing
Suite Teardown       Common_Keywords.End SMM Testing

*** Variables ***
${Test Data File}                       ${SMM_DATA_FILES}${/}testData.json
${Department Key Description File}      ${SMM_DATA_FILES}${/}KeyDescriptionDepartment.json
${Customer Key Description File}        ${SMM_DATA_FILES}${/}KeyDescriptionCustomer.json
${configFile}                           ${SMM_DATA_FILES}${/}config.json