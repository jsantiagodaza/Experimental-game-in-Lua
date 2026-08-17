-- src/core/camera.lua
--
-- Cámara simple, independiente del jugador (ARCHITECTURE.md, sección 13):
-- solo sabe seguir una posición (x, y) y quedarse dentro de los límites
-- del mundo actual. No sabe qué es un "jugador".
--
-- Concepto de LÖVE: love.graphics.translate desplaza el origen de dibujo.
-- Si trasladamos por (-camera.x, -camera.y) antes de dibujar el mundo,
-- todo se ve como si la "cámara" se hubiera movido a (camera.x, camera.y).

local Camera = {}
Camera.__index = Camera

function Camera.new(worldWidth, worldHeight)
    local self = setmetatable({}, Camera)
    self.x = 0
    self.y = 0
    self.worldWidth = worldWidth
    self.worldHeight = worldHeight
    return self
end

function Camera:follow(targetX, targetY)
    local screenW = love.graphics.getWidth()
    local screenH = love.graphics.getHeight()

    local desiredX = targetX - screenW / 2
    local desiredY = targetY - screenH / 2

    -- No mostrar fuera de los límites del mundo, salvo que el mundo sea
    -- más pequeño que la pantalla (en ese caso, centrarlo).
    if self.worldWidth > screenW then
        desiredX = math.max(0, math.min(desiredX, self.worldWidth - screenW))
    else
        desiredX = -(screenW - self.worldWidth) / 2
    end

    if self.worldHeight > screenH then
        desiredY = math.max(0, math.min(desiredY, self.worldHeight - screenH))
    else
        desiredY = -(screenH - self.worldHeight) / 2
    end

    self.x = desiredX
    self.y = desiredY
end

function Camera:attach()
    love.graphics.push()
    love.graphics.translate(-self.x, -self.y)
end

function Camera:detach()
    love.graphics.pop()
end

return Camera
