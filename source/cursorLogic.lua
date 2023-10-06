function cursorIsStill()
    if cursorSpeed:magnitude() == 0.0 then
        return true
    end
end

--checks for if the cursor is within neko's obtainable space
function isCursorInBounds()
    if cursorPos.x > 28 and cursorPos.x < 372 and cursorPos.y < 213 and cursorPos.y > 28 then
        return true
    else
        return false
    end
end

-----------------------------CURSOR ROAM

--random cursor points for Neko to move to (no cursor image)
local function randomCursor()
    --
    cursorTimer -= 0.1
    --
    if cursorTimer < 0.0 then
        if not nekoIsMovable() then nekoState = "alert" end
        cursorPos.x = math.random(0, 400)
        cursorPos.y = math.random(0, 240)
        if math.random(0, 100) > 95 then cursorTimer = math.random(200, 300) else cursorTimer = math.random(3, 6) end
    end
    --
    if not nekoIsMovable() then
        if playdate.buttonJustPressed(buttonDown) or playdate.buttonJustPressed(buttonUp) or playdate.buttonJustPressed(buttonLeft) or playdate.buttonJustPressed(buttonRight) then
            cursorTimer = 0.0
        end
    end
end

-----------------------------CURSOR DPAD MOVEMENT

local function cursorMovement(speed)
    --
    if playdate.buttonIsPressed(buttonDown) then
        dpadMovement.y = speed
    end
    --
    if playdate.buttonIsPressed(buttonUp) then
        dpadMovement.y = -speed
    end
    --
    if playdate.buttonIsPressed(buttonLeft) then
        dpadMovement.x = -speed
        sprites["cursor"].sprite:setImageFlip(0)
    end
    --
    if playdate.buttonIsPressed(buttonRight) then
        dpadMovement.x = speed
        sprites["cursor"].sprite:setImageFlip(1)
    end
    --
    if playdate.buttonJustReleased(buttonUp) or playdate.buttonJustReleased(buttonDown) then
        dpadMovement.y = 0
    end
    --
    if playdate.buttonJustReleased(buttonLeft) or playdate.buttonJustReleased(buttonRight) then
        dpadMovement.x = 0
    end
    --
    --slows down angled dpad movement
    dpadMovement:normalize()
    dpadMovement *= nekoPace * 2
    --
    cursorPos += dpadMovement
    --
    cursorPos.x = clamp(cursorPos.x, 0, 400)
    cursorPos.y = clamp(cursorPos.y, 0, 240)
end

-----------------------------CURSOR LOGIC

function cursorLogic()
    --
    --sets up checking cursor speed
    cursorPrevPos = cursorPos
    --
    if behaviourType == "roam" then
        randomCursor()
    end
    --
    if behaviourType == "follow"
    then
        --cursor is twice as fast as neko
        cursorMovement(nekoPace * 2)

        --hides cursor if neko is ontop of it
        if movementVector:magnitude() > 10 then
            sprites["cursor"].sprite:moveTo(cursorPos.x, cursorPos.y)
        end
    end
    --
    cursorSpeed = cursorPos - cursorPrevPos
end
