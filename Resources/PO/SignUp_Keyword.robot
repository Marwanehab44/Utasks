*** Settings ***
Library     SeleniumLibrary
Library      String

Resource    ../common.robot
*** Variables ***
${Username_locator}          (//input[@class="form-control"])[1]
${Job_title_locator}         (//input[@class="form-control"])[2]
${Company_Name_locator}      (//input[@class="form-control"])[3]
${Email_locator}             (//input[@class="form-control"])[4]
${Password_locator}          (//input[@class="form-control"])[5]
${Confirm_Password_locator}  (//input[@class="form-control"])[6]
################################################################
${Valid_Company_Name}   Company Test
${Valid_Job_title}      Tester
${Valid_Pass}      123456
${Valid_confirm_password}      123456
${SignUp Button}        //button[@type="submit"]
*** Keywords ***
Sign up
    [Arguments]  ${Username}    ${Job_title}    ${Company_Name}  ${Email}   ${Password}     ${Confirm_Password}
    Input Text    ${Username_locator}           ${Username}
    Input Text    ${Job_title_locator}          ${Job_title}
    Input Text    ${Company_Name_locator}       ${Company_Name}
    Input Text    ${Email_locator}              ${Email}
    Input Text    ${Password_locator}           ${Password}
    Input Text    ${Confirm_Password_locator}   ${Confirm_Password}

GO TO Sign Up again
    Go To    https://utasks-buggy.web.app/signup

Successfull Sigun Up
   ${Valid_Username}    Generate Random String       5       [LETTERS]
   ${Valid_Email}    Generate Random String      5       [LETTERS]
   ${Valid_Email}   Set Variable    ${Valid_Email}@utasks.com
   Sign up     ${Valid_Username}   ${Valid_Job_title}  ${Valid_Company_Name}    ${Valid_Email}  ${Valid_Pass}     ${Valid_confirm_password}
   Click on     ${SignUp Button}
   Page Should Contain    Log In
   Sleep    2
   [Return]     ${Valid_Email}      ${Valid_Pass}