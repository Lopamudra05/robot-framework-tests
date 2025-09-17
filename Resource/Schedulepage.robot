*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SCHEDULE_PAGE_LINK}       //nav[contains(@class,'Navbar_navbar__')]//div[4]//button[1]
${CREATE_NEW_SCHEDULE_BTN}      //button[normalize-space()='Create New Schedule']
${AGENT_DROPDOWN}    //input[@placeholder='Select Agent']
${TESLA_AGENT}      //span[contains(text(),'Tesla orders')]
${DAILY_RADIO}  //label[normalize-space()='Daily']
${DATE_PICKER}  //span[normalize-space(text())='Pick date range']
${TIME_PICKER}  //input[@placeholder='Time']
${PARAMETERS}   //p[normalize-space()='Parameters']
${EDIT_PARAMETERS}  //p[normalize-space()='Parameters']/../*[local-name()='svg']
${PARAM_ORG}    //input[@value='Tesla']   
${PARAM_YEAR}   //input[@value='2025']          
${PARAM_YEAR1}  //input[@value='2022']
${PROCEED_BTN}  //button[normalize-space()='Proceed']
${SAVE_BTN}     //button[normalize-space()='Save']



*** Keywords ***
Click Create Schedule Button
    Wait Until Element Is Visible    ${SCHEDULE_PAGE_LINK}    30s
    Click Element    ${SCHEDULE_PAGE_LINK}
    Wait Until Element Is Visible    ${CREATE_NEW_SCHEDULE_BTN}    30s
    Click Element    ${CREATE_NEW_SCHEDULE_BTN}
    
Select Tesla Agent
    Wait Until Element Is Visible    ${AGENT_DROPDOWN}    30s
    Click Element    ${AGENT_DROPDOWN}
    Click Element    ${TESLA_AGENT}
    wait Until Element Is Visible    ${DAILY_RADIO}    20s

Select Daily Frequency
    Click Element    ${DAILY_RADIO}
    Wait Until Element Is Visible    ${DATE_PICKER}    20s

Set Date And Time
    ${day}      Get Current Day
    ${day_str}      Evaluate    str(${day})
    Log    Today's day is: ${day_str}
    ${date1_xpath}=    Format Date Picker XPath1    ${day_str}
    Click Element    ${DATE_PICKER}
    Sleep    2s
    Click Element    ${date1_xpath}
    ${date2_xpath}=    Format Date Picker XPath2    ${day}
    Click Element    ${date2_xpath}
    Sleep    3s
    ${time}=    Get Current Time Rounded HHMM
    Log    Current time is: ${time}
    ${time_xpath}=    Format Time XPath    ${time}
    Click Element    ${TIME_PICKER}
    Sleep    3s
    Click Element    ${time_xpath}
    Sleep    3s
    Wait Until Element Is Visible    ${PARAMETERS}    20s

Click Parameters
    Click Element    ${PARAMETERS}
    Wait Until Element Is Visible    ${EDIT_PARAMETERS}    20s

Set Parameters
    [Arguments]    ${ORG_INPUT}    ${YEAR_INPUT}    ${YEAR1_INPUT}
    Sleep    3s
    Input Text    ${PARAM_ORG}    ${ORG_INPUT}
    Input Text    ${PARAM_YEAR}   ${YEAR_INPUT}
    Input Text    ${PARAM_YEAR1}  ${YEAR1_INPUT}

Save Schedule
    Click Element    ${SAVE_BTN}
    Wait Until Element Is Not Visible    ${SAVE_BTN}    20s
    Sleep    5s
Get Current Day
    [Documentation]    Returns the current day of the month as an integer.
    ${current_day}=    Evaluate    datetime.datetime.now().day    datetime
    RETURN    ${current_day}
Get Current Time
    [Documentation]    Returns the current time as a string in HH:MM:SS format.
    ${current_time}=    Evaluate    datetime.datetime.now().strftime('%H:%M:%S')    datetime
    RETURN    ${current_time}


Get Current Time Rounded HHMM
    [Documentation]    Returns the current time rounded up to the next half hour in HH:MM format (24-hour).
    ${now}=    Evaluate    datetime.datetime.now()    modules=datetime
    ${minute}=    Evaluate    $now.minute
    ${hour}=      Evaluate    $now.hour
    ${m}=         Evaluate    ($minute // 30 + 1) * 30
    ${h}=         Evaluate    ($hour + ($m // 60)) % 24
    ${m}=         Evaluate    $m % 60
    ${rounded_time}=    Evaluate    f"{$h:02d}:{$m:02d}"
    RETURN    ${rounded_time}



Format Date Picker XPath1
    [Arguments]    ${date_text}
    ${date_str}    Evaluate    str(${date_text})
    ${xpath}       Evaluate    f"(//button[normalize-space()='${date_str}'])[1]"
    RETURN    ${xpath}

Format Time XPath
    [Arguments]    ${time_text}
    ${time_str}    Evaluate    str("${time_text}")
    ${xpath}    Set Variable    //span[normalize-space()='${time_str}']
    RETURN    ${xpath}

Format Date Picker XPath2
    [Arguments]    ${date_text}
    ${date_str}    Evaluate    str(${date_text})
    ${xpath}    Evaluate    f"(//button[normalize-space()='${date_str}'])[2]"
    RETURN    ${xpath}