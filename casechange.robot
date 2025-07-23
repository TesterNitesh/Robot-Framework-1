*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             http://practice.automationtesting.in/
${BROWSER}         chrome
${USERNAME}        RAVANMAHARAJ979@gmail.com
${PASSWORD}        RAVANMAHARAJ@979

*** Test Cases ***
Login Test Case

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click My Account Menu
    Enter Credentials
    Click Login Button
    Verify Successful Login
    Close Browser

*** Keywords ***
Click My Account Menu

    Click Link    xpath=//a[text()='My Account']

Enter Credentials

    Input Text    xpath=//*[@id='username']    ${USERNAME}
    Input Text    xpath=//*[@id='password']    ${PASSWORD}

Click Login Button

    Click Button    xpath=//*[@name='login']

Verify Successful Login
    set selenium speed  5s
    Wait Until Page Contains Element     xpath=//*[text()=" The password you entered for the username "]
    Page Should Contain Element       xpath=//*[text()=" The password you entered for the username "]

