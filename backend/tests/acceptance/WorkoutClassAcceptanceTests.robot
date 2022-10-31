*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/

*** Test Cases ***

Admin adds workout class
    [Documentation]     Create Workout Class
    Create Session  Create_workout_class   ${URL}
    &{data}=    Create Dictionary     name=Running Class   instructor=Charlie Chaplin   description=Come run with Charlie!   start=2022-11-11   end=2023-08-08   enable=false
    ${response}=   post on session   Create_workout_class    workoutClass/createWorkoutClass   json=${data}
    Log to console   Created workout class with fields: ${response.json()}
    
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
