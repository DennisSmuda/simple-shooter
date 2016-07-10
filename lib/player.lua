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
player = {
  x = windowWidth/2 - 32,
  y = windowHeight - 100,
  speed = 200,
  bulletSpeed = 300,
  width = 64,
  height = 64,
  img = nil,
  sheet = nil,
  animation = nil
}


-- Load
function player.load()
  player.sheet = love.graphics.newImage('assets/player_full.png');
  player.img = love.graphics.newQuad(0, 0, 64, 64, player.sheet:getDimensions());

  image = love.graphics.newImage('assets/enemy.png')

  local g = anim8.newGrid(32, 32, image:getWidth(), image:getHeight())
  animation = anim8.newAnimation(g('1-4',1), 0.1)


  bulletImg = love.graphics.newImage('assets/bullet.png')
end


-- Upate function
function player.update(dt)
  animation:update(dt)

  -- Move ship left/right inside window bounds
  if love.keyboard.isDown('left', 'a') then
    if player.x > 0 then
      player.moveLeft(dt)
    end
  elseif love.keyboard.isDown('right', 'd') then
    if player.x < (windowWidth - player.width) then
      player.moveRight(dt)
    end
  end

  -- Shot timeout tracker
  canShootTimer = canShootTimer - (1 * dt)
  if canShootTimer < 0 then
    canShoot = true
  end

  -- Shoot
  if love.keyboard.isDown('space', 'lctrl') and canShoot then
    player.shoot()
  end

  -- Update positions of bullets
  for i, bullet in ipairs(bullets) do
    bullet.y = bullet.y - (250 * dt)

    if bullet.y < 0 then -- remove bullets that exit the screen
      table.remove(bullets, i)
    end
  end

end

-- Draw
function player.draw()
  animation:draw(image, 100, 200)

  love.graphics.draw(player.sheet, player.img, player.x , player.y)

  for i, bullet in ipairs(bullets) do
    love.graphics.draw(bullet.img, bullet.x, bullet.y)
  end
end



-- Gameplay functions
function player.shoot()
  -- Create new Bullet and insrt to table
  newBullet = { x = player.x + (player.width/2 - 2), y = player.y + 10, img = bulletImg }
  table.insert(bullets, newBullet)
  canShoot = false
  canShootTimer = canShootTimerMax
end



function player.moveLeft(dt)
  player.x = player.x - (player.speed * dt)
end

function player.moveRight(dt)
  player.x = player.x + (player.speed * dt)
end
