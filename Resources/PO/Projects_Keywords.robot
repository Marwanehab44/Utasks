*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../common.robot

Resource
*** Variables ***
${name_project_input_field}      //input[@class="add-project__name"]
${Project}       project
${Project_submit_btn}              //*[@id="root"]/div/main/section/div[1]/div[2]/div/button
${Add_project_btn}      //*[@id="root"]/div/main/section/div[1]/div[2]/span[2]
${tasks_text_btn}      //span[@class="add-task__text"]
${tasks_input_field}    //input[@class="add-task__content"]
${Added_Project_locator}        (//div[@data-testid="project-action"])[1]
${2nd_Project_list}              (//div[@data-testid="project-action"])[2]
##########################################################################################################################
${date_picker_btn}           //span[@class="add-task__date"]
${today_date}                //div[@data-testid="task-date-today"]
${tomorrow_date}             //div[@data-testid="task-date-tomorrow"]
${nxt_week_date}             //div[@data-testid="task-date-next-week"]
#########################################################################################################################
${Submit_task_btn}           //button[@class="add-task__submit"]
${Cancel_task_btn}           //span[@class="add-task__cancel"]
#######################################################################################################################
${Today_tab}               //div[@data-testid="today-action"]
${Nxt_week_tab}            //div[@data-testid="next_7-action"]
#######################################################################################################################
${task in list}           //*[@id="root"]/div/main/section/div[2]/ul/li/span
${Quick_task_button}     //button[@data-testid="quick-add-task-action"]
${Task_content}          //input[@class="add-task__content"]
${Task_to_project}       //span[@class="add-task__project"]
${2nd_project}            (//div[@data-testid="project-overlay-action"])[2]
*** Keywords ***
Add name to the project
    ${Random_num}    Generate Random String      3        [NUMBERS]
    ${Project_name}       Set Variable          ${Project}${Random_num}
    Input Text    ${name_project_input_field}           ${Project_name}
    [Return]     ${Project_name}


Click on Add project text
    Click on    ${Add_project_btn}

Click on add Project to Submit Button
        Click on    ${Project_submit_btn}

Click on Add Task text
    Click on    ${tasks_text_btn}

Click on added project
    Click on    ${Added_Project_locator}

Get the project name from home page
    ${name}     Get Text    //h2[@data-testid="project-name"]
    [Return]    ${name}

Successfull Add new project
    Click on Add project text
    ${Pro_name_from_list}     Add name to the project
    Click on add Project to Submit Button
    Click on added project
    ${name_from_home}       Get the project name from home page
    Should Be Equal As Strings    ${Pro_name_from_list}         ${name_from_home}
    Sleep    2

Enter Task Name
    ${Tasks_name}   Generate Random String      6        [LETTERS]
    Input Text    ${tasks_input_field}    ${Tasks_name}

Click on date picker
    Click on    ${date_picker_btn}

Click on Today date
    Click on    ${today_date}

Click on Toworrow date
    Click on    ${tomorrow_date}

Click on Next week date
    Click on    ${nxt_week_date}

Click on Add task button to Submit
    Click on    ${Submit_task_btn}

Click on Cancel task button
    Click on    ${Cancel_task_btn}

Click on Today Tab
    Click on    ${Today_tab}


Click on Nextweek Tab
    Click on    ${Nxt_week_tab}

Task should be exist
    Element Should Be Visible    ${task in list}

Click on Add Quick task
    Click on    ${Quick_task_button}

Enter the task content
    ${Tasks_name}   Generate Random String      6        [LETTERS]
    Input Text    ${tasks_input_field}    ${Tasks_name}

Select the 2nd Project name
       Click on    ${Task_to_project}
       Click on    ${2nd_project}

Add another project
    Click on Add project text
    Add name to the project
    Click on add Project to Submit Button
    Sleep    2

Assert that the task is added to the 2nd project
    Click on    ${2nd_Project_list}


