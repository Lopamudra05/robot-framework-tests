*** Settings ***
Library    SeleniumLibrary
Resource    ./loginpage.robot
Resource    ./Schedulepage.robot
*** Variables ***
${BROWSER}    Chrome
${URL}    https://dev.supplywhyai.net/



*** keywords ***
open ChromeBrowser
    Open Browser    ${URL}     ${BROWSER}
    Maximize Browser Window
Suite Setup
    Open ChromeBrowser
    Login to Application    ${username}    ${password}
    

