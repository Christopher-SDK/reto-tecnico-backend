Feature: Eliminar usuario por ID

  Scenario: Eliminar usuario exitosamente o sin registros eliminados
    Given url 'https://serverest.dev/usuarios/oH6ONqbWDcUFCMP4'
    When method DELETE
    Then status 200
    And match response.message == '#? _.contains("Registro excluído") || _.contains("Nenhum registro")'
    * print '✅ DELETE /usuarios/{id} ->', response

  Scenario: Intentar eliminar usuario con carrito asociado
    Given url 'https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1'
    When method DELETE
    Then status 400
    And match response.message == 'Não é permitido excluir usuário com carrinho cadastrado'
    * print '❌ DELETE /usuarios/{id} FAIL ->', response
