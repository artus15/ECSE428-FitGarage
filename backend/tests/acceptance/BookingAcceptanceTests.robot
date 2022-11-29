Library  RequestsLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/
${ID}   -1
*** Test Cases ***

Admin adds booking class
    [Documentation]     Create booking Class
    Create Session  Create_booking_class   ${URL}
    &{data}=    Create Dictionary     workoutClass=Running Class   user=Charlie Chaplin   bookingDate=2022-11-11
    ${response}=   post on session   Create_booking_class    bookingClass/createbookingClass   json=${data}
    Log to console   Created booking class with fields: ${response.json()}
    Should Be Equal As Strings   ${response.json()}[workoutClass]   Running Class
    Should Be Equal As Strings   ${response.json()}[user]   charlie
    Should Be Equal As Strings   ${response.json()}[bookingDate]   2022-11-11
    
Get booking class by id
    [Documentation]    Get booking class by id
    Create Session  Get_user_booking_class_by_id   ${URL}
    ${response}=  get on session  Get_user_booking_class_by_id user/getUserBookings/3/
    Log to console  ${response.json()}

Delete booking class by id
    [Documentation]  Delete booking class by id
    Create Session  Delete_booking_class_by_id   ${URL}
    ${response}=  delete on session  Delete_booking_class_by_id  booking/deleteBooking/11/
    Log to console  ${response.json()}