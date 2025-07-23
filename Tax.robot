*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    http://practice.automationtesting.in/
${BROWSER}    chrome
${BOOK_TITLE}    “Functional Programming in JS”
${TAX_RATE_INDIA}    0.02
${TAX_RATE_ABROAD}    0.05

*** Test Cases ***
Add Book To Basket And Proceed To Checkout
    Open Browser     ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Shop Menu
    Add Book To Basket
    View Basket Item With Price
    Verify Subtotal And Total With Tax
    Close Browser

*** Keywords ***

Click Shop Menu
    Click Element     xpath=//a[text()="Shop"]

Add Book To Basket
    Click Element    xpath=//*[text()="Functional Programming in JS"]
    Click Element    xpath=//*[text()="Add to basket"]

View Basket Item With Price
    sleep   5s
    Wait Until Page Contains Element    xpath=//*[text()=" “Functional Programming in JS” has been added to your basket."]
    Page Should Contain      “Functional Programming in JS” has been added to your basket.
    Click Element    xpath=//a[text()="View Basket"]
    ${book_price}=    Get Text    xpath=//td[@class='product-price']//span[@class="woocommerce-Price-currencySymbol"]
    Log    Book Price: ${book_price}

Verify Subtotal And Total With Tax
    #sleep   5
    Wait Until Element Is Visible    xpath=//*[@class='shop_table shop_table_responsive']
    ${subtotal}=    Get Text    xpath=//*[@class='cart-subtotal']//span[@class='woocommerce-Price-amount amount']
    ${total}=    Get Text    xpath=//tr[@class="order-total"]//span[@class="woocommerce-Price-amount amount"]

    Log    Subtotal: ${subtotal}
    Log    Total: ${total}


    ${subtotal_float}=    Convert To Integer    ${subtotal}
    ${total_float}=    Convert To Integer    ${total}


    ${tax_amount}=    Calculate Tax    ${subtotal_float}

    Should Be True    ${total_float} > ${subtotal_float}    The total should always be greater than the subtotal due to taxes.
    Should Be Equal As Numbers    ${total_float}    ${subtotal_float} + ${tax_amount}    The total should match the calculated subtotal + tax.

Calculate Tax

    ${country}    Get Country
    Run Keyword If    '${country}' == 'India'    ${tax}=    Set Variable    ${subtotal} * ${TAX_RATE_INDIA}
    Run Keyword If    '${country}' != 'India'    ${tax}=    Set Variable    ${subtotal} * ${TAX_RATE_ABROAD}

Get Country

    ${country}    Set Variable    India

