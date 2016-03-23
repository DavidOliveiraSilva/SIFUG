function translate_to(player)
    local dx, dy = TX/2 - player:getX(), TY/2 - player:getY()
    love.graphics.translate(dx, dy)
end

function distance(x1, y1, x2, y2)
    return math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2))
end

function in_list(list, obj)
    for i = 1, #list do
        if list[i] == obj then
            return true
        end
    end
    return false
end