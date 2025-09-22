*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGOUT_BUTTON}    (//nav[contains(@class,'Navbar_navbar')]//button)[last()]

*** Keywords ***
Logout From Application
    Click Element    ${LOGOUT_BUTTON}
    Sleep    2s
    Close Browser
