local Pipe = require 'pipe'
local Bird = require 'bird'

local Factory = {}

function Factory.create_bird(bird_config)
  return Bird.new(
    bird_config.init_x,
    bird_config.init_y,
    bird_config.width,
    bird_config.height,
    bird_config.gravity,
    bird_config.jump_speed
  )
end

-- This method instantiates two pipes. These two are the only ones instantiated
-- until the bird dies. When a pipe disappears to the left of the screen, its
-- position is reset instead of instantiating a new pipe.
function Factory.create_pipes(pipes_config, area_config)
  local pipes = {}

  for _, pos_x in ipairs(pipes_config.init_x_positions) do
    local pipe = Pipe.new(
      pos_x,
      area_config.width,
      pipes_config.width,
      pipes_config.space_min_y,
      area_config.height - pipes_config.space_height,
      pipes_config.space_height,
      pipes_config.speed
    )

    table.insert(pipes, pipe)
  end

  return pipes
end

return Factory
