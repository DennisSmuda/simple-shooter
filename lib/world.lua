require 'lib/enemy'

World = {}


function World.load (args)
  enemy.load()
  local img = love.graphics.newImage('assets/fire.png')

	psystem = love.graphics.newParticleSystem(img, 32)
	psystem:setParticleLifetime(2, 5) -- Particles live at least 2s and at most 5s.
	psystem:setEmissionRate(5)
	psystem:setSizeVariation(1)
	psystem:setLinearAcceleration(-5, 0, 5, -20) -- Random movement in all directions.
	psystem:setColors(255, 255, 255, 255, 255, 255, 255, 0) -- Fade to transparency.
end

function World.update (dt)
  psystem:update(dt)
  enemy.update(dt)
end

function World.draw (dt)
  love.graphics.draw(psystem, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5)
  enemy.draw(dt)
end
