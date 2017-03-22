Arena = {}
Arena.tile_size     = 20
Arena.color_grass_a = {126, 219, 123}
Arena.color_grass_b = {7, 199, 0}
Arena.color_bridge  = {128, 128, 0}
Arena.color_river   = {0, 0, 128}

Arena.map = {}
require("map.arena_map")
Arena.w = 18 
Arena.h = 30

Arena.new = function(manager, x, y)
  local self = {}

  self.manager = manager
  self.x = x
  self.y = y

  self.mousemoved = function(x, y, dx, dy, istouch)
    if self.manager.dragging_unit ~= nil and
      self.x <= x and x <= self.x + (Arena.tile_size * Arena.w) and
      self.y <= y and y <= self.y + (Arena.tile_size * Arena.h) then
      self.draw_unit_border(self.manager.dragging_unit)
    end
  end

  self.draw = function()
    self.draw_rows()
  end

  self.draw_rows = function()
    for tile_row, tiles in pairs(Arena.map) do
      self.draw_cols(tile_row, tiles)
    end
  end

  self.draw_cols = function(tile_row, tiles)
    for tile_col, tile_type in pairs(tiles) do
      self.draw_tile(tile_row, tile_col, tile_type)
    end
  end

  self.draw_tile = function(row, col, tile_type)
    if (tile_type == 0) then
      if (row % 2 == col % 2) then
        color = Arena.color_grass_a
      else
        color = Arena.color_grass_b
      end
    elseif (tile_type == 1) then
      color = Arena.color_river
    elseif (tile_type == 2) then
      color = Arena.color_bridge
    end

    love.graphics.setColor(color[1], color[2], color[3], 255)

    tile_x = self.x + ((col - 1) * Arena.tile_size)
    tile_y = self.y + ((row - 1) * Arena.tile_size)
    love.graphics.rectangle(
      "fill",
      tile_x,
      tile_y,
      Arena.tile_size,
      Arena.tile_size)
  end

  self.draw_unit_border = function(unit)
    mouse_x = love.mouse.getX()
    mouse_y = love.mouse.getY()

    px_per_unit = Arena.tile_size
    proposed_x = mouse_x - (unit.w * px_per_unit / 2)
    proposed_y = mouse_y - (unit.h * px_per_unit / 2)
    
    clamped_x = proposed_x - (proposed_x % Arena.tile_size)
    clamped_y = proposed_y - (proposed_y % Arena.tile_size)

    print(clamped_x, clamped_y)

    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.rectangle(
      "fill",
      clamped_x,
      clamped_y,
      Arena.tile_size,
      Arena.tile_size)    
  end

  return self
end
