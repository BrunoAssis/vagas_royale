Card = {}
Card.w = 170
Card.h = 300

Card.new = function(unit)
  local self = {}

  self.unit = unit
  self.color = self.unit.card_color

  self.draw = function(x, y)
    love.graphics.setColor(self.color[1], self.color[2], self.color[3], 255)
    love.graphics.rectangle("fill", x, y, Card.w, Card.h)
  end

  return self
end

