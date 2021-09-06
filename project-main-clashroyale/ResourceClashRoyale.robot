*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}                 https://developer.clashroyale.com/
${BROWSER}             chrome
${LINK_LOGIN}          xpath=//div[@class="hidden-xs hidden-sm col-md-4"]/div/a[2]
${COOKIES}             xpath=//a[@class="cc-btn cc-dismiss"] 
${INPUT_USERNAME}      xpath=//*[@id="email"]
${INPUT_PASSWORD}      xpath=//*[@id="password"]
${BUTTON_LOGIN}        xpath=//*[@class="ladda-button btn btn-primary btn-lg"]
${BUTTON_MY_USER}      xpath=//*[@id="content"]/div/div[2]/div/header/div/div/div[3]/div/div/button
${BUTTON_MY_ACCOUNT}   xpath=//ul[@class="dropdown-menu"]/li/a[@href="#/account"]  

*** Keywords ***
Go to clashroyale page
  Open Browser     url=${URL}  browser=${BROWSER}
  Title Should Be  Clash Royale API
  Maximize Browser Window

Click Button Cookies
  Click Link     ${COOKIES}

Click login
  Click Link     ${LINK_LOGIN}

Login Email User with "${EMAIL}"
  Click Element  ${INPUT_USERNAME} 
  Input Text     ${INPUT_USERNAME}  ${EMAIL}

Password User user with "${PASSWORD}"
  Click Element  ${INPUT_PASSWORD} 
  Input Text     ${INPUT_PASSWORD}  ${PASSWORD}

Click Button Login
  Click Button                   ${BUTTON_LOGIN}

Click My User
  Wait Until Element Is Visible  ${BUTTON_MY_USER} 
  Click Button                   ${BUTTON_MY_USER}

Click My Account
  Click Link                     ${BUTTON_MY_ACCOUNT}



  

