
-- Imports
require 'lib/world'
require 'lib/player'

game = {}



function game:enter()
  -- Entities.clear()
  World.load()
  player.load()
end

function game:update(dt)
  if love.keyboard.isDown('escape') then
    -- love.event.push('quit')
    Gamestate.switch(menu)
  end

  World.update(dt)
  player.update(dt)
end

function game:draw()
  World.draw(dt)
  player.draw()

end
