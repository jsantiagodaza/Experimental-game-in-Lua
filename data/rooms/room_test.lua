-- data/rooms/room_test.lua
--
-- Sala de prueba para la FASE 1 del roadmap ("caminar por una habitación
-- y chocar con obstáculos"). Contenido separado del código, como pide
-- ARCHITECTURE.md sección 8.
--
-- NOTA IMPORTANTE: el tile size y la resolución lógica del juego están
-- marcados como TBD en GAME_DESIGN.md (punto 18). Por eso esta sala se
-- define con rectángulos simples en vez de un grid de tiles: para no
-- adelantar esa decisión de diseño. Cuando se defina el tile size, esta
-- sala puede migrarse a esa representación sin romper el resto del código.

return {
    width = 800,
    height = 600,

    playerStart = { x = 384, y = 284 },

    -- Paredes que delimitan la habitación + un obstáculo central de prueba.
    walls = {
        { x = 0,   y = 0,   w = 800, h = 16 },  -- pared superior
        { x = 0,   y = 584, w = 800, h = 16 },  -- pared inferior
        { x = 0,   y = 0,   w = 16,  h = 600 }, -- pared izquierda
        { x = 784, y = 0,   w = 16,  h = 600 }, -- pared derecha

        { x = 300, y = 250, w = 100, h = 100 }, -- obstáculo de prueba
    },
}
