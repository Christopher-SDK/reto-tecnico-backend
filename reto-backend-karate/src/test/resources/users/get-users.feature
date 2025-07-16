Feature: Obtener lista de usuarios

  Scenario: Obtener todos los usuarios exitosamente
    Given url 'https://serverest.dev/usuarios'
    When method GET
    Then status 200
    And match response != null
    And match response.usuarios contains { nome: '#string', email: '#string', password: '#string', administrador: '#string', _id: '#string' }
    * print '✅ Usuarios obtenidos:', response.quantidade, response.usuarios
