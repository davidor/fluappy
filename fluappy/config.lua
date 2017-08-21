local Config = {
  ['area'] = {
    width = 600,
    height = 775
  },

  ['pipes'] = {
    width = 110,
    space_height = 200,
    space_min_y = 110,
    speed = 150,
    init_x_positions = { 600, 950 }
  },

  ['bird'] = {
    init_x = 124,
    init_y = 400,
    width = 60,
    height = 50,
    gravity = 1032,
    jump_speed = -330
  }
}

return Config
