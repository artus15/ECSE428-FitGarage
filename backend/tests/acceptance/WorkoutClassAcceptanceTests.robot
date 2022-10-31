*** Settings ***
Library  RequestsLibrary

*** Variables ***
${URL}  http://127.0.0.1:8000/

*** Test Cases ***

Admin adds workout class
    [Documentation]     Create Workout Class
    Create Session  Create_workout_class   ${URL}
    &{data}=    Create Dictionary     name="Running Class"   instructor=Charlie Chaplin   description=Come run with Charlie!   start=2022-11-11   end=2023-08-08   enable=false
    ${response}=   post on session   Create_workout_class    workoutClass/createWorkoutClass   json=${data}
    Log to console   Created workout class with fields: ${response.json()}