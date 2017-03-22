require("card")
require("units.all")

Hand = {}
Hand.w = 340
Hand.h = 600
Hand.bg_color = {0, 0, 255}

Hand.new = function(manager, x, y)
  local self = {}

  self.manager = manager
  self.x = x
  self.y = y

  self.cards = {}

  self.draw = function()
    love.graphics.setColor(Hand.bg_color[1], Hand.bg_color[2], Hand.bg_color[3], 255)
    love.graphics.rectangle("fill", self.x, self.y, Hand.w, Hand.h)

    for _, card in pairs(self.cards) do
      card.draw()
    end
  end

  self.mousepressed = function(x, y, button, istouch)
    for _, card in pairs(self.cards) do
      card.mousepressed(x, y, button, istouch)
    end
  end

  self.mousereleased = function(x, y, button, istouch)
    for _, card in pairs(self.cards) do
      card.mousereleased(x, y, button, istouch)
    end
  end

  self.add_card = function(card)
    table.insert(self.cards, card)
  end

  self.initialize_random_hand = function()
    c1 = Card.new(manager, B2Unit.new(), self.x, self.y)
    c2 = Card.new(manager, CearaUnit.new(), self.x + Card.w, self.y)
    c3 = Card.new(manager, CearaUnit.new(), self.x, self.y + Card.h)
    c4 = Card.new(manager, B2Unit.new(), self.x + Card.w, self.y + Card.h)
    self.add_card(c1)
    self.add_card(c2)
    self.add_card(c3)
    self.add_card(c4)
  end

  self.initialize_random_hand()

  return self
end