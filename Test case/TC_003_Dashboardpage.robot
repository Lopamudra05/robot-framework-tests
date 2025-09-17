*** settings ***
Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/Dashboardpage.robot
Suite Setup   Suite Setup


*** Test cases ***
Verify Dashboard Alerts Functionality
    Verify And Interact With Alerts
