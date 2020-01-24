*** Settings ***
Resource  ../Configuration.resource
Resource  ${RESOURCES}/Common_Keywords.robot

Suite Setup          Common_Keywords.Begin Basic Testing
Suite Teardown       Common_Keywords.End Basic Testing
