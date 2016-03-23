accepteds_types = {'rectangle', 'circle', 'edge'}
accepteds_bodytypes = {'dynamic', 'kinematic', 'static'}
object = {}
object.body = nil
object.shape = nil
object.fixture = nil
function object:new(tipo, x, y, bt, width, height) --have to pass all the arguments
    tipo = tipo or 'rectangle'
    if not in_list(accepted_types, tipo) then
        tipo = 'rectangle'
    end
    x, y = x or 0, y or 0
    bt = bt or 'static'
    if not in_list(accepted_bodytypes, bt) then
        bt = 'static'
    end
    width, height = width or 10, height or 10
    local n = {}
    n.body = love.physics.newBody(mundo, x, y, bt)
    if tipo == 'rectangle' then
        n.shape = love.physics.newRectangleShape(width, height)
    elseif tipo == 'circle' then
        n.shape = love.physics.newCircleShape(width)
    elseif tipo == 'edge' then
        n.shape = love.physics.newEdgeShape(0, 0, width, height)
    end
    n.fixture = love.physics.newFixture(n.body, n.shape)
    setmetatable(n, self)
    self.__index = self
    return n
end