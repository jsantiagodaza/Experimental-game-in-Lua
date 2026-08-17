# GAME DESIGN — RPG 2D / THRILLER
**Versión:** 0.1 — Preproducción  
**Motor:** LÖVE 11.5 | **Lenguaje:** Lua

> Documento vivo. Las decisiones `TBD` quedan abiertas y deben resolverse antes de implementar sistemas grandes.

## 1. Visión
RPG 2D de vista cenital, pixel art y atmósfera de thriller psicológico. Combina exploración, interacción, diálogos con consecuencias, puzzles, misterio y encuentros/confrontaciones.

La referencia conceptual incluye la capacidad de Undertale para dar peso a las acciones del jugador, pero el proyecto debe ser completamente original: no copiar personajes, historia, diálogos, sprites, música, mapas ni otros elementos protegidos.

## 2. Pilares
1. **Narrativa primero:** explorar significa descubrir.
2. **El mundo recuerda:** decisiones importantes pueden cambiar diálogos, relaciones y eventos.
3. **Tensión:** anticipación, silencio, rareza, contradicciones e incertidumbre; no depender de jumpscares.
4. **Personajes memorables:** personalidad, objetivos, contradicciones y evolución.
5. **Mecánicas simples:** profundidad por combinación, no por complejidad innecesaria.

## 3. Presentación
- Cámara: top-down.
- Estética: pixel art 2D.
- Paleta limitada y alto contraste.
- Animaciones pequeñas pero expresivas.
- Resolución interna: **TBD**; proponer resolución pequeña, escalado entero y pixel-perfect.
- Tiles: **TBD**, candidato inicial 16x16 o 32x32.

## 4. Protagonista
Debe caminar, interactuar, examinar, hablar, recoger objetos, abrir puertas, activar eventos y tomar decisiones.
- Nombre: **TBD**
- Estadísticas: mantenerlas simples en el prototipo.

## 5. Movimiento
4 u 8 direcciones. WASD + flechas.
Debe usar `dt`, tener velocidad configurable, colisiones, límites del mapa y bloqueo durante diálogos/eventos.

## 6. Interacción
Acción contextual: NPC → hablar; puerta → abrir/bloquear; objeto → examinar; interruptor → activar; zona → evento.
Acción principal sugerida: `E` / `Enter`, configurable posteriormente.

## 7. Diálogo
Debe soportar cuadro de diálogo, nombre, avance, bloqueo del jugador, elecciones, consecuencias y variables narrativas. El contenido debe vivir fuera del código principal.

## 8. Decisiones y estado
Las decisiones importantes modifican un estado persistente del mundo. Ejemplo conceptual:
```lua
world.flags.helped_guard = true
world.flags.opened_basement = true
```
No crear un sistema gigantesco de flags antes de necesitarlo.

## 9. Exploración
Premiar desviarse del camino, examinar habitaciones, repetir conversaciones, volver a lugares y experimentar.

## 10. Mundo
Dividir en áreas y habitaciones. La estructura técnica definitiva se decidirá durante el prototipo.

## 11. Combate / confrontaciones
**TBD.** Antes de implementarlo definir objetivo, turnos/tiempo real, acciones, daño, defensa, resolución pacífica, enemigos y consecuencias narrativas.

## 12. Enemigos
Cada enemigo importante debe tener propósito narrativo, motivación y consecuencias por evitarlo, enfrentarlo o resolver el conflicto de otra manera.

## 13. Thriller
Construcción sugerida:
`Normalidad → Rareza → Inconsistencia → Sospecha → Revelación → Consecuencia`
Evitar explicar el misterio demasiado pronto.

## 14. Audio
Música ambiental, exploración, encuentros, pasos, puertas, UI, ambiente y silencios intencionales. Audio desacoplado de escenas.

## 15. Guardado
Debe poder persistir posición, mapa, inventario, flags, relaciones y progreso narrativo. Slots/formato: **TBD**.

## 16. UI
Minimalista y coherente con pixel art. Diálogo, inventario, menú, pausa y opciones se construirán progresivamente.

## 17. Arquitectura de contenido
Separar progresivamente `src/`, `data/`, `assets/` y `docs/`.

## 18. Primer vertical slice
Debe demostrar: ventana, jugador, movimiento, colisión, cámara, mapa pequeño, interacción, NPC, diálogo, decisión, consecuencia visible y transición de escena.

## 19. No hacer todavía
No implementar mundo enorme, cientos de objetos, docenas de enemigos, crafting, multiplayer, optimización prematura ni sistemas de habilidades complejos.

## 20. Preguntas pendientes
- Nombre del juego.
- Identidad del protagonista.
- Ambientación.
- Tipo exacto de thriller.
- Reglas sobrenaturales.
- Resolución y tile size.
- Combate.
- Estructura narrativa.
- Duración.
- Áreas.
- Dirección musical.
- Público objetivo.
- Clasificación de contenido.

## 21. Regla para Claude
Si una implementación contradice este documento: detectar la contradicción, explicar el impacto y pedir confirmación antes de cambiar de dirección.
