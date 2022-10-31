*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/
${ID}   -1
*** Test Cases ***
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
    [Documentation] Delete workout class by id
    Create Session Delete_workout_class_by_id   ${URL}
    ${response}=  delete on session  Delete_workout_class_by_id  workoutClass/delete/5
    Log to console  ${response.json()}

Change workout class attribute
    [Documentation] Change workout class attribute
    Create session Change workout class attribute  ${URL}
    &{data}=    Create Dictionary     name=newWorkoutClassName
    ${response}=  patch on session Change_workout_class_attribute  workoutClass/updateWorkoutClass/4  json=${data}
    Log to console  ${response.json()}
