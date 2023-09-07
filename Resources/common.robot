*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${Website_URL}       https://utasks-buggy.web.app/login




*** Keywords ***
Open_The_Browser
    Open Browser    ${Website_URL}      gc
    Maximize Browser Window
    Set Selenium Implicit Wait    10

Click on
    [Arguments]  ${Button_Locator}
    Click Element    ${Button_Locator}

GO TO Sign Up
    Go To    https://utasks-buggy.web.app/signup