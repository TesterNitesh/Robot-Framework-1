*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://practice.automationtesting.in/
${BROWSER}       chrome

*** Test Cases ***
View Specific Product
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click On Shop Menu
    Click On Any Product Link
    Verify Product Page
    Close Browser

*** Keywords ***
Click On Shop Menu
    Click Element    xpath=//a[text()="Shop"]

Click On Any Product Link
    Click Element    xpath=//*[@title="Android Quick Start Guide"]

Verify Product Page

    Title Should Be   Android Quick Start Guide – Automation Practice Site

