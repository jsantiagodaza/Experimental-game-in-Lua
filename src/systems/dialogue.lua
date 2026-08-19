-- src/systems/dialogue.lua
--
-- Sistema básico de diálogos/cuadros de texto.
-- Por ahora muestra un mensaje en la parte inferior de la pantalla y se cierra al presionar 'interact'.
-- Más adelante, aquí se manejarán ramas, opciones y consecuencias narrativas.

local Input = require("src.core.input")

local Dialogue = {}

local active = false
local currentText = ""

function Dialogue.show(text)
    active = true
    currentText = text
end

function Dialogue.update(dt)
    if not active then return end

    -- Si apretamos interactuar ("E" o "Enter"), cerramos el diálogo por ahora.
    -- (Luego aquí se avanzaría a la siguiente página de texto si hubiera).
    if Input.isJustPressed("interact") then
        active = false
    end
end

function Dialogue.draw()
    if not active then return end

    local screenW = love.graphics.getWidth()
    local screenH = love.graphics.getHeight()
    local boxHeight = 150
    local margin = 40
    local boxY = screenH - boxHeight - margin

    -- Fondo negro translúcido
    love.graphics.setColor(0, 0, 0, 0.85)
    love.graphics.rectangle("fill", margin, boxY, screenW - margin * 2, boxHeight)
    
    -- Borde blanco
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setLineWidth(3)
    love.graphics.rectangle("line", margin, boxY, screenW - margin * 2, boxHeight)

    -- Texto
    love.graphics.setColor(1, 1, 1, 1)
    -- printf permite alinear texto y hacer salto de línea automático si es muy largo
    love.graphics.printf(currentText, margin + 20, boxY + 20, screenW - margin * 2 - 40, "left")
end

function Dialogue.isActive()
    return active
end

return Dialogue
