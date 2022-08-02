*** Settings ***
Library    SeleniumLibrary   
Library    ExcelLibrary     
Library    String    
Library    clipboard    

*** Variables ***
${URL}    https://temp-mail.org/en/
${NewURL}    https://test01.securesave.app
${SecureEmail}    loreli31@numbersgh.com
${SecurePassword}    Secure*12
${BROWSER}    chrome
${HomePageHeader}    xpath=//h2[text()="Your Temporary Email Address"]
${EmailField}    xpath=//input[@id="mail"]
${CopyEmail}    xpath=//button[@id="click-to-copy"]
${MAX_WAIT}    60s
${SecureLoginPage}    xpath=//div[text()=" Welcome back "]
${SecureEmailInput}    xpath=//input[@id="email"]
${SecurePasswordInput}    xpath=//input[@id="password"]
${SecureLoginButton}    xpath=//button[@type="button"]/span[text()=" Sign in "]
${SecureAccountSelectionPage}    xpath=//div[text()=" Which account would you like to use? "]
${AdminAccount}    xpath=//div[text()=" Admin "]
${CancelOverlay}    xpath=//button[@type="button"]/span[text()=" Cancel "]
${EmployeesTab}    xpath=//div[@class="v-list-item__title"][text()="Employees"]
${AddEmployees}    xpath=//button[@type="button"]/span[text()=" Add employees "]
${CreateIndividually}    xpath=//div[text()=" Create individually "]
${FirstName}    xpath=(//input[@type="text"])[4]
${LastName}    xpath=(//input[@type="text"])[6]
${CreateEmail}    xpath=(//input[@type="text"])[7]
${Phone}    xpath=(//input[@type="text"])[8]
${Address}    xpath=(//input[@type="text"])[9]
${AddressSelection}    xpath=(//div[@class="v-list-item__title"]/span[text()="123"])[1]
${ZipCode}    xpath=(//input[@type="text"])[13]
${NextButton}    xpath=//button[@type="button"]/span[text()=" Next "]
${SIN}    xpath=(//input[@type="text"])[4]
${DOB}    xpath=(//input[@type="text"])[6]
${EmpID}    xpath=(//input[@type="text"])[5]
${AddInviteEmployee}    xpath=//button[@type="button"]/span[text()=" Add and invite employee "]
${ConfirmAddEmployee}    xpath=(//div[@class="v-card__actions custom-dialog-footer"]/button[@type="button"])[1]
${EmployeeAddedHeader}    xpath=//h2[text()=" Employee added "]
${DoneButton}    xpath=//button[@type="button"]/span[text()=" Done "]    
${SecureEmailLink}    xpath=//a[text()="numbersgh.com invites you to build Emergency Savings with SecureSave"]
##//a[text()="numbersgh.com invites you to build Emergency Savings with SecureSave"]
${GetStarted}    xpath=//a[text()="Get Started"]
${WelcomeScreen}    xpath=//div[text()=" Welcome to SecureSave "]
${CreatePass}    xpath=//input[@type="password"]
${SINLastFour}    xpath=(//input[@type="text"])[2]
${CreateAccountButton}    xpath=//button[@type="button"]/span[text()=" Create account "]  
${SearchUser}    xpath=//input[@placeholder="Search by name or email"]  
${EmployeeStatus}    xpath=//input[@placeholder="Employee status"]
${LabelInvited}    xpath=//label[text()="Invited"]
${ApplyFilterButton}    xpath=//button[@type="button"]/span[text()=" Apply "]

*** Keywords ***

Open the Browser & Application
    [Documentation]    This Keyword is used to Open the Browser & Application
    Open Browser    url=${URL}    browser=${BROWSER}     
    Maximize Browser Window
    Capture Page Screenshot    
    
Verify HomePage Is Loaded
    [Documentation]    This Keyword is used to Verify HomePage Is Loaded
    Wait Until Page Contains Element    ${HomePageHeader}    ${MAX_WAIT}
    Sleep    20s
    Capture Page Screenshot  
    
Open New Chrome Tab
    Execute Javascript    window.open('')
    Get Window Titles
    Select Window    title=undefined
    Sleep    5s
    Go To   ${NewURL}  
    Capture Page Screenshot    
    
Create User Define Number Of Accounts
    [Documentation]    This Keyword is used to Create User Define Number Of Accounts
    [Arguments]    ${NumberOfAccounts}
    FOR    ${i}    IN RANGE    ${NumberOfAccounts}
        Open the Browser & Application
        Verify HomePage Is Loaded
        Wait Until Page Contains Element    ${HomePageHeader}    ${MAX_WAIT}
        Click Element    ${CopyEmail}    
        Open New Chrome Tab           
        Wait Until Page Contains Element    ${SecureLoginPage}    ${MAX_WAIT}  
        Wait Until Page Contains Element    ${SecureEmailInput}    ${MAX_WAIT}
        Input Text    ${SecureEmailInput}    ${SecureEmail}    
        Wait Until Page Contains Element    ${SecurePasswordInput}    ${MAX_WAIT}
        Input Text    ${SecurePasswordInput}    ${SecurePassword}    
        Wait Until Page Contains Element    ${SecureLoginButton}    ${MAX_WAIT}    
        Click Element    ${SecureLoginButton}  
        Wait Until Page Contains Element    ${SecureAccountSelectionPage}    ${MAX_WAIT}  
        Wait Until Page Contains Element    ${AdminAccount}    ${MAX_WAIT}
        Click Element    ${AdminAccount} 
        sleep    5s   
        Wait Until Page Contains Element    ${CancelOverlay}    ${MAX_WAIT}
        Click Element    ${CancelOverlay}    
        Wait Until Page Contains Element    ${EmployeesTab}    ${MAX_WAIT}
        Click Element    ${EmployeesTab}
        Sleep    5s
        Wait Until Page Contains Element    ${AddEmployees}    ${MAX_WAIT}  
        Click Element    ${AddEmployees}    
        Wait Until Page Contains Element    ${CreateIndividually}    ${MAX_WAIT}
        Click Element    ${CreateIndividually}
        Wait Until Page Contains Element    ${FirstName}    ${MAX_WAIT}
        ${TempFirstName}=    Generate Random String    8    [LETTERS]
        Set Test Variable    ${TempFirstName}    
        Input Text    ${FirstName}    ${TempFirstName} 
        Wait Until Page Contains Element    ${LastName}    ${MAX_WAIT}
        ${TempLastName}=    Generate Random String    8    [LETTERS]
        Set Test Variable    ${TempLastName}    
        Input Text    ${LastName}    ${TempLastName} 
        Click Element    ${CreateEmail}    
        Press Keys    None    CTRL+V
        # ${UserCreatedEmail}=    Get Text    ${CreateEmail}
        # Set Test Variable    ${UserCreatedEmail}    
        # Log To Console    ${UserCreatedEmail}    
        Wait Until Page Contains Element    ${Address}    ${MAX_WAIT}
        Input Text    ${Address}    123    
        Wait Until Page Contains Element    ${AddressSelection}    ${MAX_WAIT}
        Click Element    ${AddressSelection}
        Wait Until Page Contains Element    ${ZipCode}    ${MAX_WAIT}
        Input Text    ${ZipCode}    123456258
        Click Element    ${Phone}     
        Wait Until Page Contains Element    ${NextButton}    ${MAX_WAIT}
        Click Element    ${NextButton} 
        Wait Until Page Contains Element    ${SIN}    ${MAX_WAIT}    
        ${SINFourDigits}=    Generate Random String    4    [NUMBERS]
        Set Test Variable    ${SINFourDigits}
        ${FinalFirstFive}=    Generate Random String    5    [NUMBERS] 
        Log    ${FinalFirstFive}
        ${FinalSIN}=   Catenate    SEPARATOR=  ${SINFourDigits}   ${FinalFirstFive} 
        Input Text    ${SIN}    ${FinalSIN}
        Log To Console    ${FinalSIN}    
        Input Text    ${DOB}    12121987
        Click Element    ${EmpID}    
        Wait Until Page Contains Element    ${AddInviteEmployee}    ${MAX_WAIT}
        Sleep    3s
        Click Element    ${AddInviteEmployee}    
        Sleep    5s
        #Run Keyword And Ignore Error    Click Element    locator        
        Wait Until Page Contains Element    ${ConfirmAddEmployee}    ${MAX_WAIT}
        Click Element    ${ConfirmAddEmployee}   
        Wait Until Page Contains Element    ${EmployeeAddedHeader}    ${MAX_WAIT}
        Wait Until Page Contains Element    ${DoneButton}    ${MAX_WAIT}  
        Sleep    3s 
        Click Element    ${DoneButton}
        Sleep    5s  
        Run Keyword And Ignore Error    Click Element    xpath=//button[@type="button"]/span[text()=" Clear filter "]
        Sleep    5s        
        Wait Until Page Contains Element    ${SearchUser}    ${MAX_WAIT}  
        Input Text    ${SearchUser}    ${TempLastName} 
        Wait Until Page Contains Element    ${EmployeeStatus}    ${MAX_WAIT} 
        Click Element    ${EmployeeStatus}    
        Wait Until Page Contains Element    ${LabelInvited}    ${MAX_WAIT}
        Click Element    ${LabelInvited}
        Sleep    1s
        Click Element    ${ApplyFilterButton}
        Sleep    5s
        Wait Until Page Contains Element    xpath=(//p)[3]    ${MAX_WAIT}
        ${UserCreatedEmail}=    Get Text    xpath=(//p)[3]
        Set Test Variable    ${UserCreatedEmail}    
        Log To Console    ${UserCreatedEmail} 
        Log    ${UserCreatedEmail}  
        Log To Console    ---------------------                   
        # Select Window    MAIN
        # Wait Until Page Contains Element    ${SecureEmailLink}    ${MAX_WAIT} 
        # ${ele}    Get WebElement    //a[text()="numbersgh.com invites you to build Emergency Savings with SecureSave"]
        # Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
        # # ${Element}=    Get WebElement    xpath=//a[text()="numbersgh.com invites you to build Emergency Savings with SecureSave"]
        # # Execute JavaScript  arguments[0].click(),${Element}
        # #Click Element    ${SecureEmailLink}
        # #Click Link    ${SecureEmailLink}        
        # Sleep    10s
        # Wait Until Page Contains Element    ${GetStarted}    ${MAX_WAIT} 
        # Click Element    ${GetStarted}
        # Wait Until Page Contains Element    ${WelcomeScreen}    ${MAX_WAIT}
        # Input Text    ${CreatePass}    Secure*12     
        # Input Text    ${SINLastFour}    ${SINFourDigits}
        # Wait Until Page Contains    ${CreateAccountButton}    ${MAX_WAIT}    
        # Click Element    ${CreateAccountButton}                                            
        #Press Keys    None    CTRL+V  
        Close Browser   
    END    
