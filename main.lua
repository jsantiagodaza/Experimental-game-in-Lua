function love.draw()
    love.graphics.print("Mi primera vaina de lua", 100, 100)
end
-- main.lua

-- Se ejecuta una sola vez al iniciar el juego
function love.load()
    -- Definimos el jugador como una tabla (objeto)
    jugador = {
        x = 400,
        y = 300,
        velocidad = 200, -- píxeles por segundo
        tamano = 32
    }
end

-- Se ejecuta en cada frame. 'dt' es el Delta Time (tiempo entre frames)
function love.update(dt)
    -- Movimiento cenital (Top-Down)
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        jugador.y = jugador.y - jugador.velocidad * dt
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        jugador.y = jugador.y + jugador.velocidad * dt
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        jugador.x = jugador.x - jugador.velocidad * dt
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        jugador.x = jugador.x + jugador.velocidad * dt
    end
end

-- Se encarga de renderizar los gráficos en pantalla
function love.draw()
    -- Dibujamos al jugador como un rectángulo blanco temporal
    love.graphics.rectangle("fill", jugador.x, jugador.y, jugador.tamano, jugador.tamano)
end
