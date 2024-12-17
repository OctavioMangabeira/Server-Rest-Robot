*** Settings ***
Library    RequestsLibrary

*** Variables ***


*** Test Cases ***

Realizando primeiro GET no Faker API
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/

    ${RESPONSE}    GET On Session    alias=faker_api    url=addresses?_quantity=1

    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.text}

    ${RESPONSE}    GET On Session    alias=faker_api    url=books?_quantity=1

    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.text}

    ${return}    Session Exists    alias=faker_api
    Log To Console    ${return}

    Delete All Sessions

    ${return}    Session Exists    alias=faker_api

    Log To Console    ${return}

Realizando outro GET 1
    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/

    ${RESPONSE}    GET On Session    alias=faker_api    url=books?_quantity=1    expected_status=200    msg=Essa mensagem é um teste

    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.text}
    Log To Console    ${RESPONSE.status_code}

    Delete All Sessions

Realizando outro GET 2

    Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/

    ${RESPONSE}    GET On Session   alias=faker_api    url=images?_quantity=3&_type=any&_height=300

    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.text}

    Delete All Sessions

Teste com IF ELSE
     Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/

    ${RESPONSE}    GET On Session   alias=faker_api    url=addresses?_quantity=2

    Log To Console    ${RESPONSE}
    Log To Console    ${RESPONSE.json()['data'][1]['country']}

    ${var}    Set Variable    ${RESPONSE.json()['data'][1]['country']}

    IF    "${var}'=='Brazil"
        Log To Console    Estamos no Brazil
    ELSE
        Log To Console    Estamos no ${var}
    END

    Should Not Be Equal    ${var}    Brazil

    Delete All Sessions

Teste com FOR
     Create Session    alias=faker_api    url=https://fakerapi.it/api/v2/

    FOR    ${i}    IN    RANGE    20

     ${RESPONSE}    GET On Session   alias=faker_api    url=addresses?_quantity=2

    Log To Console    ${RESPONSE.json()['data'][0]['country']}
    ${var}    Set Variable    ${RESPONSE.json()['data'][0]['country']}

   Exit For Loop If    "${var}'=='Brazil"

   Sleep    2s

    END

    Delete All Sessions

*** Keywords ***