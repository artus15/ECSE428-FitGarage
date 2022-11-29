*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/
${ID}   -1
*** Test Cases ***

Admin adds booking class
    [Documentation]     Create booking Class
    Create Session  Create_booking_class   ${URL}
    &{data}=    Create Dictionary     workoutClass=7   user=1   bookingDate=2022-11-11
    ${response}=   post on session   Create_booking_class    booking/createBooking   json=${data}
    Log to console   Created booking class with fields: ${response.json()}
    Should Be Equal As Strings   ${response.json()}[workoutClass]   7
    Should Be Equal As Strings   ${response.json()}[user]   1
    Should Be Equal As Strings   ${response.json()}[bookingDate]   2022-11-11
    
    
Get booking by id
    [Documentation]    Get booking by User
    Create Session  Get_booking_by_id   ${URL}
    ${response}=  get on session  Get_booking_by_id  booking/getBookingById/1/
    Log To Console    ${response.json()}


Delete booking class by id
    [Documentation]  Delete booking class by id
    Create Session  Delete_booking_class_by_id   ${URL}
    ${response}=  delete on session  Delete_booking_class_by_id  booking/deleteBooking/9/
    Log to console  ${response.json()}