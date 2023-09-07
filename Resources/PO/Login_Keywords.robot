*** Settings ***
Library     SeleniumLibrary

Resource    ../common.robot
Resource    SignUp_Keyword.robot
Resource
*** Variables ***
${Email_xpath}             //*[@id="email"]/input
${Password_xpath}          //*[@id="password"]/input
${Login_btn_xpath}         //*[@id="root"]/div/div/div/div[1]/div/form/button
${Home_Page_assertion}     //div[@data-testid="inbox-action"]
*** Keywords ***
Login
    [Arguments]      ${Email}       ${Password}
    Input Text       ${Email_xpath}              ${Email}
    Input Text       ${Password_xpath}           ${Password}
    Click on         ${Login_btn_xpath}

GO TO Login
    Go To    https://utasks-buggy.web.app/login

Successfull sign up and Login
    GO TO Sign Up
    ${email}    ${pass}    Successfull Sigun Up
    Set Selenium Implicit Wait    3
    Login       ${email}    ${pass}
    Sleep    2
    Element Should Be Visible    ${Home_Page_assertion}