*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://practice.automationtesting.in/
${BROWSER}       chrome

*** Test Cases ***
Verify Sale Product Prices
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click On Shop Menu
    Click On Sale Product
    Verify Sale Price Is Displayed
    Verify Old Price Is Struck Through
    Close Browser

*** Keywords ***
Click On Shop Menu
    Click Element    xpath=//a[text()="Shop"]

Click On Sale Product

    Click Element    xpath=//*[@class="onsale"]

Verify Sale Price Is Displayed

    Page Should Contain Element    xpath=//*[@class="woocommerce-Price-amount amount" and text()="450.00"]

Verify Old Price Is Struck Through

    Page Should Contain Element    xpath=//*[@class="woocommerce-Price-amount amount" and text()="600.00"]
