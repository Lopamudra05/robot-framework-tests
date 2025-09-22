*** Settings ***
Library    SeleniumLibrary
Resource    Logoutpage.robot

*** Variables ***
${SETTINGS_LINK}    //button[.//*[name()='svg']//*[name()='path' and contains(@d,'M19.14 12.')]]
${SETTINGS_PAGE_HEADER}    //div[@class='styles_container__F__Ws']

*** Keywords ***
Navigate To Settings Page
    [Documentation]    This keyword navigates to the Settings page from the Dashboard.
    Wait Until Element Is Visible    ${SETTINGS_LINK}    30s
    Click Element    ${SETTINGS_LINK}
    Sleep   3s
    Wait Until Element Is Visible    ${SETTINGS_PAGE_HEADER}    30s
    Element Should Be Visible    ${SETTINGS_PAGE_HEADER}
    Sleep   3s
    # Add more steps to verify settings page features as needed.
    # Logout From Application
    # Close Browser





