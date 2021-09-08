*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  String

*** Variable ***
                                       # INSERT SESSION >
&{BEARER_TOKEN}   Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjlhNGM1ZjVmLTJkYzUtNDc4Mi1hNzdlLTgwZWJlMWYxMGMzZiIsImlhdCI6MTYzMDk2MDQ0Mywic3ViIjoiZGV2ZWxvcGVyL2QxZDI5YjJlLTI1NzEtNDZkOS1hMjQzLTA2MTU1ZGE5MjcyOCIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIyMDEuMTgyLjE3NC4xMjMiXSwidHlwZSI6ImNsaWVudCJ9XX0.1CipTJy-FnD04pWcpr56Pdt6J7h5mkogmgzGU4aZmHizVMDaSDDW6tLxWaR30kKyGx2LCHGjVrv76FlqQotz_A
${URL_BASE}       https://api.clashroyale.com/v1

*** Test Cases ***
BearerAuthTest
  Connect with authentication in API ClashRoyale
  Request Data The Resistance
  Request Members Of Clan

*** Keywords ***
Connect with authentication in API ClashRoyale
  Create Session   session  ${URL_BASE}  disable_warnings=1
  Log     ${BEARER_TOKEN}

Request Data The Resistance
   ${ENDPOINT}   Set Variable   /clans?name=The%20Resistance
   ${RESPONSE} =   GET On Session   session    ${ENDPOINT}     headers=${BEARER_TOKEN}
   Log  ${RESPONSE}
   ${DATA}=    Evaluate     json.loads("""${response.content}""")    json
  FOR  ${I}   IN   @{DATA}[items]
       IF  "${I}[name]" =="The Resistance"
           IF   "#9V2Y" == "${I}[tag]"
                Log       ${I}[tag]
           END   
       END   
  END   
      
Request Members Of Clan
   ${ENDPOINT}   Set Variable   /clans/%239V2YV8YJ/members
   ${RESPONSE} =   GET On Session   session    ${ENDPOINT}     headers=${BEARER_TOKEN}
   Log  ${RESPONSE}
   ${VAR_DICT}=    Evaluate     json.loads("""${response.text}""")    json
   ${value}=    Set variable    ${VAR_DICT}[items][0][tag]


    
   



   


