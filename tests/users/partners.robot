*** Settings ***
Documentation       POST /users/partners

Resource            ${EXECDIR}/resources/base.robot


*** Test Cases ***
Should create a new partner
    [Tags]    critical

    ${partner}    Factory New Partner
    Remove Partner By Name    ${partner}[fullName]

    ${tokenRequest}     Create Dictionary
    ...    username=contact@gustavoteixeira.dev
    ...    password=kode@123

    ${token}    POST Token    ${tokenRequest}  

    ${authorization}     Create Dictionary
    ...    Authorization=Bearer ${token.json()}[access_token]

    ${response}    POST Partner    ${partner}    ${authorization}

    Status Should Be    201