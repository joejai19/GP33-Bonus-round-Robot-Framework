*** Settings ***
Documentation     A test suite with a single test for valid creation.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Create
    Open Browser To Create Page
    Input Username    demo
    Input Password    mode
    Submit Credentials
    Create Page Should Be Open
    [Teardown]    Close Browser
