# *** Settings ***
# Variables       ../pages/loginPage.py
# Library    Browser

 
# *** Variables ***
# ${email}     RobotTestAutomation@gmail.com
# ${pwd}        RobotTestAutomation
# ${userNametext}      RobotTestAutomation
# ${state_file}       storage/state.json

 
# *** Keywords ***
# Click Login
#     Wait For Elements State    ${loginButton}
#     Click    ${loginButton}
# Enter Email and Password
#     Type Text    ${emailInputField}    ${email}
#     Type Text    ${passwordInputField}    ${pwd}
#     ${state_file}=    Save Storage State 
# Click LoginBtn
#     Wait For Elements State    ${loginButtonInSiginPopup}    
#     Click    ${loginButtonInSiginPopup}

# Verify Successful Login
#     Wait For Elements State    ${successMessage}    visible
#     ${actual}=    Get Text    ${successMessage}
#     Should Be Equal As Strings    ${actual}    ${userNametext}


# *** Settings ***
# Library           Browser
# Variables         ../pages/loginPage.py

# *** Variables ***
# ${baseUrl}        https://conduit-realworld-example-app.fly.dev/
# ${browser}        chromium
# ${email}          RobotTestAutomation@gmail.com
# ${pwd}            RobotTestAutomation
# ${userNametext}   RobotTestAutomation
# ${state_file}     storage/state.json

# *** Keywords ***
# Login And Save Storage State
#     New Browser    ${browser}    headless=true
#     New Context
#     New Page    ${baseUrl}
#     Click Login
#     Enter Email and Password
#     Click LoginBtn
#     Verify Successful Login
#     ${state_file}=    Save Storage State
#     Close Browser

# Open Browser With Storage State
#     New Browser    ${browser}    headless=false
#     New Context    storageState=${state_file}
#     New Page       ${baseUrl}

# Click Login
#     Wait For Elements State    ${loginButton}
#     Click    ${loginButton}

# Enter Email and Password
#     Type Text    ${emailInputField}    ${email}
#     Type Text    ${passwordInputField}    ${pwd}

# Click LoginBtn
#     Wait For Elements State    ${loginButtonInSiginPopup}    
#     Click    ${loginButtonInSiginPopup}

# Verify Successful Login
#     Wait For Elements State    ${successMessage}    visible
#     ${actual}=    Get Text    ${successMessage}
#     Should Be Equal As Strings    ${actual}    ${userNametext}


*** Settings ***
Library           Browser
Library           OperatingSystem
Library           JSONLibrary
Variables         ../pages/loginPage.py

*** Variables ***
${BASE_URL}        https://conduit-realworld-example-app.fly.dev/
${BROWSER}         chromium
# ${STATE_FILE}      storage/state.json
${EMAIL}           RobotTestAutomation@gmail.com
${PWD}             RobotTestAutomation
${USERNAME_TEXT}   RobotTestAutomation

*** Keywords ***
Login And Save Storage State
    New Browser    ${browser}    headless=true
    New Context
    New Page    ${baseUrl}
    Click Login
    Enter Email and Password
    Click LoginBtn
    Verify Successful Login
    ${storage_state_path}=    Browser.Save Storage State
    Log    Storage saved at: ${storage_state_path}
    Close Browser
    RETURN    ${storage_state_path}

Open Browser With Storage State
    [Arguments]    ${state_file}
    New Browser    ${browser}    headless=false
    ${context_options}=    Create Dictionary    storageState=${state_file}
    New Context    &{context_options}
    New Page    ${baseUrl}

Login And Open Browser With Storage State
    ${state_file}=    Login And Save Storage State
    Open Browser With Storage State    ${state_file}
    Verify Successful Login

Click Home
    Wait For Elements State    ${homeButton}
    Click    ${homeButton}

Click Login
    Wait For Elements State    ${loginButton}
    Click    ${loginButton}

Enter Email and Password
    Type Text    ${emailInputField}    ${EMAIL}
    Type Text    ${passwordInputField}    ${PWD}

Click LoginBtn
    Wait For Elements State    ${loginButtonInSiginPopup}    
    Click    ${loginButtonInSiginPopup}

Verify Successful Login
    Wait For Elements State    ${successMessage}    visible
    ${actual}=    Get Text    ${successMessage}
    Should Be Equal As Strings    ${actual}    ${USERNAME_TEXT}