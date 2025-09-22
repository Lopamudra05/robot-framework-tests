*** settings ***
Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/Homepage.robot
Test Setup   Suite Setup
Test Teardown   Suite Teardown

*** Test Cases ***
Start New Chat And Validate Answer
    #Go To Home And Start New Chat    What was the weekly order volumes for Tesla in 2022 and 2025?
    Go To Home And Start New Chat    What is the Tesla supplywhy forecast at an 8 week lag for May 2025?