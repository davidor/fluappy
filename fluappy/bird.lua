local Bird = {}
Bird.__index = Bird

function Bird.new(x, y, w, h, gravity, jump_speed)
  local self = setmetatable({}, Bird)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.gravity = gravity
  self.jump_speed = jump_speed
  self.speed = 0.0
  return self
end

function Bird:update_speed(dt)
  self.speed = self.speed + (self.gravity * dt)
end

function Bird:update_pos(dt)
  self.y = self.y + (self.speed * dt)
end

function Bird:jump()
  if self.y > 0 then
    self.speed = self.jump_speed
  end
end

function Bird:fell(area_limit_y)
  return self.y > area_limit_y
end

return Bird
