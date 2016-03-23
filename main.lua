function love.load()
    TX, TY = 800, 450
    love.window.setMode(TX, TY, {borderless=true})
    keyDown = love.keyboard.isDown
    fonts = {
        ['earth'] = love.graphics.newFont('fonts/Earth.otf', 80),
        ['lavi'] = love.graphics.newFont('fonts/Lavi.ttf', 80),
        ['easy'] = love.graphics.newFont('fonts/Easy going stroke.ttf', 96),
        ['domestic'] = love.graphics.newFont('fonts/Domestic.ttf', 96)
    }
    mundo = love.physics.newWorld(0, 0)
    require 'relogio'
    require 'class'
    require 'all_messages'
    require 'bgms'
    require 'objects'
    require 'utils'
    require 'wall'
    require 'player'
    require 'map'
    require 'game'
    
    --EXAMPLE:
    Game:add('scenarios', Scenario:new({
        maps = {Map:new({
            name = 'initial',
            walls = {Wall:new(0, 400, 800, 400),
                     Wall:new(0, 300, 750, 300),
                     Wall:new(0, 400, 0, 300),
                     Wall:new(800, 400, 800, 0),
                     Wall:new(750, 300, 750, 50),
                     Wall:new(750, 50, 700, 50),
                     Wall:new(700, 50, 700, 0),
                     Wall:new(700, 0, 750, 0)},
            squares = {event_square:new(coordinates = {700, 0, 50, 50} )}
            })},
        
        }))
    Game:add('players', Player:new(-900, 0, 'david'))

end

function love.update(dt)
    mundo:update(dt)
    Game:update(dt)
end

function love.draw()
    Game:draw()
end

function love.keypressed(key)
    
    if key == 'escape' then
        love.event.quit()
    end
end

