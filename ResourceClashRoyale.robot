*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}               https://developer.clashroyale.com/
${BROWSER}           chrome
${LINK_LOGIN}        xpath=//div[@class="hidden-xs hidden-sm col-md-4"]/div/a[2]
${INPUT_USERNAME}    xpath=//*[@id="email"]
${INPUT_PASSWORD}    xpath=//*[@id="password"]
${BUTTON_LOGIN}      xpath=//*[@class="ladda-button btn btn-primary btn-lg"] 

*** Keywords ***
Go to clashroyale page
  Open Browser     url=${URL}  browser=${BROWSER}
  Title Should Be  Clash Royale API
  Maximize Browser Window

Click login
  Click Link     ${LINK_LOGIN}

Login Email User with "${EMAIL}"
  Click Element  ${INPUT_USERNAME} 
  Input Text     ${INPUT_USERNAME}  ${EMAIL}

Password User user with "${PASSWORD}"
  Click Element  ${INPUT_PASSWORD} 
  Input Text     ${INPUT_PASSWORD}  ${PASSWORD}

Click Button Login
  Click Button   ${BUTTON_LOGIN}    

  

