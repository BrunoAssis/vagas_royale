GeneralUnit = {}
GeneralUnit.new = function(h, w, hp, damage, move_speed, attack_speed, range, card_color)
  local self = {}

  self.h = h
  self.w = w
  self.hp = hp
  self.damage = damage
  self.move_speed = move_speed
  self.attack_speed = attack_speed
  self.range = range
  self.card_color = card_color

  return self
end