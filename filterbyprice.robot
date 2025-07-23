*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://practice.automationtesting.in/
${FILTER_MIN}  150
${FILTER_MAX}  450

*** Test Cases ***
Filter Books By Price Between 150 to 450 RPS
    Open Browser  ${URL}  Chrome
    Maximize Browser Window
    Click On Shop Menu
    Set Price Filter
    Click Filter Button
    Verify Books In Price Range

*** Keywords ***
Click On Shop Menu
    Click Element  xpath=//a[text()="Shop"]

Set Price Filter

   Click Element     xpath=//*[@class="ui-slider-handle ui-corner-all ui-state-default" and @style="left: 0%;" ]
   Click Element   xpath=//*[@class="ui-slider-handle ui-corner-all ui-state-default" and @style="left: 85.4286%;" ]

Click Filter Button
    Click Element  xpath=//button[text()='button']

Verify Books In Price Range
   Page Should Contain Element   ${verify}= xpath=//span[@class='price']

   Run Keyword If    ${FILTER_MIN} < ${verify} > ${FILTER_MAX}     Log    Pass
    ...    ELSE    Log    Fail

