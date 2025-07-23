*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             http://practice.automationtesting.in/
${BROWSER}         chrome
${USERNAME}
${PASSWORD}

*** Test Cases ***
Login Test Case

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click My Account Menu
    Enter Credentials
    Click Login Button
    Verify Empty Login
    Close Browser

*** Keywords ***
Click My Account Menu

    Click Link    xpath=//a[text()='My Account']

Enter Credentials

    Input Text    xpath=//*[@id='username']    ${USERNAME}
    Input Text    xpath=//*[@id='password']    ${PASSWORD}

Click Login Button

    Click Button    xpath=//*[@name='login']

Verify Empty Login
    set selenium speed  2s
    Wait Until Page Contains Element     xpath=//*[text()=" Username is required."]
    Page Should Contain Element       xpath=//*[text()=" Username is required."]
