*** settings ***
Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/Helppage.robot
Test Setup   Suite Setup
Test Teardown   Suite Teardown
Resource    ../Resource/Settingspage.robot

*** Test Cases ***

Verify Settings Page Functionality
    [Documentation]    Verify user can navigate to Settings Page and access settings options.
    Navigate To Settings Page
    # Add more steps to verify settings page features as needed.
    # Logout From Application




