require("units.general_unit")

CearaUnit = {}
CearaUnit.new = function()
  local self = GeneralUnit.new("Ceará",
                               2, 2,
                               30,
                               15,
                               4,
                               2,
                               2,
                               {128, 0, 128})
  return self
end