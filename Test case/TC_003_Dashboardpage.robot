*** settings ***
Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/Dashboardpage.robot
Test Setup   Suite Setup
Test Teardown   Suite Teardown


*** Test cases ***
Verify Dashboard Alerts Functionality
    Verify And Interact With Alerts
