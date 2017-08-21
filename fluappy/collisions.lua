local Collisions = {}

function Collisions.check(bird, pipe)
  -- There is a collision when these 3 conditions are met:
  --   1) Left edge of bird is to the left of the right edge of pipe.
  --   2) Right edge of bird is to the right of the left edge of pipe.
  --   3) Top edge of bird is above the bottom edge of first pipe segment OR
  --      bottom edge of bird is below the top edge of second pipe segment.
  return (bird.x < pipe.x + pipe.w) and
         (bird.x + bird.w > pipe.x) and
         ((bird.y < pipe.space_y) or
             (bird.y + bird.h > pipe.space_h + pipe.space_y))
end

return Collisions
