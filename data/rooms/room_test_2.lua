-- data/rooms/room_test_2.lua
-- Segunda habitación para probar las transiciones suaves.

return {
    width = 1280,
    height = 720,

    playerStart = { x = 120, y = 328 },

    -- Paredes que delimitan la habitación
    walls = {
        { x = 0,    y = 0,   w = 1280, h = 16 },  -- pared superior
        { x = 0,    y = 704, w = 1280, h = 16 },  -- pared inferior
        { x = 0,    y = 0,   w = 16,   h = 720 }, -- pared izquierda
        { x = 1264, y = 0,   w = 16,   h = 720 }, -- pared derecha

        -- Un pilar central para que se note que es otra sala
        { x = 600,  y = 200, w = 80,   h = 320 }, 
    },

    -- Puerta de regreso a la primera sala
    doors = {
        { x = 16, y = 300, w = 64, h = 120, targetRoom = "room_test", targetSpawn = { x = 1100, y = 328 } }
    },
}
