*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/
${ID}   -1
*** Test Cases ***

Admin adds workout class
    [Documentation]     Create Workout Class
    Create Session  Create_workout_class   ${URL}
    &{data}=    Create Dictionary     name=Running Class   instructor=Charlie Chaplin   description=Come run with Charlie!   start=2022-11-11   end=2023-08-08   enable=false
    ${response}=   post on session   Create_workout_class    workoutClass/createWorkoutClass   json=${data}
    Log to console   Created workout class with fields: ${response.json()}
    Should Be Equal As Strings   ${response.json()}[name]   Running Class
    Should Be Equal As Strings   ${response.json()}[instructor]   Charlie Chaplin
    Should Be Equal As Strings   ${response.json()}[description]   Come run with Charlie!
    Should Be Equal As Strings   ${response.json()}[start]   2022-11-11
    Should Be Equal As Strings   ${response.json()}[end]   2023-08-08
    Should Be Equal As Strings   ${response.json()}[enable]   False
    
    
Get all workout classes
    [Documentation]    Get workout classes
    Create Session  Get_all_workout_classes   ${URL}
    ${response}=  get on session  Get_all_workout_classes  workoutClass/getAllClasses
    Log  this is the response ${response}

Get workout class by id
    [Documentation]    Get workout class by id
    Create Session  Get_workout_class_by_id   ${URL}
    ${response}=  get on session  Get_workout_class_by_id  workoutClass/getWorkoutById/3
    Log to console  ${response.json()}

Get workout class by name
    [Documentation]    Get workout class by name
    Create Session  Get_workout_class_by_name   ${URL}
    ${response}=  get on session  Get_workout_class_by_name  workoutClass/getWorkoutByName/Boxing
    Log to console  ${response.json()}

Delete workout class by id
    [Documentation]  Delete workout class by id
    Create Session  Delete_workout_class_by_id   ${URL}
    ${response}=  delete on session  Delete_workout_class_by_id  workoutClass/delete/11
    Log to console  ${response.json()}

Change workout class attribute
    [Documentation]  Change workout class attribute
    Create session  Change_workout_class_attribute  ${URL}
    &{data}=    Create Dictionary     name=secretWorkout
    ${response}=  patch on session  Change_workout_class_attribute  workoutClass/updateWorkoutClass/4/  json=${data}
    Log to console  ${response.json()}
