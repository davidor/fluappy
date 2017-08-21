-- Colors
local BACKGROUND_COLOR = { 35, 92, 118 }
local BIRD_COLOR = { 224, 214, 68 }
local PIPE_COLOR = { 94, 201, 72 }
local SCORE_COLOR = { 255, 255, 255 }

-- Positions
local BACKGROUND_POS = { x = 0, y = 0 }
local SCORE_POS = { x = 15, y = 15 }

local love = love

local Painter = {}

function Painter.draw_background(width, height)
  love.graphics.setColor(BACKGROUND_COLOR)

  love.graphics.rectangle(
    'fill',
    BACKGROUND_POS.x,
    BACKGROUND_POS.y,
    width,
    height
  )
end

function Painter.draw_bird(bird)
  love.graphics.setColor(BIRD_COLOR)
  love.graphics.rectangle('fill', bird.x, bird.y, bird.w, bird.h)
end

function Painter.draw_pipe(pipe, playing_area_height)
  love.graphics.setColor(PIPE_COLOR)

  love.graphics.rectangle('fill', pipe.x, 0, pipe.w, pipe.space_y)

  love.graphics.rectangle(
    'fill',
    pipe.x,
    pipe.space_y + pipe.space_h,
    pipe.w,
    playing_area_height - pipe.space_y - pipe.space_h
  )
end

function Painter.draw_score(score)
  love.graphics.setColor(SCORE_COLOR)
  love.graphics.print(score, SCORE_POS.x, SCORE_POS.y, 0, 2, 2)
end

return Painter
