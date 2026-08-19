-- src/core/transition.lua
--
-- Sistema de transiciones de pantalla. Se encarga de dibujar el efecto visual
-- y notificar cuando es seguro cargar la nueva sala (punto medio).
-- No modifica el estado del juego directamente, solo avisa mediante un callback.

local Transition = {}

local state = "none" -- "none", "out", "in"
local progress = 0
local speed = 1.5 -- duración de cada mitad de la transición (1.5 indica que completa en ~0.66s)
local targetRoom = nil
local targetSpawn = nil
local onMidpoint = nil

function Transition.start(room, spawn, midpointCallback)
    if state ~= "none" then return end
    state = "out"
    progress = 0
    targetRoom = room
    targetSpawn = spawn
    onMidpoint = midpointCallback
end

function Transition.update(dt)
    if state == "none" then return end

    -- Para que el efecto sea un poco más orgánico, podríamos usar interpolación (easing),
    -- pero para un estilo retro clásico el avance lineal funciona muy bien.
    progress = progress + speed * dt
    if progress >= 1 then
        progress = 1
        if state == "out" then
            state = "in"
            progress = 0
            if onMidpoint then
                onMidpoint(targetRoom, targetSpawn)
            end
        elseif state == "in" then
            state = "none"
        end
    end
end

function Transition.draw()
    if state == "none" then return end

    local squareSize = 40
    local screenW = love.graphics.getWidth()
    local screenH = love.graphics.getHeight()
    
    local cols = math.ceil(screenW / squareSize)
    local rows = math.ceil(screenH / squareSize)
    
    -- Color de la transición (negro)
    love.graphics.setColor(0, 0, 0, 1)
    
    -- state "out": los cuadros crecen desde 0 hasta llenar la pantalla
    -- state "in": los cuadros se reducen desde el tamaño completo hasta 0
    local size = progress * squareSize
    if state == "in" then
        size = (1 - progress) * squareSize
    end
    
    for c = 0, cols - 1 do
        for r = 0, rows - 1 do
            -- Calculamos el centro de cada celda del "entramado"
            local cx = c * squareSize + squareSize / 2
            local cy = r * squareSize + squareSize / 2
            
            -- Dibujamos el cuadro creciendo/encogiéndose desde el centro
            love.graphics.rectangle("fill", cx - size / 2, cy - size / 2, size, size)
        end
    end
end

function Transition.isActive()
    return state ~= "none"
end

return Transition
