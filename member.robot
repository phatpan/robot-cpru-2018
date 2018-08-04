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

# Display Data Member In Table
#     Display Member Page
#     Count Number Row Data

Display First Row Data When Click Action Edit
    Display Member Page
    Wait Until Page Contains   cherprang.bnk48official
    Click Element    edit_member_0
    Wait Until Page Contains   Edit Member
    Wait Until Page Contains   Instagram Id :
    Element Should Be Visible    name-member
    Textfield Value Should Be    name-member    Cherprang
    
*** Keywords ***
Go To Login Page
    Open Browser    ${URL}    ${BROWSER_DRIVER}

Display Member Page
    Wait Until Page Contains   Member

Fill In Username
    Input text     username     kae

Fill In Password
    Input text     password   1234

Click Login Button
    Click Button    login-button

First Row Should Contains Display Name
    Element Should Contain    name-0    Cherprang

Count Number Row Data
    ${count} =	Get Element Count	name:member_tr
    Should Be True	${count} = 14

