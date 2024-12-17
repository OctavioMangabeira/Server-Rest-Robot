*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Fazer um PUT para Editar Usuário

    Create Session    alias=server_rest    url=https://serverest.dev

    ${header}    Create Dictionary    Content-Type=application/json

    ${Response}    PUT On Session    alias=server_rest    url=/usuarios/Ro8wwPSMYB1HWBOW    expected_status=200    headers=${header}     data={"nome": "Fulano da Silva","email": "beltrano@qa4.com.br","password": "teste","administrador": "true"}

    Log To Console    ${response.text}

   


*** Keywords ***