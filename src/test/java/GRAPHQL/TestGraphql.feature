@TestGraphql

Feature: plan de pruebas asociado a query graphQL

  Scenario Outline: caso de prueba <nombreCaso>

    Given url 'https://rickandmortyapi.com/graphql'
    When text query =
      """
      query {

  character(id:<numero>){
    name,
    status,
    species,
    gender
  }
}
      """
    And request {query : '#(query)'}
    And method POST
    Then status 200
    Examples:
      | nombreCaso   | numero |
      | casoNormal   | 2      |
      | genero id 13 | 13     |
      | genero id 3  | 3      |
      | genero id 40 | 40     |
      | genero id 10 | 10     |


