*** Settings ***
Resource  ../../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot
Resource  ${RESOURCES}/CPF_Keywords.robot
Resource  ${RESOURCES}/ERP_Keywords.robot


#robot -d Results --variable BROWSER:chrome --variable ENVIRONMENT:test --variable LOGIN:test_rvpn -i queryfire robot/Tests
*** Test Cases ***
User should able to fire queries
    [Tags]  queryfire
    #CPF_Keywords.Open Loan Application Page
    CPF_keywords.Fire Queries

