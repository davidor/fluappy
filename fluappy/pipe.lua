local love = love

local Pipe = {}
Pipe.__index = Pipe

local function random_pipe_space(min, max)
  return love.math.random(min, max)
end

function Pipe.new(x, reset_x, w, space_y_min, space_y_max, space_h, speed)
  local self = setmetatable({}, Pipe)
  self.x = x
  self.reset_x = reset_x
  self.w = w
  self.space_y_min = space_y_min
  self.space_y_max = space_y_max
  self.space_y = random_pipe_space(space_y_min, space_y_max)
  self.space_h = space_h
  self.speed = speed
  return self
end

function Pipe:move(dt)
  self.x = self.x - (self.speed * dt)

  if not self:is_visible() then
    self:reset_pos()
  end
end

function Pipe:is_visible()
  return self.x + self.w > 0
end

function Pipe:reset_pos()
  self.x = self.reset_x
  self.space_y = random_pipe_space(self.space_y_min, self.space_y_max)
end

return Pipe
