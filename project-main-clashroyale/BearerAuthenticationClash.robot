*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  String


*** Variable ***
&{BEARER_TOKEN}   Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImI4NmI5Yjc2LTJkYzEtNDM1My1hOGM4LTkzOWQwNDlhOGJlYSIsImlhdCI6MTYzMDkzODQ4OCwic3ViIjoiZGV2ZWxvcGVyL2QxZDI5YjJlLTI1NzEtNDZkOS1hMjQzLTA2MTU1ZGE5MjcyOCIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIyMDEuMTgyLjE3NC4xMjMiXSwidHlwZSI6ImNsaWVudCJ9XX0.hi-wFVVbhjv0o9hpMDe1z7sF7PuafOaCu2vNqjpt4ARbKdJCDwHpGT8JNeM4zRgg0Iq6z-E8x6pejYY1S6ZlQA 

*** Test Cases ***
BearerAuthTest
  Connect with authentication in API ClashRoyale
  Request Data The Resistance

*** Keywords ***
Connect with authentication in API ClashRoyale
  Create Session   my_json  url=https://api.clashroyale.com/v1/
  Log     ${BEARER_TOKEN}
  ${RESPONSE} =   GET On Session  my_json   url=https://api.clashroyale.com/v1/clans?name=The%20Resistance     headers=${BEARER_TOKEN}
  Log  ${RESPONSE}

Request Data The Resistance
   ${RESPONSE} =   GET On Session   my_json    url=https://api.clashroyale.com/v1/clans?name=The%20Resistance     headers=${BEARER_TOKEN}
   ${VAR_DICT}=    Evaluate     json.loads("""${response.content}""")    json
   ${VAR_TAG}=    Set Variable    ${VAR_DICT}[items][1]
   Log     ${VAR_TAG}   


   


