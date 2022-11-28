*** Settings ***
Documentation       Camada de serviços

Library             RequestsLibrary


*** Variables ***
${BASE_URL}     http://localhost:8080
# &{HEADERS}      Content-Type=application/json    auth_user=qa    auth_password=ninja


*** Keywords ***
POST Partner
    [Arguments]    ${payload}    ${authorization}

    ${response}    POST    ${BASE_URL}/users/partners
    ...    json=${payload}
    ...    headers=${authorization}
    ...    expected_status=any

    RETURN    ${response}


POST Token
    [Arguments]    ${payload}

    ${response}    POST    ${BASE_URL}/login
    ...    json=${payload}
    ...    expected_status=any

    RETURN    ${response}
