*** settings ***
Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/Helppage.robot
Test Setup   Suite Setup
Test Teardown   Suite Teardown

*** Test Cases ***
Verify Help Page Functionality
    [Documentation]    Verify user can navigate to Help Page
    Navigate To Help Page
    #Access Documentation Section
    #Access Support Resource