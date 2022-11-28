*** Settings ***
Documentation       Database helpers connection

Library             RobotMongoDBLibrary.Delete
Library             RobotMongoDBLibrary.Find


*** Variables ***
&{MONGO_PARTNER_URI}    connection=mongodb://localhost:27017/EasyGest    database=EasyGest    collection=Users
&{MONGO_CUSTOMER_URI}    connection=mongodb://localhost:27017/EasyGest    database=EasyGest    collection=Customer


*** Keywords ***
Remove Partner By Name
    [Arguments]    ${partner_name}

    ${filter}    Create Dictionary
    ...    fullName=${partner_name}

    DeleteOne    ${MONGO_PARTNER_URI}    ${filter}

Find Partner By Name
    [Arguments]    ${partner_name}

    ${filter}    Create Dictionary
    ...    name=${partner_name}

    ${results}    Find    ${MONGO_CUSTOMER_URI}    ${filter}
    RETURN    ${results}[0]

