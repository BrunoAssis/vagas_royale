require("units.general_unit")

RonieUnit = {}
RonieUnit.new = function()
  local self = GeneralUnit.new(2, 2,
                               30,
                               15,
                               4,
                               2,
                               2,
                               {128, 0, 128})
  return self
end