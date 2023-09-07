# robot   -d Results  -i    SignUp      Tests
# robot   -d Results  -i    Negative      Tests
# robot   -d Results  -i    Happy      Tests
*** Settings ***


Resource    ../Resources/common.robot
Resource    ../Resources/PO/SignUp_Keyword.robot
Library    String
Test Teardown       Close Browser
*** Variables ***
${SignUp Button}        //button[@type="submit"]
${Valid_Company_Name}   Company Test
${Valid_Job_title}      Tester
${Valid_Pass}      123456
${Valid_confirm_password}      123456
${invalid_password}      12345
${Email_locator}             (//input[@class="form-control"])[4]
${Login_card_locator}         //button[@data-testid="loginbtn"]
*** Test Cases ***
Sign up with valid data
   [Tags]  SignUp   Happy
   Open_The_Browser
   GO TO Sign Up
   ${Valid_Username}    Generate Random String       5       [LETTERS]
   ${Valid_Email}    Generate Random String      5       [LETTERS]
   ${Valid_Email}   Set Variable    ${Valid_Email}@utasks.com
   Sign up     ${Valid_Username}   ${Valid_Job_title}  ${Valid_Company_Name}    ${Valid_Email}  ${Valid_Pass}     ${Valid_confirm_password}
   Click on     ${SignUp Button}
   Page Should Contain    Log In
   Sleep    3

Sign up with leaving Mandatory fields
   [Tags]  SignUp   Negative
   Open_The_Browser
   GO TO Sign Up
   Sign up     ${EMPTY}   ${Valid_Job_title}  ${Valid_Company_Name}    ${EMPTY}  ${EMPTY}    ${EMPTY}
   Click on     ${SignUp Button}
   Element Should Not Be Visible    ${Login_card_locator}

Sign up with leave optional fields empty
   [Tags]  SignUp   Happy
   Open_The_Browser
   GO TO Sign Up
   ${Valid_Username}    Generate Random String       5       [LETTERS]
   ${Valid_Email}    Generate Random String      5       [LETTERS]
   ${Valid_Email}   Set Variable    ${Valid_Email}@utasks.com
   Sign up     ${Valid_Username}   ${EMPTY}  ${EMPTY}    ${Valid_Email}  ${Valid_Pass}     ${Valid_confirm_password}
   Click on     ${SignUp Button}
   Page Should Contain    Log In
   Sleep    3

Sign up with password mismatch confirm password
   [Tags]  SignUp   Negative
   Open_The_Browser
   GO TO Sign Up
   ${Valid_Username}    Generate Random String       5       [LETTERS]
   ${Valid_Email}    Generate Random String      5       [LETTERS]
   ${Valid_Email}   Set Variable    ${Valid_Email}@utasks.com
   Sign up     ${Valid_Username}   ${Valid_Job_title}  ${Valid_Company_Name}    ${Valid_Email}  ${Valid_Pass}   ${invalid_password}
   Click on     ${SignUp Button}
   Page Should Contain    Passwords do not match
   Sleep    3

Sign up with an invalid email address
   [Tags]  SignUp   Negative
   Open_The_Browser
   GO TO Sign Up
   ${Valid_Username}    Generate Random String       5       [LETTERS]
   ${Valid_Email}    Generate Random String      5       [LETTERS]
   Sign up     ${Valid_Username}   ${Valid_Job_title}  ${Valid_Company_Name}    ${Valid_Email}  ${Valid_Pass}   ${Valid_confirm_password}
   Click on     ${SignUp Button}
   Element Should Not Be Visible    ${Login_card_locator}
   Page Should Contain    Sign Up
   Sleep    3

Sign up with email already exists
   [Tags]  SignUp   Negative
   Open_The_Browser
   GO TO Sign Up
   ${Valid_Username}    Generate Random String       5       [LETTERS]
   ${Valid_Email}    Generate Random String      5       [LETTERS]
   ${Valid_Email}   Set Variable    ${Valid_Email}@utasks.com
   Sign up     ${Valid_Username}   ${Valid_Job_title}  ${Valid_Company_Name}    ${Valid_Email}  ${Valid_Pass}   ${Valid_confirm_password}
   Click on     ${SignUp Button}
   Sleep    5
   GO TO Sign Up again
   Sign up     ${Valid_Username}   ${Valid_Job_title}  ${Valid_Company_Name}    ${Valid_Email}  ${Valid_Pass}   ${Valid_confirm_password}
   Click on     ${SignUp Button}
   Page Should Contain    Failed to create an account
   Sleep    5

Sign up with Password less than minimum length 6 characters
   [Tags]  SignUp   Negative    empty
   Open_The_Browser
   GO TO Sign Up
   ${Valid_Username}    Generate Random String       5       [LETTERS]
   ${Valid_Email}    Generate Random String      5       [LETTERS]
   ${Valid_Email}   Set Variable    ${Valid_Email}@utasks.com
   Sign up     ${Valid_Username}   ${Valid_Job_title}  ${Valid_Company_Name}    ${Valid_Email}  ${invalid_password}   ${invalid_password}
   Click on     ${SignUp Button}
   Page Should Contain    Failed to create an account
   Sleep    3

