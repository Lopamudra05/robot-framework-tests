*** Settings ***
Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/SchedulePage.robot
Test Setup   Suite Setup
Test Teardown   Suite Teardown

*** Test Cases ***
Verify Schedule Creation With Tesla Agent
    [Documentation]    Test to verify schedule creation with Tesla Agent for daily frequency.
    Click Create Schedule Button
    Select Tesla Agent
    Select Daily Frequency
    Set Date And Time
    Click Element    ${EDIT_PARAMETERS}
    Set Parameters      Tesla    2025    2022
    Click Element    ${PROCEED_BTN}
    Save Schedule
    # Verification Step
    Wait Until Page Contains    Tesla orders has been scheduled successfully for daily execution.    timeout=20s
