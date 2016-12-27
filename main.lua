require("arena")
require("consensus_bar")
require("hand")
require("card")

require("units.all")

function love.load()
  arena = Arena.new(0, 0)
  consensus_bar = ConsensusBar.new(360, 0)
  hand = Hand.new(460, 0)
  c1 = Card.new(B2Unit.new())
  c2 = Card.new(RonieUnit.new())
  c3 = Card.new(RonieUnit.new())
  c4 = Card.new(B2Unit.new())
  hand.add_card(c1)
  hand.add_card(c2)
  hand.add_card(c3)
  hand.add_card(c4)
end

function love.update(dt)
  consensus_bar.update(dt)
  hand.update(dt)
end

function love.draw()
  love.graphics.clear()
  arena.draw()
  consensus_bar.draw()
  hand.draw()
end

function love.quit()
  print("Bye")
end
