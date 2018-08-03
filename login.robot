*** Settings ***
Library    Selenium2Library
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    http://cpru.printcode.co.th/login
${BROWSER_DRIVER}    chrome

*** Test Cases ***
Valid Login
    Go To Login Page
    Fill In Username
    Fill In Password
    Click Login Button
    Display Member Page
    
*** Keywords ***
Go To Login Page
    Open Browser    ${URL}    ${BROWSER_DRIVER}

Display Member Page
    Wait Until Page Contains   Member

Fill In Username
    Input text     login     kae

Fill In Password
    Input text     password   1234

Click Login Button
    Click Button    login-submit




