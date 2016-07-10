debug = true

-- Game globals
windowHeight = love.graphics.getHeight()
windowWidth = love.graphics.getWidth()


-- Imports
require 'lib/player'

-- Variables
canShoot = true
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax


-- Assets
bulletImg = nil

-- Entities
bullets = {}


-- Objects
player1 = {
  x = windowWidth/2 - 32,
  y = windowHeight - 100,
  speed = 150,
  width = 64,
  height = 64,
  img = nil,
  sheet = nil
}

function player1.shoot()
  -- Create new Bullet and insrt to table
  newBullet = { x = player1.x + (player1.width/2), y = player1.y, img = bulletImg }
  table.insert(bullets, newBullet)
  canShoot = false
  canShootTimer = canShootTimerMax
end




function love.load()
  player1.sheet = love.graphics.newImage('assets/player_full.png');
  player1.img = love.graphics.newQuad(0, 0, 64, 64, player1.sheet:getDimensions());

  bulletImg = love.graphics.newImage('assets/bullet.png')
end

function love.update(dt)
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  -- Move ship left/right inside window bounds
  if love.keyboard.isDown('left', 'a') then
    if player1.x > 0 then
      player1.x = player1.x - (player1.speed * dt)
    end
  elseif love.keyboard.isDown('right', 'd') then
    if player1.x < (windowWidth - player1.width) then
      player1.x = player1.x + (player1.speed * dt)
    end
  end

  -- Shot timeout tracker
  canShootTimer = canShootTimer - (1 * dt)
  if canShootTimer < 0 then
    canShoot = true
  end

  -- Shoot
  if love.keyboard.isDown('space', 'lctrl') and canShoot then
    player1.shoot()
  end

  -- Update positions of bullets
  for i, bullet in ipairs(bullets) do
    bullet.y = bullet.y - (250 * dt)

    if bullet.y < 0 then -- remove bullets that exit the screen
      table.remove(bullets, i)
    end
  end
end

function love.draw(dt)
  love.graphics.draw(player1.sheet, player1.img, player1.x , player1.y)

  for i, bullet in ipairs(bullets) do
    love.graphics.draw(bullet.img, bullet.x, bullet.y)
  end
end
