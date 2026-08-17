# ROADMAP — RPG 2D LÖVE
**Versión:** 0.1

## FASE 0 — Fundaciones
- [x] LÖVE 11.5
- [x] VS Code + Lua
- [x] Primer programa
- [x] Movimiento básico
- [x] Git + GitHub
- [x] `CLAUDE.md`
- [ ] Documentación de diseño
- [ ] README

## FASE 1 — Prototipo técnico
- [ ] módulo Player
- [ ] movimiento
- [ ] colisión
- [ ] mapa de prueba
- [ ] cámara
- [ ] input centralizado
- [ ] transición básica
**Salida:** caminar por una habitación y chocar con obstáculos.

## FASE 2 — Interacción
- [ ] sistema de interacción
- [ ] objetos examinables
- [ ] puertas
- [ ] interruptores
- [ ] NPC
- [ ] triggers
**Salida:** explorar y modificar elementos del escenario.

## FASE 3 — Diálogo
- [ ] caja
- [ ] nombre
- [ ] avance
- [ ] bloqueo del jugador
- [ ] elecciones
- [ ] datos externos
- [ ] variables narrativas
**Salida:** conversación ramificada funcional.

## FASE 4 — Estado del mundo
- [ ] flags
- [ ] relaciones
- [ ] eventos
- [ ] consecuencias
- [ ] persistencia de sesión
**Salida:** una decisión cambia el mundo.

## FASE 5 — Vertical Slice
- [ ] 1 área
- [ ] 2–4 habitaciones
- [ ] 1 protagonista
- [ ] 2–4 NPC
- [ ] 1 misterio
- [ ] 1 puzzle
- [ ] 1 decisión
- [ ] 1 consecuencia
- [ ] 1 encuentro
- [ ] audio provisional
- [ ] menú
- [ ] guardado
**Salida:** experiencia pequeña jugable de principio a fin.

## FASE 6 — Combate / confrontación
Definir primero objetivo, turnos/tiempo real, acciones, defensa, daño, resolución alternativa, enemigos y consecuencias. Luego prototipar.

## FASE 7 — Producción narrativa
Historia, personajes, diálogos, áreas, eventos y finales.

## FASE 8 — Producción visual
Sprites, tilesets, animaciones, efectos, UI, iluminación y postprocesado.

## FASE 9 — Audio
Música, tensión, combate, ambiente, SFX y mezcla.

## FASE 10 — Sistemas finales
Inventario, guardado completo, opciones, accesibilidad, controles, resolución y escalado.

## FASE 11 — QA
Errores críticos, colisiones, diálogos, guardado, softlocks, eventos, rendimiento y resoluciones.

## FASE 12 — Release
Build Windows, pruebas en máquina limpia, icono, créditos, README, licencia, versión y paquete final.

## Definición de DONE
Una tarea está terminada cuando está implementada, se ejecuta, fue probada, no rompe funcionalidades existentes, está documentada cuando corresponde y fue registrada en Git.

## Commits
Usar commits pequeños y semánticos:
`feat: ...`, `fix: ...`, `refactor: ...`, `docs: ...`

## Prioridad
`Jugabilidad → Estabilidad → Narrativa → Presentación → Optimización`
