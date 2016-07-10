debug = true

-- Game globals
windowHeight = love.graphics.getHeight()
windowWidth = love.graphics.getWidth()


-- Imports
require 'lib/world'
require 'lib/player'

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
  player.update(dt)
end

function love.draw(dt)
  player.draw()
end
