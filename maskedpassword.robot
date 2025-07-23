*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             http://practice.automationtesting.in/
${BROWSER}         chrome
${USERNAME}        ravanmaharaj979@gmail.com
${PASSWORD}        ravanmaharaj@979

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
    ${password_field_type}=    Get Element Attribute    xpath=//input[@id='password']    type
    Should Be Equal As Strings    ${password_field_type}    password

Click Login Button

    Click Button    xpath=//*[@name='login']

Verify Successful Login

    Element Should Contain    xpath=//*[text()='Dashboard']     Dashboard
