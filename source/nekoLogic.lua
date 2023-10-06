-----------------------------NEKO AI

local function nekoAI()
    --
    nekoDirectionToCursor = nekoPos - cursorPos
    nekoDirectionToCursor:normalize()
    if nekoIsMovable() then
        --moves neko to the cursor (ty sarah <3)
        nekoPos -= nekoDirectionToCursor * nekoPace
    end
    --the extent of the inner bounds
    nekoPos.x = clamp(nekoPos.x, 28, 372)
    nekoPos.y = clamp(nekoPos.y, 28, 213)
    --
    movementVector = nekoPos - cursorPos
end

-----------------------------NEKO ANIM TIMERS AND STATES

local function nekoIdleFunc()
    washCountdown -= 0.1
    if washCountdown > 0.0
    then
        nekoState = "wash"
    else
        itchCountdown -= 0.1
        if itchCountdown > 0.0
        then
            nekoState = "itch"
        else
            yawnCountdown -= 0.1
            if yawnCountdown > 0.0
            then
                nekoState = "yawn"
            else
                nekoState = "sleep"
            end
        end
    end
    -- return to normal state after idle
    if isCursorInBounds() and not cursorIsStill() then nekoState = "alert" end
end

local function nekoAlertFunc()
    --
    stillCountdown = 3.0
    alertCountdown -= 0.1
    if alertCountdown < 0.0
    then
        alertCountdown = 2.0
        washCountdown = 6.0
        itchCountdown = 4.0
        yawnCountdown = 2.0
        scratchCountdown = 6.0
        --sets a state for a single frame
        nekoState = "still"
    end
end

-----------------------------NEKO STATES

local function nekoStates()
    if nekoState ~= "alert" then
        --MOVEMENT
        if movementVector.x < 40 and movementVector.x > -40 and movementVector.y > 10 then
            nekoState = "up"
        end
        --
        if movementVector.x < 40 and movementVector.x > -40 and movementVector.y < -10 then
            nekoState = "down"
        end
        --
        if movementVector.y < 20 and movementVector.y > -20 and movementVector.x < -10 then
            nekoState = "right"
        end
        --
        if movementVector.y < 40 and movementVector.y > -40 and movementVector.x > 10 then
            nekoState = "left"
        end
        --
        if movementVector.x < -40 and movementVector.y > 40 then
            nekoState = "upRight"
        end
        --
        if movementVector.x > 40 and movementVector.y > 40 then
            nekoState = "upLeft"
        end
        --
        if movementVector.x < -40 and movementVector.y < -40 then
            nekoState = "downRight"
        end
        --
        if movementVector.x > 40 and movementVector.y < -40 then
            nekoState = "downLeft"
        end
        --
        --SCRATCHING
        if cursorPos.y < 28 and nekoPos.y == 28 and movementVector.y > 0 and movementVector.x > -5 and movementVector.x < 5
        then
            nekoState = "scratchUp"
        end
        --
        if cursorPos.y > 213 and nekoPos.y == 213 and movementVector.y < 0 and movementVector.x > -5 and movementVector.x < 5
        then
            nekoState = "scratchDown"
        end
        --
        if cursorPos.x > 372 and nekoPos.x == 372 and movementVector.x < 0 and movementVector.y > -5 and movementVector.y < 5
        then
            nekoState = "scratchRight"
        end
        --
        if cursorPos.x < 28 and nekoPos.x == 28 and movementVector.x > 0 and movementVector.y > -5 and movementVector.y < 5
        then
            nekoState = "scratchLeft"
        end
        --
        --IDLE
        if movementVector.y < 5 and movementVector.y > -5 and movementVector.x < 5 and movementVector.x > -5 then
            nekoState = "still"
        end
        --
        if nekoIsStill()
        then
            --slows down idle time if scratching
            if nekoIsScratching() then
                stillCountdown -= 0.025
            else
                stillCountdown -= 0.1
            end
        else
            stillCountdown = 3.0
        end
        --
        if stillCountdown < 0.0 then
            nekoIdleFunc()
        end
        --
    else
        nekoAlertFunc()
    end
end

-----------------------------NEKO LOGIC


function nekoLogic()
    --
    nekoPrevPos = nekoPos
    --
    nekoStates()
    --
    nekoAI()
    --
    nekoSpeed = nekoPos - nekoPrevPos
end
