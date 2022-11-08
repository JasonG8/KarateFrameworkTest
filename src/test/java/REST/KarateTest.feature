Feature: plan de pruebas api REST

  @casoGet
  Scenario Outline: caso de pruebas <nombreCaso>
    Given url 'https://reqres.in/api/users/<ID>'
    When header 'content-type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 12000
    When method GET
    And match response.data.id == 2
    Then status <estadoHTTP>
    Examples:
      | nombreCaso        | ID | estadoHTTP |
      | caso id 1         | 1  | 200        |
      | caso id 2         | 2  | 200        |
      | caso id 3         | 3  | 200        |
      | caso id not found | 50 | 404        |

  @casoPost
  Scenario Outline: caso de pruebas <nombreCaso2>
    Given url 'https://reqres.in/api/users'
    When request {"<name>": <Vname>, "<job>": <Vjob>}
    And method POST
    Then status 201
    Examples:
      | nombreCaso2    | name | Vname   | job | Vjob           |
      | name vacio     | name |         | job | "QAs"           |
      | name nulo      | name | null    | job | "QAs"           |
      | name 3 letras  | name | "Jei"   | job | "QAs"           |
      | sin campo name |      |         | job | "QAs"           |
      | job vacio      | name | "Jason" | job | ""             |
      | job nulo       | name | "Jason" | job | null           |
      | job 3 letras   | name | "Jason" | job | "QAAutomation" |
      | sin campo job  | name | "Jason" |     | ""             |

  @casoPostJson
  Scenario Outline: caso de prueba read json <nombreCaso2>
    Given url 'https://reqres.in/api/users'
    When def body = read ('body.json')
    And request body
    And method POST
    Then status 201
    Examples:
      | nombreCaso2    | name | Vname   | job | Vjob           |
      | name vacio     | name |         | job | "QAs"           |
      | name nulo      | name | null    | job | "QAs"           |
      | name 3 letras  | name | "Jei"   | job | "QAs"           |
      | sin campo name |      |         | job | "QAs"           |
      | job vacio      | name | "Jason" | job | ""             |
      | job nulo       | name | "Jason" | job | null           |
      | job 3 letras   | name | "Jason" | job | "QAAutomation" |
      | sin campo job  | name | "Jason" |     | ""             |


  Scenario: caso de prueba tipo POST 2
    Given url 'https://reqres.in/api/users'
    When request
        """
         {
         "name": "Jason",
         "job": "QA"
        }
        """
    And method POST
    Then status 201

  Scenario: caso de prueba tipo DELETE
    Given url 'https://reqres.in/api/users/3'
    When method DELETE
    Then status 204


