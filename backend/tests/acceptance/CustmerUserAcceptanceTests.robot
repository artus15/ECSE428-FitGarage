*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/

*** Test Cases ***
Get all user information
    [Documentation]    Get user information
    Create Session  Get_all_user_information   ${URL}
    ${response}=  get on session  Get_all_user_information  user/getUserInfo
    Log  this si the response ${response}

Get user by id
    [Documentation]    Get user information
    Create Session  Get_user_by_id   ${URL}
    ${response}=  get on session  Get_user_by_id  user/getUserInfoById/1
    Log to console  ${response.json()}

Create new user
    [Documentation]    Create new user
    Create Session    Create_new_user   ${URL}
    ${data}   Create Dictionary    name=yasmina   email=yas@gmail.com   isAdmin=false   balance=0   password=12345
    ${response}=   post on session   Create_new_user  user/createUser   json=${data}
    Log to console  ${response.json()}