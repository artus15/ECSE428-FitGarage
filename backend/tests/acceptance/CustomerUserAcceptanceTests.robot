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

Update user password
    [Documentation]     Update user password
    Create Session  Update_user_password   ${URL}
    &{data}=    Create Dictionary     password="New-sPassword!!!!!"
    ${response}=   patch on session   Update_user_password    user/updatePassword/1/   json=${data}
    Log to console   User info with updated password: ${response.json()}
