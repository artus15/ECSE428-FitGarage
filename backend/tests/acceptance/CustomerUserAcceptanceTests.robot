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

Create new user
    [Documentation]    Create new user
    Create Session    Create_new_user   ${URL}
    ${data}   Create Dictionary    name=yasminat   email=yas@gmail.com   isAdmin=false   balance=0   password=12345
    ${response}=   post on session   Create_new_user  user/createUser   json=${data}


Update user password
    [Documentation]     Update user password
    Create Session  Update_user_password   ${URL}
    &{data}=    Create Dictionary     password=New-sPassword!!!!!
    ${response}=   patch on session   Update_user_password    user/updatePassword/1/   json=${data}
    Log to console   User info with updated password: ${response.json()}
    

Change user attribute
    [Documentation]    Change user attribute
    Create Session  Change_user_attribute   ${URL}
    &{data}=    Create Dictionary     name=test
    ${response}=  patch on session  Change_user_attribute  user/updateUserInfo/1/  json=${data}
    Log to console  ${response.json()}
