*** Settings ***
Resource  ResourceClashRoyale.robot

*** Test Cases ***

Test Case 01: Open Page
  Go to clashroyale page

Teste Case 02: Exit Cookies
  Click Button Cookies  

Test Case 03: Login
  Click login
  Login Email User with "gustavoalisson112@gmail.com"
  Password User user with "Guga2019@"
  Click Button Login

Test Case 04: Open My Account
  Click My User
  Click My Account

Test Case 05: Create New Keywords
  Click Button Create New Key
  Type Key Name with "Permission"
  Type Description with "Testing API ClashRoyale for prime Control project"
  Type IP Addresses and test external dynamic ip
  Click Button Create Key

