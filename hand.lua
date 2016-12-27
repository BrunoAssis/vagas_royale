Hand = {}
Hand.w = 340
Hand.h = 600
Hand.bg_color = {0, 0, 255}

Hand.new = function(x, y)
  local self = {}

  self.cards = {}

  self.x = x
  self.y = y

  self.draw = function()
    love.graphics.setColor(Hand.bg_color[1], Hand.bg_color[2], Hand.bg_color[3], 255)
    love.graphics.rectangle("fill", self.x, self.y, Hand.w, Hand.h)

    for i, card in pairs(self.cards) do
      card_x = self.x + Card.w * ((i+1) % 2)
      card_y = self.y + Card.h * (math.floor((i-1) / 2))
      card.draw(card_x, card_y)
    end
  end

  self.update = function(dt)
  end

  self.add_card = function(card)
    table.insert(self.cards, card)
  end

  return self
end