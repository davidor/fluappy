local love = love

local config = require 'config'
local collisions = require 'collisions'
local painter = require 'painter'
local factory = require 'factory'

local bird
local pipes
local score

local function draw_pipes(area_config)
  for _, pipe in ipairs(pipes) do
    painter.draw_pipe(pipe, area_config.height)
  end
end

local function bird_crashed()
  for _, pipe in ipairs(pipes) do
    if collisions.check(bird, pipe) then
      return true
    end
  end

  return false
end

local function reset_game()
  love.load()
end

function love.load()
  love.window.setMode(config.area.width, config.area.height)
  love.window.setTitle('Fluappy')

  bird = factory.create_bird(config.bird)
  pipes = factory.create_pipes(config.pipes, config.area)
  score = 0
end

function love.update(dt)
  bird:update_speed(dt)
  bird:update_pos(dt)

  for _, pipe in ipairs(pipes) do
    pipe:move(dt)
  end

  local bird_fell = bird:fell(config.area.height)
  if bird_fell or bird_crashed() then
    reset_game()
  end
end

function love.keypressed()
  bird:jump()
end

function love.draw()
  painter.draw_background(config.area.width, config.area.height)
  painter.draw_bird(bird)
  draw_pipes(config.area)
  painter.draw_score(score)
end
