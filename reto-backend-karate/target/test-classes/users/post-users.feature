Feature: Registrar usuario

  Background:
    * def email = 'beltranoas_qameno_' + karate.timestamp + '@qa.com.br'

  Scenario: Registrar usuario exitosamente
    Given url 'https://serverest.dev/usuarios'
    And request
      """
      {
        "nome": "Fulano da Silva",
        "email": "#(email)",
        "password": "teste",
        "administrador": "true"
      }
      """
    When method POST
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"
    And match response._id != null
    * print '✅ Usuario registrado:', response

  Scenario: Registrar usuario con email ya usado
    Given url 'https://serverest.dev/usuarios'
    And request
      """
      {
        "nome": "Fulano da Silva",
        "email": "#(email)",
        "password": "teste",
        "administrador": "true"
      }
      """
    When method POST
    Then status 400
    And match response.message == 'Este email já está sendo usado'
    * print '❌ Error al registrar usuario:', response.message
