*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://practice.automationtesting.in/
${BROWSER}       chrome

*** Test Cases ***
Check Out Of Stock Product
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click On Shop Menu
    Click On Read More For Out Of Stock Product
    Verify Product Is Out Of Stock
    Verify Cannot Add To Cart
    Close Browser

*** Keywords ***
Click On Shop Menu
    Click Element    xpath=//a[text()="Shop"]

Click On Read More For Out Of Stock Product

    Click Element    xpath=

Verify Product Is Out Of Stock

    Page Should Contain    Out of Stock

Verify Cannot Add To Cart

    Element Should Not Be Visible    xpath=

