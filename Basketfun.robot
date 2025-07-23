*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://practice.automationtesting.in/
${BROWSER}       chrome

*** Test Cases ***
Place Order Successfully
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click On Shop Menu
    Add Book To Basket
    Verify Book Is Added To Basket
    Click On View Basket
    Verify TotalAndSubtotalAreCorrect
    Click On Proceed To Checkout
    Fill In Billing Details And Choose Payment Method
    Click On Place Order
    Verify Order Confirmation Page
    Close Browser

*** Keywords ***

Click On Shop Menu
    Click Element    xpath=//a[text()="Shop"]

Add Book To Basket
    Click Element    xpath=//*[text()="Functional Programming in JS"]
    Click Element    xpath=//*[text()="Add to basket"]

Verify Book Is Added To Basket
    sleep   7s
    Wait Until Page Contains Element    xpath=//div[text()=" “Functional Programming in JS” has been added to your basket."]
    Page Should Contain      “Functional Programming in JS” has been added to your basket.

Click On View Basket
    Click Element    xpath=//a[text()="View Basket"]

Verify TotalAndSubtotalAreCorrect

    ${subtotal} =    Get Text    xpath=//tr[@class="cart-subtotal"]//span[@class="woocommerce-Price-amount amount"]
    ${total} =    Get Text    xpath=//*[@class="order-total"]//span[@class="woocommerce-Price-amount amount"]
    ${subtotal_clean} =    Evaluate   '${subtotal}'.replace("₹", "").replace(",", "")
    ${total_clean} =    Evaluate   '${total}'.replace("₹", "").replace(",", "")
#    ${subtotal_Integer} =    Convert To Integer    ${subtotal_clean}
#    ${total_Interger} =    Convert To Integer    ${total_clean}
     Run Keyword if   '${total_clean}' > '${subtotal_clean}'     Log   Total is grater than SubToyal because Tax is Added

Click On Proceed To Checkout
    Click Element    xpath=//a[@class="checkout-button button alt wc-forward"]

Fill In Billing Details And Choose Payment Method

    Input Text    xpath=//input[@id='billing_first_name']    abc
    Input Text    xpath=//input[@id='billing_last_name']    xyz
    Input Text    xpath=//input[@id='billing_address_1']    123 Main St
    Input Text    xpath=//input[@id='billing_city']    Banglore
    Input Text    xpath=//input[@id='billing_postcode']    10001
    Input Text    xpath=//input[@id='billing_phone']    9876543210
    Input Text    xpath=//input[@id='billing_email']    abc.xyz@example.com


    Click Element    xpath=//*[@id="payment_method_cod"]

Click On Place Order
    Click Element    xpath=//*[@id='place_order']

Verify Order Confirmation Page
    Sleep    5s
    Page Should Contain Element    xpath=//*[text()="Thank you. Your order has been received."]
#  Page Should Contain Element  xpath=//*[text()="Order Details"]
