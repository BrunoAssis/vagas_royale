Arena = {}
Arena.tile_size     = 20
Arena.color_grass_a = {126, 219, 123}
Arena.color_grass_b = {7, 199, 0}
Arena.color_bridge  = {128, 128, 0}
Arena.color_river   = {0, 0, 128}

Arena.map = {}
require("map.arena_map")

Arena.new = function(x, y)
  local self = {}

  self.x = x
  self.y = y

  self.draw = function()
    for tile_row, tiles in pairs(Arena.map) do
      for tile_col, tile_type in pairs(tiles) do
        if (tile_type == 0) then
          if (tile_row % 2 == tile_col % 2) then
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

        tile_x = self.x + ((tile_col - 1) * Arena.tile_size)
        tile_y = self.y + ((tile_row - 1) * Arena.tile_size)
        love.graphics.rectangle(
          "fill",
          tile_x,
          tile_y,
          Arena.tile_size,
          Arena.tile_size)
      end
    end
  end

  return self
end
