*** settings ***
Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/Homepage.robot
suite Setup   Suite Setup

*** Test Cases ***
Start New Chat And Validate Answer
    Go To Home And Start New Chat    What was the weekly order volumes for Tesla in 2022 and 2025?