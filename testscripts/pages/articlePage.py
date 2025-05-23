#Create article locators
newArticle = "text=New Article"
articleTitleField = "input[placeholder='Article Title']"
aboutField = "input[name='description']"
textAreaField = "textarea[name='body']"
tags = "input[name='tags']"
publishArticleButton = "button:has-text(\"Publish Article\")"
updateArticleButton = "button:has-text(\"Update Article\")"
globalFeedButton = "button:has-text(\"Global Feed\")"
articlePreview = "div.article-preview"

#validation in global feed view locators
validateArticleTitleMessage = "css=div.article-page h1"
validateParagraphBody = "css=div.article-content p"
validateTags = "css=ul.tag-list li"

#edit and delete button
editButton = "css=button.btn.btn-sm >> text=Edit Article >> nth=0"
deleteButton = "css=button.btn.btn-sm >> text=Delete Article >> nth=0"