*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary

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
${BUTTON_NEW_KEY}      xpath=//a[@href="#/new-key"]
${INPUT_NAME}          xpath=//*[@id="name"]
${INPUT_DESCRIPTION}   xpath=//*[@id="description"]
${IP_ADDRESSES}        xpath=//*[@id="range-0"]
${BUTTON_CREATE_KEY}   xpath=//button[@class="ladda-button btn btn-primary btn-lg btn-block"]             

*** Keywords ***
Go to clashroyale page
  Open Browser                   url=${URL}  browser=${BROWSER}
  Title Should Be                Clash Royale API
  Maximize Browser Window

Click Button Cookies
  Wait Until Element Is Visible   ${COOKIES}
  Click Link                      ${COOKIES}

Click login
  Wait Until Element Is Visible   ${LINK_LOGIN}
  Click Link                      ${LINK_LOGIN}

Login Email User with "${EMAIL}"
  Click Element                   ${INPUT_USERNAME} 
  Input Text                      ${INPUT_USERNAME}  ${EMAIL}

Password User user with "${PASSWORD}"
  Click Element                   ${INPUT_PASSWORD} 
  Input Text                      ${INPUT_PASSWORD}  ${PASSWORD}

Click Button Login
  Wait Until Element Is Visible   ${BUTTON_LOGIN}  
  Click Button                    ${BUTTON_LOGIN}

Click My User
  Wait Until Element Is Visible   ${BUTTON_MY_USER} 
  Click Button                    ${BUTTON_MY_USER}

Click My Account
  Click Link                      ${BUTTON_MY_ACCOUNT}

Click Button Create New Key      
  Click Link                      ${BUTTON_NEW_KEY}

Type Key Name with "${name}"
  Click Element                   ${INPUT_NAME}
  Input Text                      ${INPUT_NAME}  ${name}

Type Description with "${description}"
  Click Element                   ${INPUT_DESCRIPTION}
  Input Text                      ${INPUT_DESCRIPTION}  ${description}

Type IP Addresses and test external dynamic ip
  Click Element                   ${IP_ADDRESSES}
  Create Session  server  https://api.ipify.org/ 
  ${response}=    GET On Session  server   url=https://api.ipify.org/
  ${var_ipv4}=    Evaluate     $response.content 
  ${convert_ip_str}=  Convert To String  ${var_ipv4} 
  Input Text     ${IP_ADDRESSES}  ${convert_ip_str}

Click Button Create Key
  Click Button                    ${BUTTON_CREATE_KEY}










  

