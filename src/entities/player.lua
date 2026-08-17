-- src/entities/player.lua
--
-- Entidad Jugador. Concepto de Lua: usamos una "clase" simple con metatablas
-- (Player.new crea una tabla y le asigna Player como metatabla con __index).
-- Esto es el patrón estándar en Lua para agrupar datos + comportamiento sin
-- necesitar un sistema de clases real como en otros lenguajes.
--
-- El jugador NO decide si puede atravesar una pared: propone hacia dónde
-- quiere moverse y le pregunta al sistema Collision si puede hacerlo.

local Input = require("src.core.input")
local Collision = require("src.systems.collision")

local Player = {}
Player.__index = Player

function Player.new(x, y)
    local self = setmetatable({}, Player)
    self.x = x
    self.y = y
    self.width = 32
    self.height = 32
    self.speed = 200 -- píxeles por segundo (mismo valor que tenía el prototipo original)
    return self
end

function Player:getRect()
    return { x = self.x, y = self.y, w = self.width, h = self.height }
end

function Player:update(dt, solids)
    local dx, dy = 0, 0

    if Input.isDown("move_up") then dy = dy - 1 end
    if Input.isDown("move_down") then dy = dy + 1 end
    if Input.isDown("move_left") then dx = dx - 1 end
    if Input.isDown("move_right") then dx = dx + 1 end

    -- Normalizamos el vector de dirección para que moverse en diagonal
    -- no sea más rápido que moverse en línea recta (Pitágoras: sin esto,
    -- dx=1,dy=1 tendría magnitud sqrt(2) en vez de 1).
    if dx ~= 0 and dy ~= 0 then
        local length = math.sqrt(dx * dx + dy * dy)
        dx = dx / length
        dy = dy / length
    end

    local newX = self.x + dx * self.speed * dt
    local newY = self.y + dy * self.speed * dt

    self.x, self.y = Collision.resolveMove(self:getRect(), newX, newY, solids)
end

function Player:draw()
    -- Rectángulo placeholder (igual que en el prototipo original) hasta que
    -- exista sprite. Ver referencia de estilo compartida para el diseño futuro.
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Player
