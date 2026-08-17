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
local Collision = require("src.systems.collision")

local Game = {}

local room
local roomId
local player
local camera

-- Carga una sala por su id (nombre de archivo en data/rooms/, sin extensión).
-- `spawn` es opcional: si no se da, se usa room.playerStart de esa sala.
local function loadRoom(id, spawn)
    room = require("data.rooms." .. id)
    roomId = id

    local start = spawn or room.playerStart
    if player then
        player.x, player.y = start.x, start.y
    else
        player = Player.new(start.x, start.y)
    end

    camera = Camera.new(room.width, room.height)
end

function Game.load()
    loadRoom("room_test")
end

-- Revisa si el jugador está pisando alguna puerta de la sala actual
-- y, si es así, cambia de sala. Esto es la "transición básica" pedida
-- en FASE 1. El sistema formal de triggers/interacción (con más tipos
-- de eventos) es tarea de FASE 2; esto se limita a puertas.
local function checkDoors()
    if not room.doors then
        return
    end

    local playerRect = player:getRect()

    for _, door in ipairs(room.doors) do
        if Collision.checkAABB(playerRect, door) then
            loadRoom(door.targetRoom, door.targetSpawn)
            return -- una sola transición por frame
        end
    end
end

function Game.update(dt)
    player:update(dt, room.walls)
    checkDoors()
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

    -- Puertas (placeholder visual: un tono distinto para que se puedan ver
    -- durante el prototipo; no existirá cuando haya tileset/arte real).
    if room.doors then
        love.graphics.setColor(0.6, 0.5, 0.2)
        for _, door in ipairs(room.doors) do
            love.graphics.rectangle("fill", door.x, door.y, door.w, door.h)
        end
    end

    player:draw()

    camera:detach()
end

return Game
