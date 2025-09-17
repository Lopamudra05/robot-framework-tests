*** settings *** 

Library    SeleniumLibrary
Resource    ../Resource/comonpage.robot
Resource    ../Resource/Agentspage.robot
Suite Setup   Suite Setup


*** Test Cases *** 
Verify Agents Page Functionality
    [Documentation]    Verify user can navigate from Home Page to Agents Page
    Navigate To Agents Page
    Create New Agent
    Add Context
    Add Instruction1    What is the weekly crystal ball EDI for the <ORGANIZATION> <PRODUCT> carline for the <DURATION> in the latest release?
    Add Instruction2    What is the weekly crystal ball EDI for the Rivian R1 carline for the next 3 months in the latest release?
    Add Instruction3    What is the weekly crystal ball EDI for the model 3 H LV carline for the next 2 months in the latest release?
    Submit Instructions
    Save Agent    Tesla Release Test
