*** Settings ***
Documentation     A test suite containing tests related to invalid creation.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Create Page
Suite Teardown    Close Browser
Test Setup        Go To Create Page
Test Template     Create With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***                                         TITLE     DESCRIPTION  DIFFICULTY   LANGUAGE
Empty Title                                              ${EMPTY}    ${FILLED}    ${FILLED}    ${FILLED}
Empty Description                                        ${FILLED}   ${EMPTY}     ${FILLED}    ${FILLED}
Empty Difficulty                                         ${FILLED}   ${FILLED}    ${EMPTY}     ${FILLED}
Empty Language                                           ${FILLED}   ${FILLED}    ${FILLED}    ${EMPTY}
Empty Title and Description                              ${EMPTY}    ${EMPTY}     ${FILLED}    ${FILLED}
Empty Title and Difficulty                               ${EMPTY}    ${FILLED}    ${EMPTY}     ${FILLED}
Empty Title and Language                                 ${EMPTY}    ${FILLED}    ${FILLED}    ${EMPTY}
Empty Description and Difficulty                         ${FILLED}   ${EMPTY}     ${EMPTY}     ${FILLED}
Empty Description and Language                           ${FILLED}   ${EMPTY}     ${FILLED}    ${EMPTY}
Empty Difficulty and Language                            ${FILLED}   ${FILLED}    ${EMPTY}     ${EMPTY}
Empty Description and Difficulty and Language            ${FILLED}   ${EMPTY}     ${EMPTY}     ${EMPTY}
Empty Title and Difficulty and Language                  ${EMPTY}    ${FILLED}    ${EMPTY}     ${EMPTY}
Empty Title and Description and Language                 ${EMPTY}    ${EMPTY      ${FILLED}    ${EMPTY}
Empty Title and Description and Difficulty               ${EMPTY}    ${EMPTY}     ${EMPTY}     ${FILLED}
Empty Title and Description and Difficulty and Language  ${EMPTY}    ${EMPTY}     ${EMPTY}     ${EMPTY}
*** Keywords ***
Create With Invalid Credentials Should Fail
    [Arguments]    ${title}    ${description}	${difficulty}	${language}
    Input Title    ${title} 
    Input Description    ${description}
    Input Difficulty    ${difficulty}
    Input Language    ${language}
    
    Submit Credentials
    Create Should Have Failed

Create Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
