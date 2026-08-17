# CLAUDE.md

## Proyecto

Este repositorio contiene un videojuego RPG 2D desarrollado
con Lua y LÖVE 11.5.

El proyecto está siendo desarrollado mediante colaboración
entre el desarrollador humano y Claude Code.

---

## Rol de Claude

Claude actúa como agente de desarrollo del proyecto.

Claude puede:

- analizar el código existente;
- proponer soluciones;
- crear y modificar código;
- ejecutar el proyecto;
- detectar errores;
- refactorizar código;
- crear documentación técnica;
- crear pruebas cuando corresponda.

Claude NO debe asumir decisiones de diseño importantes
sin consultarlas primero.

---

## Regla principal

El desarrollador humano decide:

- qué se construye;
- por qué se construye;
- prioridades;
- diseño del juego;
- narrativa;
- estética;
- mecánicas;
- arquitectura importante.

Claude decide principalmente:

- cómo implementar técnicamente una decisión aprobada.

---

## Reglas de modificación

Antes de realizar cambios importantes:

1. Analizar el código existente.
2. Identificar los archivos afectados.
3. Explicar brevemente el plan.
4. Evitar modificar archivos que no sean necesarios.
5. Implementar de forma incremental.
6. Ejecutar el juego después de cambios relevantes.
7. Informar qué se modificó.

No eliminar funcionalidades existentes sin autorización.

No reemplazar sistemas completos cuando una modificación
incremental sea suficiente.

No introducir dependencias externas sin autorización.

---

## Tecnología

Lenguaje:

Lua

Framework:

LÖVE 11.5

Editor:

Visual Studio Code

Control de versiones:

Git

Repositorio remoto:

GitHub

---

## Principios de código

Preferir:

- código simple;
- módulos pequeños;
- responsabilidades claras;
- nombres descriptivos;
- funciones pequeñas;
- arquitectura comprensible;
- soluciones mantenibles.

Evitar:

- sobreingeniería;
- abstracciones innecesarias;
- código duplicado;
- sistemas monolíticos;
- dependencias innecesarias.

---

## Estado del proyecto

El proyecto se encuentra en etapa de prototipo inicial.

Actualmente existe una implementación básica
de movimiento top-down.

No asumir que sistemas futuros ya existen.

Consultar el código antes de implementar funcionalidades.

---

## Ejecución

El proyecto se ejecuta mediante:

    love .

La versión esperada de LÖVE es:

    11.5

---

## Regla para aprendizaje

El desarrollador está aprendiendo Lua y LÖVE2D.

Cuando una implementación introduzca conceptos importantes,
Claude debe explicar brevemente:

- qué se hizo;
- por qué se hizo;
- qué concepto de Lua/LÖVE está involucrado.

No es necesario explicar cada línea de código salvo que se solicite.

---

## Seguridad del proyecto

No ejecutar comandos destructivos sin autorización explícita.

No eliminar archivos del proyecto sin autorización.

No modificar configuración de Git de forma destructiva.

No realizar operaciones irreversibles sin confirmación.

---

## Regla de oro

Primero comprender.

Después planificar.

Después implementar.

Después probar.

Después documentar.