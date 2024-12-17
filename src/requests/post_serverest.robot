*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Fazer um POST para Cadastrar Usuário

    Create Session    alias=server_rest    url=https://serverest.dev

    ${header}    Create Dictionary    Content-Type=application/json

    ${Response}    POST On Session    alias=server_rest    url=/usuarios    expected_status=201    headers=${header}     data={"nome": "Fulano da Silva","email": "beltranoqwqw@qa.com.br","password": "teste","administrador": "true"}

    ${msg}    Set Variable    ${Response.json()['message']}
    Log To Console    ${Response.json}

    Should Be Equal    ${msg}    Cadastro realizado com sucesso