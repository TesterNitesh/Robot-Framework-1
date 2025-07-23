*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             http://practice.automationtesting.in/
${BROWSER}         chrome
${USERNAME}        vwxyz979@gmail.com
${PASSWORD}        vwxyz@979

*** Test Cases ***
Login Test Case

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click My Account Menu
    Enter Credentials
    Click Login Button
    Verify UnSuccessful Login
    Close Browser

*** Keywords ***
Click My Account Menu

    Click Link    xpath=//a[text()='My Account']

Enter Credentials

    Input Text    xpath=//*[@id='username']    ${USERNAME}
    Input Text    xpath=//*[@id='password']    ${PASSWORD}

Click Login Button

    Click Button    xpath=//*[@name='login']

Verify UnSuccessful Login
    set selenium speed  5s
    Wait Until Page Contains Element     xpath=//ul[@class="woocommerce-error"]
    Page Should Contain Element       xpath=//ul[@class="woocommerce-error"]
