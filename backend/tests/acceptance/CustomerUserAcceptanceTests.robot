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

Change user attribute
    [Documentation]    Change user attribute
    Create Session  Change_user_attribute   ${URL}
    &{data}=    Create Dictionary     name=test
    ${response}=  patch on session  Change_user_attribute  user/updateUserInfo/1/  json=${data}
    Log to console  ${response.json()}