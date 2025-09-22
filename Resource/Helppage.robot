*** settings ***
Library    SeleniumLibrary

Resource    Logoutpage.robot


*** Variables ***
${HELP_LINK}      //nav[contains(@class,'Navbar_navbar__')]//div[6]//button[1]    
${HELP_CENTER_TEXT}      //h1[normalize-space()='Help Center']
${VIEW_GUIDE_BUTTON}      //a[@class='help_link__9yMfB']

*** Keywords ***
Navigate To Help Page
    [Documentation]    This keyword navigates to the Help page from the Dashboard.
    Wait Until Element Is Visible    ${HELP_LINK}    30s
    Click Element    ${HELP_LINK}
    Sleep   3s
    Wait Until Element Is Visible    ${HELP_CENTER_TEXT}    30s
    Element Should Be Visible    ${HELP_CENTER_TEXT}
    Wait Until Element Is Visible    ${VIEW_GUIDE_BUTTON}    30s
    Element Should Be Visible    ${VIEW_GUIDE_BUTTON}
    Click Element    ${VIEW_GUIDE_BUTTON}
    Sleep   10s
    # Switch to the new tab
    Switch Window    NEW
    Sleep   5s
    # Add more steps to verify help page features as needed.

    