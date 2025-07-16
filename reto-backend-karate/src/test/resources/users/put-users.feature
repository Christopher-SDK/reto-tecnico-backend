Feature: Editar usuario por ID

  Scenario: Editar usuario exitosamente
    #Acá genero correos dinamicos para no estar cambiando a cada rato, es otra opción comparada a me feature de post donde es manual:)
    * def uniqueEmail = 'user_' + java.time.LocalDateTime.now().toString().replace(/[:.]/g, '') + '@qa.com.br'
    Given url 'https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1'
    And request
      """
      {
        "nome": "Fulano da Silva",
        "email": "#(uniqueEmail)",
        "password": "teste",
        "administrador": "true"
      }
      """
    When method PUT
    Then status 200
    And match response.message == "Registro alterado com sucesso"
    * print '✅ PUT /usuarios/{id} OK ->', response

  Scenario: Crear usuario si no existe (201)
    * def uniqueEmail2 = 'user_' + java.time.LocalDateTime.now().toString().replace(/[:.]/g, '') + '2@qa.com.br'
    Given url 'https://serverest.dev/usuarios/idNoExistente123'
    And request
      """
      {
        "nome": "Novo Usuario",
        "email": "#(uniqueEmail2)",
        "password": "123456",
        "administrador": "false"
      }
      """
    When method PUT
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"
    * print '✅ PUT /usuarios/{id} - Nuevo usuario creado ->', response

  Scenario: Error si email ya está usado
    # Ahora intentamos editar con ese email duplicado para forzar error, cabe destacar ese correo lo cree antes :)
    Given url 'https://serverest.dev/usuarios/0uxuPY0cbmQhpEz1'
    And request
      """
      {
        "nome": "Otro Usuario",
        "email": "emailexistentedeqa12@qa.com.br",
        "password": "teste",
        "administrador": "true"
      }
      """
    When method PUT
    Then status 400
    And match response.message == "Este email já está sendo usado"
    * print '❌ PUT /usuarios/{id} error email usado ->', response
