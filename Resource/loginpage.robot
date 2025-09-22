*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${Username_textbox}    //input[@name="username"]
${password_textbox}    //input[@name="password"]
${login_button}    //button[@type="submit"]


#test data
${username}    lopamudra.mohanty@supplywhy.ai
${password}    Lopamudra@123654

*** keywords ***
Login to Application
    [Arguments]    ${username}    ${password}
    Input Text    ${Username_textbox}    ${username}
    Input Text    ${password_textbox}    ${password}
    Click Element    ${login_button}
    Sleep    10s


