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
local Transition = require("src.core.transition")
local Input = require("src.core.input")
local Dialogue = require("src.systems.dialogue")

local Game = {}

local room
local roomId
local player
local camera
local activeInteractable = nil

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
local function checkDoors()
    if not room.doors or Transition.isActive() then
        return
    end

    local playerRect = player:getRect()

    for _, door in ipairs(room.doors) do
        if Collision.checkAABB(playerRect, door) then
            Transition.start(door.targetRoom, door.targetSpawn, loadRoom)
            return
        end
    end
end

-- Revisa si el jugador está cerca de un objeto interactuable
local function checkInteractables()
    activeInteractable = nil
    if not room.interactables then return end

    -- Ampliamos el rectángulo del jugador para detectar cercanía
    local pRect = player:getRect()
    local reach = {
        x = pRect.x - 20,
        y = pRect.y - 20,
        w = pRect.w + 40,
        h = pRect.h + 40
    }

    for _, obj in ipairs(room.interactables) do
        if Collision.checkAABB(reach, obj) then
            activeInteractable = obj
            
            -- Si está cerca y presiona E, activamos el diálogo
            if Input.isJustPressed("interact") then
                Dialogue.show(obj.text)
            end
            break -- Solo interactúa con el más cercano en la lista
        end
    end
end

function Game.update(dt)
    Input.update()

    if Dialogue.isActive() then
        Dialogue.update(dt)
        return -- Congela el juego (el jugador no se mueve) mientras haya texto
    end

    -- Congelamos el mundo mientras haya transición
    if not Transition.isActive() then
        player:update(dt, room.walls)
        checkDoors()
        checkInteractables()
    end
    
    Transition.update(dt)
    camera:follow(player.x + player.width / 2, player.y + player.height / 2)
end

function Game.draw()
    camera:attach()

    -- Fondo de la sala
    love.graphics.setColor(0.12, 0.12, 0.15)
    love.graphics.rectangle("fill", 0, 0, room.width, room.height)

    -- Objetos interactuables (Cajas verdes)
    if room.interactables then
        for _, obj in ipairs(room.interactables) do
            love.graphics.setColor(0.2, 0.8, 0.2)
            love.graphics.rectangle("fill", obj.x, obj.y, obj.w, obj.h)
            
            -- Símbolo de "!" arriba del objeto si estamos cerca
            if obj == activeInteractable then
                love.graphics.setColor(1, 1, 1)
                -- Placeholder de texto simple por ahora
                love.graphics.print("!", obj.x + obj.w / 2 - 4, obj.y - 20)
            end
        end
    end

    -- Paredes de prueba
    love.graphics.setColor(0.35, 0.35, 0.4)
    for _, wall in ipairs(room.walls) do
        love.graphics.rectangle("fill", wall.x, wall.y, wall.w, wall.h)
    end

    -- Puertas (amarillas)
    if room.doors then
        love.graphics.setColor(0.6, 0.5, 0.2)
        for _, door in ipairs(room.doors) do
            love.graphics.rectangle("fill", door.x, door.y, door.w, door.h)
        end
    end

    player:draw()

    camera:detach()

    -- Efectos visuales de interfaz sobre toda la pantalla
    Transition.draw()
    Dialogue.draw()
end

return Game
