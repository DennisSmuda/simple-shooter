

function love.load()
  World.load()
  player:load()
end

function love.update(dt)
  -- Exit game on Escape
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  -- update player
  World.update(dt)
  player.update(dt)
end

function love.draw(dt)
  World.draw(dt)
  player.draw()
end
