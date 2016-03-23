Player = {}
Player.name = ''
Player.color = {0, 100, 255}
Player.angle = 0
Player.speed = 100

function Player:new(x, y, name, color)
    local n = object:new('rectangle', x, y, 'dynamic', 30, 30)
    n.name = name
    n.color = color
    setmetatable(n, self)
    self.__index = self
    return n
end

function Player:draw() --to Overwrite
    local x1, y1, x2, y2, x3, y3, x4, y4 = self.shape:getPoints( )
    love.graphics.setColor(self.color)
    love.graphics.circle('fill', self.body:getX(), self.body:getY(), 15)
    love.graphics.setColor(0, 0, 0)
    love.graphics.circle('line', self.body:getX(), self.body:getY(), 15)
    --love.graphics.print(string.format("%d, %d", self.body:getX(), self.body:getY()), self.body:getX(), 100, 0, 0.2, 0.2)
    
end
function Player:update(dt)
    self.angle = math.atan2(self.body:getY() - love.mouse.getY(),
        self.body:getX() - love.mouse.getX())
    local sx, sy = 0, 0
    if keyDown('w') then
        sy = -self.speed
    end
    if keyDown('s') then
        sy = sy + self.speed
    end
    if keyDown('a') then
        sx = -self.speed
    end
    if keyDown('d') then
        sx = sx + self.speed
    end
    
    if not (keyDown('w') or keyDown('s') or keyDown('a') or keyDown('d')) then
        sx, sy = 0, 0
    end
    self.body:setLinearVelocity(sx, sy)
end
function Player:getPos()
    return self.body:getX(), self.body:getY()
end
function Player:getX()
    return self.body:getX()
end
function Player:getY()
    return self.body:getY()
end

function isDown(k)
    return love.keyboard.isDown(k)
end

