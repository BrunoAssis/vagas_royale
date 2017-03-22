require("arena")
require("consensus_bar")
require("hand")
require("manager")

function love.load()
  manager = Manager.new()
  arena = Arena.new(manager, 0, 0)
  consensus_bar = ConsensusBar.new(360, 0)
  hand = Hand.new(manager, 460, 0)
end

function love.mousepressed(x, y, button, istouch)
  hand.mousepressed(x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
  hand.mousereleased(x, y, button, istouch)
end

function love.mousemoved(x, y, dx, dy, istouch)
  arena.mousemoved(x, y, dx, dy, istouch)
end

function love.update(dt)
  consensus_bar.update(dt)
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
