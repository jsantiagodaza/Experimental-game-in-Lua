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

-- Devuelve true si alguna tecla asociada a la acción está presionada ahora mismo.
function Input.isDown(action)
    local keys = bindings[action]
    if not keys then
        return false
    end

    for _, key in ipairs(keys) do
        if love.keyboard.isDown(key) then
            return true
        end
    end

    return false
end

return Input
