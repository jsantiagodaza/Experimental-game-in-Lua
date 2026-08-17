-- main.lua
--
-- Punto de entrada de LÖVE. Delega toda la lógica al módulo Game
-- (ARCHITECTURE.md, sección 3). Este archivo debe mantenerse así de simple:
-- si necesita crecer, es señal de que algo debería vivir en src/ en su lugar.

local Game = require("src.core.game")

function love.load()
    Game.load()
end

function love.update(dt)
    Game.update(dt)
end

function love.draw()
    Game.draw()
end
