local class = require('libs.middleclass')

local Monsters = class("Monsters")

--constructor
function Monsters:initialize(name)
    self.name = name
end