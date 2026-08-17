-- src/core/game.lua
--
-- Orquesta el estado general del juego: qué sala está activa, el jugador
-- y la cámara. main.lua solo delega aquí (ARCHITECTURE.md, sección 3);
-- toda la lógica real vive en src/.
--
-- Concepto de Lua: `room`, `player` y `camera` son variables "locales al
-- módulo" (local, fuera de cualquier función, pero dentro de este archivo).
-- No son globales: otros archivos no pueden verlas ni pisarlas por accidente.

local Player = require("src.entities.player")
local Camera = require("src.core.camera")

local Game = {}

local room
local player
local camera

function Game.load()
    room = require("data.rooms.room_test")

    player = Player.new(room.playerStart.x, room.playerStart.y)
    camera = Camera.new(room.width, room.height)
end

function Game.update(dt)
    player:update(dt, room.walls)
    camera:follow(player.x + player.width / 2, player.y + player.height / 2)
end

function Game.draw()
    camera:attach()

    -- Fondo de la sala (placeholder mientras no haya tileset).
    love.graphics.setColor(0.12, 0.12, 0.15)
    love.graphics.rectangle("fill", 0, 0, room.width, room.height)

    -- Paredes de prueba.
    love.graphics.setColor(0.35, 0.35, 0.4)
    for _, wall in ipairs(room.walls) do
        love.graphics.rectangle("fill", wall.x, wall.y, wall.w, wall.h)
    end

    player:draw()

    camera:detach()
end

return Game
