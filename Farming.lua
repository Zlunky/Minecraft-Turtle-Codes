-- Farming Carrot EX

-- Function to check if carrot if fully grown
local function isCarrotFullyGrown()
    -- Get details about carrot
    local success, data = turtle.inspect
    if success then
        -- Check if the block is a carrot and fully grown (REMEMBER DATA VALUE IS 7 FOR FULLY GROWN)
        return data.name == "minecraft:carrots" and data.state.age == 7
        end
    end
    return false
end


-- Function to plant carrot
local function plantCarrot()
    -- Checks if carrot is in INV
    local item = turtle.getIemDetail(i)
    if item and item.name == "minecraft:carrot" then
        turtle.select(i)
        turtle.place()
        return true
        end
    end
    return false
end

-- Main farming loop 
local function farmCarrots()
    while true do
        -- Checks if carrot is grown
        if isCarrotFullyGrown() then
            -- Harvest
            turtle.dig()
            --replace carrot
            if not plantCarrot() then
                print("Out of carrots holy moly please you son of a goofy give me carrots")
                return
            end
        end
        -- wait before checking again (Adjust the delay if needed)
        os.sleep(10)
    end
    
end

-- Start
farmCarrots()