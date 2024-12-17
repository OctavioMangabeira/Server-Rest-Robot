*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Deletando um usuário criado no Server Rest
    Create Session    alias=server_rest    url=https://serverest.dev

    ${RESPONSE}    DELETE On Session    url=/usuarios/Ro8wwPSMYB1HWBOW    alias=server_rest     expected_status=200

    Log To Console    ${RESPONSE.text}


*** Keywords ***