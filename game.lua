Game = {}
Game.scenarios = {}
Game.things = {}
Game.players = {}
Game.scenes = {}

function Game:add_thing(where, what)
    table.insert(self[where], what)
end

function Game:draw()
    for i = 1, #self.scenarios do
        self.scenarios[i]:draw()
    end
    for i = 1, #self.things do
        self.things[i]:draw()
    end
    for i = 1, #self.players do
        self.players[i]:draw()
    end
    for i = 1, #self.scenes do
        self.scenes[i]:draw()
    end
end

function Game:update(dt)
    for i = 1, #self.scenarios do
        self.scenarios[i]:update(dt)
    end
    for i = 1, #self.things do
        self.things[i]:update(dt)
    end
    for i = 1, #self.players do
        self.players[i]:update(dt)
    end
    for i = 1, #self.scenes do
        self.scenes[i]:update(dt)
    end
end