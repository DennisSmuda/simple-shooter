local anim8 = require 'vendor/anim8'

-- Variables
local canShoot = true
local canShootTimerMax = 0.5
local canShootTimer = canShootTimerMax

-- Assets
local bulletImg = nil

-- Entities
local bullets = {}

-- Export Object
enemy = {
  x = windowWidth/2 - 32,
  y = 100,
  speed       = 100,
  bulletSpeed = 200,
  width       = 64,
  height      = 64,
  direction   = nil,
  img         = nil,
  sheet       = nil,
  grid        = nil,
  animation   = nil,
}

-- Load
function enemy.load()
  print('enemy load')

  enemy.image     = love.graphics.newImage('assets/enemy.png')
  enemy.grid      = anim8.newGrid(32, 32, enemy.image:getWidth(), enemy.image:getHeight())
  enemy.animation = anim8.newAnimation(enemy.grid('1-4',1), 0.1)

  bulletImg = love.graphics.newImage('assets/enemy-bullet.png')
end


-- Upate function
function enemy.update(dt)
  enemy.animation:update(dt)

end


-- Draw
function enemy.draw(dt)
  enemy.animation:draw(enemy.image, 100, 200)
end
