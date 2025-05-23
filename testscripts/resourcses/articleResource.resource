*** Settings ***
Library           Browser
Variables        ../pages/articlePage.py

*** Keywords ***
Click New Article
    Wait For Elements State    ${newArticle}    visible    timeout=10s
    Click    ${newArticle}

Enters Article details with "${articleTitle}", "${about}", "${articleDescription}", "${articleTags}"
    Wait For Elements State    ${articleTitleField}    visible
    Type Text    ${articleTitleField}    ${articleTitle}
    Type Text    ${aboutField}           ${about}
    Type Text    ${textAreaField}        ${articleDescription}
    Type Text    ${tags}                 ${articleTags}

Click Publish Article
    Wait For Elements State    ${publishArticleButton}
    Click    ${publishArticleButton}
    Sleep    5s

Click Update Article
    Wait For Elements State    ${updateArticleButton}
    Click    ${updateArticleButton}
    Sleep    5s

Validate Article Title "${articleTitle}"
    Wait For Elements State    ${validateArticleTitleMessage}
    ${textTitle}=    Get Text    ${validateArticleTitleMessage}
    Should Contain    ${textTitle}    ${articleTitle}

Click Global Feed Button
    Click    ${globalFeedButton}
    Sleep    5s

Click Active Preview
    [Arguments]    ${index}
    ${articlePreviewIndex}=    Get Elements    ${articlePreview}
    Click    ${articlePreviewIndex}[${index}]
    Sleep    5s

Validate Paragraph Body "${expectedParagraphBody}"
    Wait For Elements State    ${validateParagraphBody}    visible
    ${bodyText}=    Get Text    ${validateParagraphBody}
    Should Contain    ${bodyText}    ${expectedParagraphBody}

Validate Tag "${expectedTag}"
    Wait For Elements State    ${validateTags}    visible
    ${tagText}=    Get Text    ${validateTags}
    Should Contain    ${tagText}    ${expectedTag}

Validate Article Data
    [Arguments]    ${title}    ${paragraph}    ${tag}
    Validate Article Title "${Title}"
    Validate Paragraph Body "${Paragraph}"
    Validate Tag "${Tag}"

Click Edit Button    
    Click    ${editButton}

Click Delete Button
    Click    ${deleteButton}
