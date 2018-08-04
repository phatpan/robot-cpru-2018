*** Settings ***
Library    ExtendedSelenium2Library
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

Display Data Member In Table
    Display Member Page
    First Row Should Contains Display Name
    Count Number Row Data

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

First Row Should Contains Display Name
    Element Text Should Be    name-Cherprang    Cherprang

Count Number Row Data
    0 = | Get Matching Xpath Count | //div[@id='member_table']

