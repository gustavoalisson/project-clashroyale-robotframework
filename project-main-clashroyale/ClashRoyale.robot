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
  Click Button New Key
  # Type Key Name
  # Type Description
  # Type IP ADDRESSES
  # Click Button Create Key

