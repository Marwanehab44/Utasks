# robot   -d Results  -i    Happy      Tests
# robot   -d Results  -i    Project      Tests

*** Settings ***
Resource    ../Resources/PO/SignUp_Keyword.robot
Resource    ../Resources/PO/Login_Keywords.robot
Resource    ../Resources/PO/Projects_Keywords.robot

Test Teardown   Close Browser
*** Variables ***

*** Test Cases ***
Create a new Project without adding tasks
    [Tags]      Project     Happy
    Open_The_Browser
    Successfull sign up and Login
    Set Selenium Implicit Wait    2
    Click on Add project text
    ${Pro_name_from_list}     Add name to the project
    Click on add Project to Submit Button
    Click on added project
    ${name_from_home}       Get the project name from home page
    Should Be Equal As Strings    ${Pro_name_from_list}         ${name_from_home}
    Sleep    2


Create new project with new Task today
    [Tags]      Project     Happy
    Open_The_Browser
    Successfull sign up and Login
    Set Selenium Implicit Wait    2
    Successfull Add new project
    Sleep    2
    Click on Add Task text
    Set Selenium Implicit Wait    2
    Enter Task Name
    Set Selenium Implicit Wait    2
    Click on date picker
    Click on Today date
    Click on Add task button to Submit
    Sleep    2
    Click on Today Tab
    Set Selenium Implicit Wait    2
    Task should be exist
    Sleep    2

Create new project with new Task Tomorrow
    [Tags]      Project     Happy
    Open_The_Browser
    Successfull sign up and Login
    Set Selenium Implicit Wait    2
    Successfull Add new project
    Sleep    2
    Click on Add Task text
    Set Selenium Implicit Wait    2
    Enter Task Name
    Set Selenium Implicit Wait    2
    Click on date picker
    Click on Toworrow date
    Click on Add task button to Submit
    Sleep    2
    Click on Nextweek Tab
    Set Selenium Implicit Wait    2
    Task should be exist
    Sleep    2

Create new project with new Task Next week
    [Tags]      Project     Happy
    Open_The_Browser
    Successfull sign up and Login
    Set Selenium Implicit Wait    2
    Successfull Add new project
    Sleep    2
    Click on Add Task text
    Set Selenium Implicit Wait    2
    Enter Task Name
    Set Selenium Implicit Wait    2
    Click on date picker
    Click on Next week date
    Click on Add task button to Submit
    Sleep    2
    Click on Nextweek Tab
    Set Selenium Implicit Wait    2
    Task should be exist
    Sleep    2

Verify the cancel button in Add task is working correctly
    [Tags]      Project     Happy
    Open_The_Browser
    Successfull sign up and Login
    Set Selenium Implicit Wait    2
    Successfull Add new project
    Sleep    2
    Click on Add Task text
    Set Selenium Implicit Wait    2
    Enter Task Name
    Set Selenium Implicit Wait    2
    Click on date picker
    Click on Next week date
    Click on Cancel task button
    Sleep    2

Add Quick Task without adding any Project
    [Tags]      Project     Happy
    Open_The_Browser
    Successfull sign up and Login
    Set Selenium Implicit Wait    2
    Click on Add Quick task
    Enter the task content
    Set Selenium Implicit Wait    2
    Click on date picker
    Click on Today date
    Click on Add task button to Submit
    Sleep    2
    Click on Today Tab
    Set Selenium Implicit Wait    2
    Task should be exist
    Sleep    2


Add a task in a second project
    [Tags]      Project     Happy
    Open_The_Browser
    Successfull sign up and Login
    Set Selenium Implicit Wait    2
    Successfull Add new project
    Add another project
    Sleep    2
    Click on Add Task text
    Set Selenium Implicit Wait    2
    Enter Task Name
    Set Selenium Implicit Wait    2
    Click on date picker
    Click on Today date
    Select the 2nd Project name
    Click on Add task button to Submit
    Sleep    2
    Assert that the task is added to the 2nd project
    Set Selenium Implicit Wait    2
    Task should be exist
    Sleep    2
