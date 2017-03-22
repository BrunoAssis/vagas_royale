GeneralUnit = {}
GeneralUnit.new = function(name, h, w, hp, damage, move_speed, attack_speed, range, card_color)
  local self = {}

  self.name = name
  self.h = h
  self.w = w
  self.hp = hp
  self.damage = damage
  self.move_speed = move_speed
  self.attack_speed = attack_speed
  self.range = range
  self.card_color = card_color

  self.draw = function(x, y)
    px_per_unit = Arena.tile_size
    love.graphics.setColor(self.card_color[1], self.card_color[2], self.card_color[3], 255)
    px_w = self.w * px_per_unit
    px_h = self.h * px_per_unit
    love.graphics.rectangle("fill", x - (px_w / 2), y - (px_h / 2), px_w, px_h)
  end

  return self
end