*** Settings ***
Resource  ResourceClashRoyale.robot

*** Test Cases ***

Test Case 01: Open Page
  Go to clashroyale page

Test Case 02: Login
  Click login
  Login Email User with "gustavoalisson112@gmail.com"
  Password User user with "Guga2019@"
  Click Button Login
