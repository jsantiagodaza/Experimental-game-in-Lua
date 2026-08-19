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
    width = 1280,
    height = 720,

    playerStart = { x = 450, y = 300 },

    -- Paredes que delimitan la habitación + un obstáculo central de prueba.
    walls = {
        { x = 0,    y = 0,   w = 1280, h = 16 },  -- pared superior
        { x = 0,    y = 704, w = 1280, h = 16 },  -- pared inferior
        { x = 0,    y = 0,   w = 16,   h = 720 }, -- pared izquierda
        { x = 1264, y = 0,   w = 16,   h = 720 }, -- pared derecha

        { x = 300,  y = 250, w = 100,  h = 100 }, -- obstáculo de prueba
    },

    -- Puertas de transición
    doors = {
        { x = 1200, y = 300, w = 64, h = 120, targetRoom = "room_test_2", targetSpawn = { x = 120, y = 328 } }
    },

    -- Objetos con los que el jugador puede interactuar
    interactables = {
        { x = 500, y = 300, w = 40, h = 40, text = "Esto es una caja..." }
    },
}
