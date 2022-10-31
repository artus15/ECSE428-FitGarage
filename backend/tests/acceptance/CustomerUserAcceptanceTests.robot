*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/

*** Test Cases ***
Get all user information
    [Documentation]    Get all user information
    Create Session  Get_all_user_information   ${URL}
    ${response}=  get on session  Get_all_user_information  user/getUserInfo
    Status Should Be    OK  ${response}

Get user by id with valid id
    [Documentation]    Get user information by id with valid id
    Create Session  Get_user_by_id   ${URL}
    ${response}=  get on session  Get_user_by_id  user/getUserInfoById/2
    Status Should Be    OK  ${response}
    Log To Console    ${response.json()}
    Should Be Equal As Strings    ${response.json()}[name]    Yasmina
    Should Be Equal As Strings    ${response.json()}[email]    yasmina1@gmail.com
    
