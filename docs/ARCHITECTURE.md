# ARCHITECTURE — LÖVE 2D RPG
**Versión:** 0.1 | **Motor:** LÖVE 11.5 | **Lenguaje:** Lua

## 1. Objetivo
Arquitectura modular, pequeña y comprensible. Evitar que `main.lua` se vuelva monolítico.

## 2. Estructura objetivo
```text
/
├── main.lua
├── CLAUDE.md
├── README.md
├── .gitignore
├── docs/
│   ├── GAME_DESIGN.md
│   ├── ARCHITECTURE.md
│   ├── ROADMAP.md
│   └── DEVELOPMENT_RULES.md
├── src/
│   ├── core/
│   ├── entities/
│   ├── systems/
│   ├── scenes/
│   ├── ui/
│   └── utils/
├── assets/
│   ├── sprites/
│   ├── maps/
│   ├── audio/
│   ├── fonts/
│   └── shaders/
├── data/
│   ├── characters/
│   ├── dialogues/
│   ├── items/
│   └── rooms/
└── tests/
```
No crear todo de golpe: cada carpeta aparece cuando exista una necesidad real.

## 3. `main.lua`
Debe ser punto de entrada y delegar al núcleo. Objetivo conceptual:
```lua
function love.load() Game.load() end
function love.update(dt) Game.update(dt) end
function love.draw() Game.draw() end
```

## 4. Core
Posibles módulos: `game.lua`, `state.lua`, `input.lua`, `camera.lua`, `assets.lua`, `audio.lua`, `save.lua`.

## 5. Entidades
`player.lua`, `npc.lua`, `enemy.lua`, `item.lua` cuando sean necesarios.

## 6. Sistemas
Posibles módulos: `collision.lua`, `dialogue.lua`, `combat.lua`, `interaction.lua`, `world.lua`, `save.lua`.

## 7. Escenas
Estados como `MENU`, `WORLD`, `DIALOGUE`, `COMBAT`, `PAUSE`, `GAME_OVER`. No crear una máquina compleja sin necesidad.

## 8. Datos
Contenido separado del código. Por ejemplo:
```lua
return { id = "guard_01", name = "Guardia", dialogues = {...} }
```

## 9. Flujo
```text
Input → Game State → Systems → Entities → Render
```
Las funciones puramente visuales no deberían modificar estado del juego.

## 10. Render
Conceptualmente:
`camera → world → entities → effects → UI`

## 11. Input
Preferir acciones conceptuales (`move_up`, `interact`, `confirm`, `cancel`, `pause`) para facilitar mando y remapeo.

## 12. Colisión
Separar colisión del render. El sprite no decide si puede atravesar una pared.

## 13. Cámara
Independiente del jugador: seguimiento, límites, zoom opcional y conversión mundo/pantalla.

## 14. Diálogo
NPC entrega contenido; sistema controla mostrar, avanzar, elecciones, cierre y consecuencias.

## 15. Estado del mundo
Una fuente clara de verdad para flags, relaciones, progreso, inventario, posición y mapa. Evitar globals dispersos.

## 16. Dependencias
Preferir Lua + LÖVE puro. Toda librería externa debe justificar qué problema resuelve y cómo se mantiene.

## 17. Regla de arquitectura incremental
```text
Prototipo → necesidad real → módulo → refactor → sistema estable
```
No diseñar una arquitectura gigantesca antes de conocer las necesidades.

## 18. Regla de simplicidad
Entre dos soluciones válidas, preferir la más simple, legible, depurable y modificable.

## 19. Regla para Claude
Antes de crear una abstracción nueva, comprobar si existe una necesidad actual y si realmente reduce complejidad.
