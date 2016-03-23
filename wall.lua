wall = {}
wall.color = {0, 0, 0}
wall.width = 2

function wall:new(x1, y1, x2, y2, color, width)
    local n = nil
    if width > 2 then
        n = object:new('rectangle', x1, y1, 'static', x2 - x1, y2 - y1)
    else
        n = object:new('edge', x1, y1, 'static', x2 - x1, y2 - y1)
    end
    n.color = color
    n.width = width
    setmetatable(n, self)
    self.__index = self
    return n
end

function wall:draw()
    local x1, y1, x2, y2 = self.shape:getPoints( )
    love.graphics.setColor(self.color)
    love.graphics.setLineWidth(self.width)
    love.graphics.line(self.body:getX(), self.body:getY(), 
        self.body:getX() + x2, self.body:getY() + y2)
end