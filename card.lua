Card = {}
Card.w = 170
Card.h = 300

Card.new = function(manager, unit, x, y)
  local self = {}

  self.manager = manager
  self.unit = unit
  self.color = self.unit.card_color
  self.x = x
  self.y = y

  self.dragging = false

  self.draw = function()
    if self.dragging then
      self.draw_unit()
    else
      self.draw_card()
    end
  end

  self.draw_card = function()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3], 255)
    love.graphics.rectangle("fill", self.x, self.y, Card.w, Card.h)
  end

  self.draw_unit = function()
    self.unit.draw(love.mouse.getX(), love.mouse.getY())
  end

  self.mousepressed = function(x, y, button, istouch)
    if manager.dragging_unit == nil and
      self.x <= x and x <= self.x + Card.w and
      self.y <= y and y <= self.y + Card.h then
       self.dragging = true
       self.manager.dragging_unit = self.unit
    end
  end

  self.mousereleased = function(x, y, button, istouch)
    if self.dragging then
      self.dragging = false
      self.manager.dragging_unit = nil
    end
  end

  return self
end

