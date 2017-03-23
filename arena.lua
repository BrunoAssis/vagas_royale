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

  self.draw = function()
    self.draw_arena()
    self.draw_unit_border()
  end

  self.draw_arena = function()
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

  self.draw_unit_border = function()
    if self.is_unit_hovering() then
      coordinates = self.clamp_unit_to_arena(self.manager.dragging_unit)
      love.graphics.setColor(255, 0, 0, 255)
      love.graphics.setLineWidth(2)
      love.graphics.line(coordinates)
    end
  end

  self.clamp_unit_to_arena = function(unit)
    local mouse_x = love.mouse.getX()
    local mouse_y = love.mouse.getY()

    local border_w = unit.w * Arena.tile_size
    local border_h = unit.h * Arena.tile_size

    local origin_x = mouse_x - (border_w / 2)
    local origin_y = mouse_y - (border_h / 2)
   
    local clamped_x_left = origin_x - (origin_x % Arena.tile_size)
    local clamped_x_right = (origin_x + Arena.tile_size) - (origin_x % Arena.tile_size)
    local clamped_y_up = origin_y - (origin_y % Arena.tile_size)
    local clamped_y_down = (origin_y + Arena.tile_size) - (origin_y % Arena.tile_size)

    local clamped_x = (origin_x - clamped_x_left < clamped_x_right - origin_x)
                      and clamped_x_left
                      or clamped_x_right
    local clamped_y = (origin_y - clamped_y_up < clamped_y_down - origin_y)
                      and clamped_y_up
                      or clamped_y_down
    
    return {
      clamped_x, clamped_y,
      clamped_x + border_w, clamped_y,
      clamped_x + border_w, clamped_y + border_h,
      clamped_x, clamped_y + border_h,
      clamped_x, clamped_y
    }
  end

  self.mousereleased = function(x, y, button, istouch)
    if self.is_unit_hovering() and button == 1 then
      self.place_unit()
    end
  end

  self.place_unit = function()
    coordinates = self.clamp_unit_to_arena(self.manager.dragging_unit)
    print(coordinates)
  end

  self.is_unit_hovering = function()
    local mouse_x = love.mouse.getX()
    local mouse_y = love.mouse.getY()

    return self.manager.dragging_unit ~= nil
           and self.x <= mouse_x and mouse_x <= self.x + (Arena.tile_size * Arena.w)
           and self.y <= mouse_y and mouse_y <= self.y + (Arena.tile_size * Arena.h)
  end

  return self
end
