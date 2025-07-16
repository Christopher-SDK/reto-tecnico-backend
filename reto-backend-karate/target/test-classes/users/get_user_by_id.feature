Feature: Obtener usuario por ID

  Scenario: Buscar usuario por ID exitosamente
    Given url 'https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1'
    When method GET
    Then status 200
    And match response ==
  """
  {
    "nome": "#string",
    "email": "#string",
    "password": "#string",
    "administrador": "#string",
    "_id": "0uxuPY0cbmQhpEz1"
  }
  """
    * print '✅ [GET] /usuarios/{id} - Usuario obtenido correctamente:', response

  Scenario: Buscar usuario por ID que no existe
    Given url 'https://serverest.dev/usuarios/idNoExistente123'
    When method GET
    Then status 400
    And match response.message == 'Usuário não encontrado'
    * print '❌ [GET] /usuarios/{id} - Usuario no encontrado:', response.message
