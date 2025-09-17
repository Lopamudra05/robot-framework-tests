*** settings ***
Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/Helppage.robot
Suite Setup   Suite Setup

*** Test Cases ***
Verify Help Page Functionality
    [Documentation]    Verify user can navigate to Help Page
    Navigate To Help Page
    #Access Documentation Section
    #Access Support Resource