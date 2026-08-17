# DEVELOPMENT RULES

## Método
`Analizar → Planificar → Implementar → Ejecutar → Probar → Revisar → Documentar → Commit`

## Claude no debe adivinar
Consultar antes de tomar decisiones importantes de diseño, narrativa, arquitectura, experiencia del jugador o dependencias.

## Cambios pequeños
No reescribir el proyecto completo para una feature pequeña.

## Antes de programar
Revisar `CLAUDE.md`, documentación relevante, archivos relacionados y estado de Git.

## Después de programar
Ejecutar el juego, comprobar errores, describir cambios, declarar limitaciones y proponer el siguiente paso.

## Git
No ejecutar `git reset --hard`, borrado masivo, rebase destructivo o force push sin autorización explícita.

## Dependencias
Toda dependencia nueva debe justificar qué problema resuelve, por qué no basta LÖVE/Lua puro y cómo se instala.

## Código educativo
Cuando aparezca un concepto nuevo de Lua/LÖVE, explicarlo brevemente.

## No sobreingeniería
No introducir ECS, dependency injection, event bus complejo o arquitectura enterprise sin necesidad concreta.

## Assets
No reemplazar assets existentes sin autorización. Placeholders son válidos durante prototipado.

## Narrativa
No inventar hechos oficiales del canon sin autorización. Claude puede proponer ideas, pero debe distinguir propuestas de decisiones oficiales.

## Documentación
Si una decisión cambia arquitectura, diseño o roadmap, actualizar el documento correspondiente.

## DONE
Una feature está terminada cuando funciona dentro del juego, no solo cuando el archivo existe.
