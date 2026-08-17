-- src/systems/collision.lua
--
-- Colisión simple de rectángulos (AABB = Axis-Aligned Bounding Box).
-- Este módulo no sabe nada del jugador, la cámara ni el render: solo recibe
-- rectángulos {x, y, w, h} y decide si se solapan o cómo debería resolverse
-- un movimiento. Esto es lo que ARCHITECTURE.md pide en la sección 12:
-- "Separar colisión del render. El sprite no decide si puede atravesar una pared."

local Collision = {}

-- ¿Se solapan dos rectángulos?
function Collision.checkAABB(a, b)
    return a.x < b.x + b.w
       and a.x + a.w > b.x
       and a.y < b.y + b.h
       and a.y + a.h > b.y
end

-- Intenta mover `rect` hacia (newX, newY) evitando solapar cualquiera de `solids`.
-- Resolvemos cada eje por separado (primero X, luego Y). Esto es lo que permite
-- que el jugador "se deslice" al chocar en diagonal contra una pared, en vez de
-- quedar completamente detenido.
function Collision.resolveMove(rect, newX, newY, solids)
    local resolvedX, resolvedY = rect.x, rect.y

    -- Eje X
    local testRect = { x = newX, y = rect.y, w = rect.w, h = rect.h }
    local blockedX = false
    for _, solid in ipairs(solids) do
        if Collision.checkAABB(testRect, solid) then
            blockedX = true
            break
        end
    end
    if not blockedX then
        resolvedX = newX
    end

    -- Eje Y (usando ya la X resuelta)
    testRect = { x = resolvedX, y = newY, w = rect.w, h = rect.h }
    local blockedY = false
    for _, solid in ipairs(solids) do
        if Collision.checkAABB(testRect, solid) then
            blockedY = true
            break
        end
    end
    if not blockedY then
        resolvedY = newY
    end

    return resolvedX, resolvedY
end

return Collision
