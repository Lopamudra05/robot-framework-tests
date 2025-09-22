*** settings ***
Library    SeleniumLibrary


*** Variables ***
${HOME_PAGE_LINK}        //div[contains(@class,"Navbar_linkContainer_")][2]
${NEW_CHAT_BUTTON}      //button[normalize-space()='New chat']
${SEARCH_BAR}       //textarea[@placeholder="Press Cmd+K (Ctrl+K) to focus and ask JENAE your question"]
${CLEAR_ALL_CHATS_BTN}      //button[normalize-space()='Clear all chats']
${AI_SEARCH_BTN}        //div[normalize-space()='AI Search']
${MICRO_PHONE_ARROW}        (//button[contains(@class,'page_microPhone')]//*[name()='svg'])[2]
${ANSWER_CONTENT_SUMMARY}        //div[contains(@class,"AnswerContent_summary")]
${ANSWER_CONTENT_CONTAINER}        //div[contains(@class,"AnswerContent_addonContainer")]
${BTN_TODAY}          //button[normalize-space()='Today']
${BTN_THIS_WEEK}     //button[normalize-space()='This Week']
${BTN_LAST_WEEK}     //button[normalize-space()='Last Week']
${BTN_OLDER}         //button[normalize-space()='Older']


*** Keywords ***
Go To Home And Start New Chat
    [Arguments]    ${search_text}
    Click Element    ${HOME_PAGE_LINK}
    Wait Until Element Is Visible    ${NEW_CHAT_BUTTON}    30s
    Click Element    ${NEW_CHAT_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_BAR}    20s
    Sleep   3s 
    Input Text    ${SEARCH_BAR}    ${search_text}
    Sleep   3s 
    Click Element    ${MICRO_PHONE_ARROW}
    Sleep   3s 
    Wait Until Element Is Visible    ${ANSWER_CONTENT_SUMMARY}    90s
    ${summary_text}=    Get Text    ${ANSWER_CONTENT_SUMMARY}
    Sleep   9s
    Log    Answer content summary: ${summary_text}
    Click Element  ${BTN_TODAY}              #new btn 
    Wait Until Element Is Visible    ${BTN_TODAY}    20s
    Sleep   3s
    scroll Element Into View    ${BTN_THIS_WEEK}
    Click Element  ${BTN_THIS_WEEK}      #new btn
    Wait Until Element Is Visible    ${BTN_THIS_WEEK}    20s
    Sleep   3s
    scroll Element Into View    ${BTN_LAST_WEEK}
    Click Element  ${BTN_LAST_WEEK}      #new btn
    Wait Until Element Is Visible    ${BTN_LAST_WEEK}    20s
    Sleep   3s
    scroll Element Into View    ${BTN_OLDER}
    Click Element  ${BTN_OLDER}      #new btn
    Wait Until Element Is Visible    ${BTN_OLDER}    20s
    Sleep   3s
    
    





