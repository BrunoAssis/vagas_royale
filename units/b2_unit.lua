require("units.general_unit")

B2Unit = {}
B2Unit.new = function()
  local self = GeneralUnit.new(4, 4,
                               100,
                               10,
                               2,
                               1,
                               1,
                               {124, 232, 114})
  return self
end