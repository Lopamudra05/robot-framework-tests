*** settings ***
Library    SeleniumLibrary



*** Variables ***
${AGENTS_LINK}      //nav[contains(@class,'Navbar_navbar__')]//div[3]//button[1]
${Create_agent_button}      //button[normalize-space()='Create Agent']
${Add_instructions_button}      //button[normalize-space()='Add Instructions']
${add_agent_context_input}  //textarea[@placeholder="Enter your context here"]
${Add_context_button}      //textarea[@placeholder='Enter your context here']
${Instruction1_input}  (//textarea[@placeholder='Enter your question here'])[1]
${Instruction2_input}  (//textarea[@placeholder='Enter your question here'])[2]
${Instruction3_input}  (//textarea[@placeholder='Enter your question here'])[3]
${Instruction_arrow_button}  (//textarea[@placeholder='Enter your question here'])[3]/../../following-sibling::button
${ANSWER_CONTENT_SUMMARY}        //div[contains(@class,"AnswerContent_summary")]
${Save_agent_button}     //button[normalize-space()='Save Agent']
${Enter_agent_name_input}       //input[@placeholder="Enter Agent name"]
${Enter_timehorizon_input}      //p[text()='Time Horizon']/../div/div[1]
${Enter_support_input}      //p[text()='Support']/../div/div[1]
${Save_button}     //button[normalize-space()='Save']   


*** Keywords *** 
Navigate To Agents Page
    [Documentation]    This keyword navigates to the Agents page from the Dashboard.
    Wait Until Element Is Visible    ${AGENTS_LINK}    30s
    Click Element    ${AGENTS_LINK}
    Sleep   3s
    Wait Until Element Is Visible    ${Create_agent_button}    30s
    Sleep   3s
    
Create New Agent
    [Documentation]    This keyworElement Should Be Visible    ${Create_agent_button}d clicks on the Create Agent button to start creating a new agent
    Click Element    ${Create_agent_button}
    Wait Until Element Is Visible    ${Add_instructions_button}    20s
    Element Should Be Visible    ${Add_instructions_button}
    Click Element    ${Add_instructions_button}
    Wait Until Element Is Visible    ${Add_context_button}    20s
    Element Should Be Visible    ${Add_context_button}

Add Context
    [Documentation]    This keyword adds context to the agent being created.
    Input Text    ${Add_context_button}    This is the context for testing purpose.

Add Instruction1
    [Arguments]    ${instructions}
    Wait Until Element Is Visible    ${Instruction1_input}    5s
    Input Text    ${Instruction1_input}     ${instructions}


Add Instruction2
    [Arguments]    ${instructions}
    Wait Until Element Is Visible    ${Add_instructions_button}    20s
    Click Element    ${Add_instructions_button}
    Wait Until Element Is Visible    ${Instruction2_input}    5s
    Input Text    ${Instruction2_input}     ${instructions}
    Sleep   3s

Add Instruction3
    [Arguments]    ${instructions}
    Wait Until Element Is Visible    ${Add_instructions_button}    20s
    Click Element    ${Add_instructions_button}
    Wait Until Element Is Visible    ${Instruction3_input}    5s
    Input Text    ${Instruction3_input}     ${instructions}
    Sleep   3s

Submit Instructions
    Wait Until Element Is Visible    ${Add_instructions_button}    5s
    Click Element    ${Instruction_arrow_button}
    Sleep   3s
    Wait Until Element Is Visible    ${ANSWER_CONTENT_SUMMARY}    120s
    Element Should Be Visible    ${Add_instructions_button}

Save Agent
    [Arguments]    ${agent_name}
    [Documentation]    This keyword saves the created agent with the provided details.
    Click Element    ${Save_agent_button}
    Sleep   3s
    Wait Until Element Is Visible    ${Enter_agent_name_input}    5s
    Input Text    ${Enter_agent_name_input}    ${agent_name}
    Click Element    ${Enter_timehorizon_input}
    Sleep   3s
    Click Element    ${Enter_support_input}
    Wait Until Element Is Visible    ${Save_button}    5s
    Click Element    ${Save_button}

