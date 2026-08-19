-- src/core/input.lua
--
-- Centraliza el mapeo de teclas a "acciones conceptuales" (move_up, interact, etc.).
-- Concepto de Lua/LÖVE: en vez de preguntar en cada sistema si se presionó "w" o "up",
-- preguntamos si la acción "move_up" está activa. Así, remapear controles o añadir
-- soporte de mando en el futuro solo implica tocar este archivo, no cada sistema
-- que necesita input (ver ARCHITECTURE.md, sección 11).

local Input = {}

-- Cada acción puede tener varias teclas asociadas.
local bindings = {
    move_up    = { "up", "w" },
    move_down  = { "down", "s" },
    move_left  = { "left", "a" },
    move_right = { "right", "d" },
    interact   = { "e", "return" },
    confirm    = { "return", "space" },
    cancel     = { "escape" },
    pause      = { "p" },
}

local previousState = {}
local currentState = {}

-- Debe llamarse al inicio de cada frame para actualizar el estado de las teclas
function Input.update()
    for action, keys in pairs(bindings) do
        previousState[action] = currentState[action] or false
        currentState[action] = false
        for _, key in ipairs(keys) do
            if love.keyboard.isDown(key) then
                currentState[action] = true
                break
            end
        end
    end
end

-- Devuelve true si la tecla está presionada en este momento
function Input.isDown(action)
    return currentState[action] or false
end

-- Devuelve true SOLO en el frame en el que se presionó la tecla
function Input.isJustPressed(action)
    return (currentState[action] == true) and (previousState[action] == false)
end

return Input
