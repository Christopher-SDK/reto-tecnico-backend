# reto-tecnico-backend

Repositorio para el reto técnico backend con pruebas automatizadas usando **Karate DSL** para la API de Serverest.

---

## Descripción

Este proyecto contiene pruebas automatizadas para validar los endpoints de la API Serverest (`https://serverest.dev`), incluyendo casos de:

- Registro de usuarios (con generación dinámica de emails únicos).
- Edición de usuarios.
- Validación de errores como email duplicado.
- Otros endpoints relacionados.

Se utilizan **helpers para generación dinámica de datos de prueba** y reportes HTML generados automáticamente para facilitar la revisión de resultados.

---

## Tecnologías usadas

- Karate DSL v1.4.1
- Java 11+
- Maven para gestión de dependencias y ejecución
- JUnit 5 para ejecución de tests
- API pública: https://serverest.dev

---

## Estructura del proyecto

reto-tecnico-backend/
├── src/
│   ├── test/
│   │   ├── java/                
|           ├── users/           # Runner de pruebas JUnit
│   │   └── resources/
│   │       ├── users/           # Features de usuarios (registro, edición, etc.)
├── pom.xml                     # Configuración Maven
├── README.md                   # Este archivo
└── target/                     # Reportes y artefactos compilados

---

## Cómo ejecutar las pruebas

1. Clonar el repositorio:

   git clone https://github.com/Christopher-SDK/reto-tecnico-backend.git
   cd reto-backend-karate

2. Ejecutar pruebas con Maven:

   mvn test

3. Al finalizar, revisar el reporte HTML generado en:

   target/karate-reports/karate-summary.html

   Puedes abrirlo en cualquier navegador para ver resultados detallados.

---

## Generación de datos dinámicos

Se utilizan utilidades integradas en Karate para generar datos de prueba únicos, por ejemplo, para el email:

   * def uniqueEmail = 'user_' + java.time.LocalDateTime.now().toString().replace(/[:.]/g, '') + '@qa.com.br'

Esto evita problemas por datos duplicados y permite que las pruebas sean independientes y repetibles.

---

## Casos de prueba destacados

- Registro de usuario exitoso
- Registro de usuario con email duplicado (error esperado)
- Edición de usuario exitoso
- Creación de usuario por PUT si no existe
- Manejo de errores comunes (email duplicado, etc.)

---

## Mejoras y extensiones

- Añadir más escenarios de prueba para otros recursos API
- Integrar con pipeline CI/CD para ejecución automática
- Añadir pruebas de rendimiento o seguridad
- Refactorizar helpers para reutilización modular

---

## Contacto

Para dudas o sugerencias, contactame a:

Christopher Arias - christopherarias2@gmail.com
