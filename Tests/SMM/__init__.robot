*** Settings ***
Resource  ../../Resources/Common_Keywords.robot

Suite Setup          Common_Keywords.Begin SMM Testing
Suite Teardown       Common_Keywords.End SMM Testing

*** Variables ***
${Test Data File}                       ${DATA}${/}testData.json
${Department Key Description File}      ${DATA}${/}KeyDescriptionDepartment.json
${Customer Key Description File}        ${DATA}${/}KeyDescriptionCustomer.json
${configFile}                           ${DATA}${/}config.json