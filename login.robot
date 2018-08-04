*** Settings ***
Library    Selenium2Library
Suite Teardown    Close All Browsers
Resource          settings.robot
# Test Setup        Go To Page Login

*** Test Cases ***
Valid Login
    Given Go To Page Login
    When Login With Authorize User
    Then Go To Page Member Page

Cannot Login When User Has No Authorize
    Given Go To Page Login
    When Login With No Authorize User
    Then Should Show Error Message

Username Or Password Are Blank
    [Documentation]    Login Button Should Disable When User Or Password Are Blank
    [Template]      Input blank username or blank password then login button should be disabled
    phatpan       ${EMPTY}
    ${EMPTY}      12345

Username And Password Are Not Blank
    [Documentation]    Login Button Should Enable When User And Password Are Not Blank
    Given Go To Page Login
    Input Username And Password    phatpan    1234
    Login button should be enabled

Autofocus Username Input
    Given Go To Page Login
    When Username input should be focus

*** Keywords ***
Username input should be focus
    Element Should Be Focused    username

Go To Page Login
    Open Browser    ${URL}    ${BROWSER_DRIVER}

Login With Authorize User
    Input text     username     demo
    Input text     password   1234
    Click Login Button

Login With No Authorize User
    Input text     username     phatpan
    Input text     password   1234
    Click Login Button

Should Show Error Message
    Wait Until Element Is Visible    error-message    
    Wait Until Page Contains   authorization failed

Go To Page Member Page
    Wait Until Page Contains   Member

Click Login Button
    Click Button    login-button

Input blank username or blank password then login button should be disabled
    [Arguments]                    ${username}    ${password}
    Go To Page Login
    Input Username And Password    ${username}    ${password}
    Login button should be disabled

Login button should be disabled
    Element Should Be Disabled    login-button

Login button should be enabled
    Element Should Be Enabled    login-button

Input Username And Password
    [Arguments]    ${username}    ${password}
    Input Text    username       ${username}
    Input Text    password       ${password}
    #   Click Element          username
