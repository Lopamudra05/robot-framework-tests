*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Google And Search
    Open Browser    https://www.google.com    Chrome
    Input Text    name:q    Robot Framework
    Press Keys    name:q    RETURN
    Sleep    2s
    Close All Browsers