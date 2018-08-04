*** Settings ***
Library    Selenium2Library
Suite Teardown    Close All Browsers
# Test Setup        Go To Page Login

*** Variables ***
${URL}    http://cpru.printcode.co.th/login
${BROWSER_DRIVER}    chrome

*** Test Cases ***
Valid Login
    Given Go To Page Login
    When Login With Authorize User
    Then Go To Page Member Page

Cannot Login When User Has No Authorize
    Given Go To Page Login
    When Login With No Authorize User
    Then Should Show Error Message

*** Keywords ***
Go To Page Login
    Open Browser    ${URL}    ${BROWSER_DRIVER}

Login With Authorize User
    Input text     login     demo
    Input text     password   1234
    Click Login Button

Login With No Authorize User
    Input text     login     phatpan
    Input text     password   1234
    Click Login Button

Should Show Error Message
    Wait Until Element Is Visible    error-message    
    Wait Until Page Contains   authorization failed

Go To Page Member Page
    Wait Until Page Contains   Member

Click Login Button
    Click Button    login-submit

