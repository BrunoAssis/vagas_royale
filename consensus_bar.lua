ConsensusBar = {}
ConsensusBar.w = 100
ConsensusBar.h = 600
ConsensusBar.color      = {255, 0, 255}
ConsensusBar.bg_color   = {128, 128, 128}
ConsensusBar.text_color = {255, 255, 0}
ConsensusBar.max_consensuses = 20
ConsensusBar.recharge_time = 0.5 -- seconds
ConsensusBar.consensus_height = ConsensusBar.h / ConsensusBar.max_consensuses

ConsensusBar.new = function(x, y)
  local self = {}

  self.x = x
  self.y = y

  self.current_consensuses = 0

  self.time_since_last_consensus = 0

  self.update = function(dt)
    if self.current_consensuses < ConsensusBar.max_consensuses then
      self.time_since_last_consensus = self.time_since_last_consensus + dt
      
      if self.time_since_last_consensus > ConsensusBar.recharge_time then
        self.time_since_last_consensus = 0
        self.current_consensuses = self.current_consensuses + 1
      end
    end
  end

  self.draw = function()
    love.graphics.setColor(ConsensusBar.bg_color[1], ConsensusBar.bg_color[2], ConsensusBar.bg_color[3], 255)
    love.graphics.rectangle("fill", self.x, self.y, ConsensusBar.w, ConsensusBar.h)

    bar_height = (self.current_consensuses * ConsensusBar.consensus_height)
    bar_y = ConsensusBar.h - bar_height
    love.graphics.setColor(ConsensusBar.color[1], ConsensusBar.color[2], ConsensusBar.color[3], 255)
    love.graphics.rectangle("fill", self.x, bar_y, ConsensusBar.w, bar_height)

    love.graphics.setColor(ConsensusBar.text_color[1], ConsensusBar.text_color[2], ConsensusBar.text_color[3], 255)
    text_x = self.x + (ConsensusBar.w / 2)
    text_y = bar_y + 5
    love.graphics.print(self.current_consensuses, text_x, text_y)
  end

  return self
end