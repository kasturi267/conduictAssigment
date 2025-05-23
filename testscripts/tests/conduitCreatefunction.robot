*** Settings ***
Resource    ../resourcses/loginResource.resource
Resource    ../resourcses/articleResource.resource
Library    DataDriver    file=../data/articleData.csv
Suite Setup    Login And Open Browser With Storage State
Test Template    Create New Article

*** Variables ***
${articleTitle}    EMPTY
${about}    EMPTY
${articleDescription}    EMPTY
${articleTags}    EMPTY

*** Test Cases ***
Create a New Article with    ${articleTitle}    ${about}    ${articleDescription}    ${articleTags}

*** Keywords ***
# Login And Open Browser With Storage State
#     ${state_file}=    Login And Save Storage State
#     Open Browser With Storage State    ${state_file}
#     Verify Successful Login

Create New Article
    [Arguments]    ${articleTitle}    ${about}    ${articleDescription}    ${articleTags}
    Log    Title: ${articleTitle}
    Log    About: ${about}
    Log    Description: ${articleDescription}
    Log    Tags: ${articleTags}
    Click New Article
    Enters Article details with "${articleTitle}", "${about}", "${articleDescription}", "${articleTags}"
    Click Publish Article
    Validate Article Title "${articleTitle}"