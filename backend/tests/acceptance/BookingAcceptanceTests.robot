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
    Should Be Equal As Strings   ${response.json()}[user]   Charlie Chaplin
    Should Be Equal As Strings   ${response.json()}[bookingDate]   2022-11-11
    
    
Get all booking classes
    [Documentation]    Get booking by User
    Create Session  Get_all_booking_by_CustomUser   ${URL}
    ${response}=  get on session  Get_all_booking_classes  bookingClass/getBookingsByUser
    Log this is the response ${response}

Get booking class by id
    [Documentation]    Get booking class by id
    Create Session  Get_booking_class_by_id   ${URL}
    ${response}=  get on session  Get_booking_class_by_id  bookingClass/getBookingById/3
    Log to console  ${response.json()}

Get booking class by workoutClass
    [Documentation]    Get booking class by workoutClass
    Create Session  Get_booking_class_by_workoutClass   ${URL}
    ${response}=  get on session  Get_booking_class_by_workoutClass  bookingClass/getBookingByworkoutClass/Boxing
    Log to console  ${response.json()}

Delete booking class by id
    [Documentation]  Delete booking class by id
    Create Session  Delete_booking_class_by_id   ${URL}
    ${response}=  delete on session  Delete_booking_class_by_id  bookingClass/delete/11
    Log to console  ${response.json()}