*** Settings ***
Library    Collections
Resource    ../resourcses/loginResource.resource
Resource    ../resourcses/articleResource.resource
Suite Setup    Login And Open Browser With Storage State

*** Variables ***
${updatedarticleDescription}    UpdatedtestingRobotFrameworkScripts    

*** Test Cases ***
View Multiple Articles
    ${article0}=    Create Dictionary    title=RobotFramework2    paragraph=testingRobotFrameworkScripts2    tag=RobotFramework
    ${article1}=    Create Dictionary    title=RobotFramework1    paragraph=testingRobotFrameworkScripts1    tag=RobotFramework
    ${article2}=    Create Dictionary    title=RobotFramework    paragraph=testingRobotFrameworkScripts    tag=RobotFramework
    @{ARTICLES}=    Create List    ${article0}    ${article1}    ${article2}
    ${article_count}=    Get Length    ${ARTICLES}

    FOR    ${i}    IN RANGE    0    ${article_count}
        Click Home
        Click Global Feed Button
        Click Active Preview    ${i}
        ${article}=    Get From List    ${ARTICLES}    ${i}
        ${title}=    Get From Dictionary    ${article}    title
        ${paragraph}=    Get From Dictionary    ${article}    paragraph
        ${tag}=    Get From Dictionary    ${article}    tag
        Validate Article Data    ${title}    ${paragraph}    ${tag}
    END

Update and validate Article
    Click Home
    Click Global Feed Button
    Click Active Preview    0
    Click Edit Button 
    Clear Text    ${textAreaField}
    Type Text     ${textAreaField}    ${updatedarticleDescription}
    Click Update Article
    Click Home
    Click Global Feed Button
    Click Active Preview    0
    Validate Paragraph Body "${updatedarticleDescription}"

Delete Articles
    Click Home
    Click Global Feed Button
    Click Active Preview    0
    ${promise}=    Promise To    Wait For Alert    action=accept
    Click Delete Button
    Wait For    ${promise}
    Sleep    2 