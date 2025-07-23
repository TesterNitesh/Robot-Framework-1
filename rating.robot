*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://practice.automationtesting.in/
${BROWSER}       chrome

*** Test Cases ***
Sort Products By Popularity
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click On Shop Menu
    Sort By Popularity
    Verify Products Are Sorted By Popularity
    Close Browser

*** Keywords ***
Click On Shop Menu
    Click Element    xpath=//a[text()="Shop"]

Sort By Popularity

    Select From List By Value    xpath=//select[@name='orderby']    rating

Verify Products Are Sorted By Popularity

    Page Should Contain    Product

