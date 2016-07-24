debug = true

-- Game globals
windowHeight = love.graphics.getHeight()
windowWidth = love.graphics.getWidth()


-- Imports
Gamestate = require 'vendor/gamestate'

require 'game'




menu = {}

function menu:draw()
  love.graphics.print("Press enter", 10, 10)
end

function menu:keyreleased(key, code)
  if key == 'return' then
    Gamestate.switch(game)
  end
end


function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(menu)
end
