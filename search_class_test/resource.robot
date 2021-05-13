*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Safari
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${CREATE URL}      http://${SERVER}/createClass.html
${CREATED URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
Open Browser To Create Class Page
    Open Browser    ${CREATE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create Page Should Be Open

Create Page Should Be Open
    Title Should Be Create Page

Go To Create Page
    Go To   ${CREATE URL}
    Create Page Should Be Open

Input title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input description
    [Arguments]    ${description}
    Input Text    description_field    ${description}

Input difficulty
    [Arguments]    ${difficulty}
    Input Text    difficulty_field    ${difficulty}

Input language 
    [Arguments]    ${language}
    Input Text    language_field    ${language}

Submit Credentials
    Click Button    submit_button

Created Page Should Be Open
    Location Should Be    ${CREATED URL}
    Title Should Be Created Page
