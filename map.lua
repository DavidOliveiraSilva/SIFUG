event_square = class:new()
event_square.coordinates = {0, 0, 10, 10}
function event_square:test(x, y)
    if x >= self.coordinates[1] and 
        x <= self.coordinates[1] + self.coordinates[3] and
        y >= self.coordinates[2] and
        y <= self.coordinates[2] + self.coordinates[4] then
        return true
    end
    return false
end

Map = class:new()
Map.walls = {}
Map.name = ''
Map.squares = {}

function Map:draw()
    for i = 1, #self.walls do
        self.walls[i]:draw()
    end
end
function Map:update(dt)
    
end
function Map:test_squares(x, y)
    for i = 1, #self.squares do
        if self.squares[i]:test(x, y) then
            return i
        end
    end
    return 0 --means NO
end
function Map:test_square(x, y, sqr_id)
    if self.squares[sqr_id]:test(x, y) then
        return true
    end
    return false
end

Scenario = class:new()
Scenario.maps = {}
Scenario.activated_maps = {}
Scenario.events = {}
Scenario.things = {} --random things.. MUST HAVE :draw() and :update(dt) methods

function Scenario:draw()
    for i = 1, #self.maps do
        if in_list(self.activated_maps, i) then
            self.maps[i]:draw()
        end
    end
    for i = 1, #self.things do
        self.things[i]:draw()
    end
end
function Scenario:update(dt)
    for i = 1, #self.maps do
        if in_list(self.activated_maps, i) then
            self.maps[i]:update(dt)
        end
    end
    for i = 1, #self.things do
        self.things[i]:update(dt)
    end
end