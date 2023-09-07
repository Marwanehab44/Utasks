# robot   -d Results  -i    Happy      Tests
# robot   -d Results  -i    Login      Tests
*** Settings ***
Resource    ../Resources/PO/SignUp_Keyword.robot
Resource    ../Resources/PO/Login_Keywords.robot

Test Teardown   Close Browser
*** Variables ***
${invalid_email}    asdasdasd
${invalid_pass}     165
${Home_Page_assertion}           //*[@id="root"]/div/main/section/div[1]/ul[1]/li[1]/div
*** Test Cases ***
Login with a valid email and password
    [Tags]   Login   Happy
    Open_The_Browser
    GO TO Sign Up
    ${email}    ${pass}    Successfull Sigun Up
    Set Selenium Implicit Wait    3
    Login       ${email}    ${pass}
    Sleep    2
    Element Should Be Visible    ${Home_Page_assertion}

Login with an invalid email and password
    [Tags]   Login   Negative
    Open_The_Browser
    Login       ${invalid_email}    ${invalid_pass}
    Sleep    2
    Element Should Not Be Visible    ${Home_Page_assertion}

Login with a valid email and invalid password
    [Tags]   Login   Negative
    Open_The_Browser
    GO TO Sign Up
    ${email}    ${pass}    Successfull Sigun Up
    Set Selenium Implicit Wait    3
    Login       ${email}    ${invalid_pass}
    Sleep    2
    Page Should Contain    Failed to log in
    Element Should Not Be Visible    ${Home_Page_assertion}

Login with leaving email and password input fields empty
    [Tags]   Login   Negative
    Open_The_Browser
    Login       ${EMPTY}    ${EMPTY}
    Sleep    2
    Element Should Not Be Visible    ${Home_Page_assertion}

