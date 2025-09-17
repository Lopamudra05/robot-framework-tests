*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${welcome_text}        //h1[normalize-space()='Welcome back, Lopamudra!']
${last_updated}        //span[@class='page_lastUpdate__8Excj']
${Refresh}             //button[normalize-space()='Refresh']
${Alerts_section}      //span[normalize-space()='Alerts']
${Mark_as_read}        //span[normalize-space()='Marked as read']
${Mark_as_read_button}        (//button[text()='Mark as Read'])[1]
${ALERTS_COUNT}        (//span[@class='page_insightValue__heAev'])[1]
${MARKED_AS_READ_COUNT}     (//span[@class='page_insightValue__heAev'])[2]
${All_alerts_text}     //h2[normalize-space()='All Alerts']
${Sort_By_Date}        //button[normalize-space()='Sort by Date']
${Show_more_Link}      (//button[text()='Show More'])[1]
${Show_less_Link}      //button[text()='Show Less']
${All_alerts_header_text}       //div[contains(@class,'page_alertItem')]//h3
${all_date_text}    //div[contains(@class,'page_alertItem')]/div[2]/div[4]/span[2]
${NEW_CHAT_BUTTON}      //button[normalize-space()='New chat']
${VIEW_DETAILS_BTN}      (//button[text()='View Details'])[1]
${Frequency_text}       (//span[text()='Frequency'])[1]

*** Keywords ***
Verify And Interact With Alerts
    [Documentation]    This keyword verifies the presence of alert-related elements, interacts with them, and counts the total alerts.
    
    # Verify Alerts and Marked as Read buttons are visible
    Wait Until Element Is Visible    ${Alerts_section}    10s
    Wait Until Element Is Visible    ${Mark_as_read}    10s
    
    # Fetch alert count and marked as read count
    ${initial_alert_count}=    Get Alerts Count
    ${initial_marked_as_read_count}=    Get Marked As Read Count
    
    # Verify Show More button is visible and click it
    Wait Until Element Is Visible    ${Show_more_Link}    10s
    Click Element    ${Show_more_Link}
    
    # Verify Show Less button is visible
    Wait Until Element Is Visible    ${Show_less_Link}    10s
    Click Element    ${Show_less_Link}
    Scroll Element Into View    ${Frequency_text}
    click Element    ${Frequency_text}
    
    # Verify Mark as Read button is visible and click it
    Scroll Element Into View    ${Mark_as_read_button}
    Wait Until Element Is Visible    ${Mark_as_read_button}    10s
    Sleep    5s
    Click Element    ${Mark_as_read_button}

    Wait Until Element Is Visible    ${Alerts_section}    20s
    # Verify Marked as Read count increased by 1
    Sleep    5s
    Wait Until Element Is Visible    ${Alerts_section}    20s
    ${new_marked_as_read_count}=    Get Marked As Read Count
    Should Be Equal As Numbers    ${new_marked_as_read_count}    ${initial_marked_as_read_count + 1}
    
    # Verify Sort by Date button is visible and click it
    Wait Until Element Is Visible    ${Sort_By_Date}    10s
    ${before_sort_ dates}=    Get Alert Dates
    Click Element    ${Sort_By_Date}
    ${after_sort_dates}=    Get Alert Dates
    Should Not Be Equal    ${before_sort_dates}    ${after_sort_dates}

    # Count total alerts
    ${total_alerts}=    Get Matching Xpath Count    ${All_alerts_header_text}
    Log    Total alerts count: ${total_alerts}
    
    # Verify View Details button is visible and click it
    # Scroll Element Into View    ${Show_more_Link}
    Scroll Element Into View    ${Frequency_text}
    click Element    ${Frequency_text}
    Wait Until Element Is Visible    ${VIEW_DETAILS_BTN}    10s
    Scroll Element Into View    ${VIEW_DETAILS_BTN}
    Click Element    ${VIEW_DETAILS_BTN}
    
    # Verify navigation to homepage
    Wait Until Page Contains Element    ${NEW_CHAT_BUTTON}    20s


Get Alerts Count
    [Documentation]    Fetches the current count of alerts.
    ${count_text}=    Get Text    ${ALERTS_COUNT}
    ${count}=    Convert To Integer    ${count_text}
    RETURN    ${count}

Get Marked As Read Count
    [Documentation]    Fetches the current count of marked as read alerts.
    ${count_text}=    Get Text    ${MARKED_AS_READ_COUNT}
    ${count}=    Convert To Integer    ${count_text}
    RETURN    ${count}

Get Alert Dates
    [Documentation]    Gets all alert dates from the page and returns them as a list.
    ${alert_dates}=    Get WebElements    ${all_date_text}
    Log    Found alert date elements: ${alert_dates}
    ${dates}=    Create List
    FOR    ${element}    IN    @{alert_dates}
        ${date_text}=    Get Text    ${element}
        Append To List    ${dates}    ${date_text}
    END
    RETURN    ${dates}

Get Matching Xpath Count
    [Arguments]    ${xpath}
    ${elements}=    Get WebElements    ${xpath}
    ${count}=    Get Length    ${elements}
    RETURN    ${count}
