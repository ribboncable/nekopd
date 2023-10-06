-----------------------------CURSOR DATA

--the position of the target
cursorPos = vec2.new(200.0, 120.0)
--time before the cursor randomly moves
cursorTimer = 3.0

--the cursor's speed
cursorPrevPos = vec2.new(0.0, 0.0)
cursorSpeed = vec2.new(0.0, 0.0)

--dpad values
dpadMovement = vec2.new(0.0, 0.0)

-----------------------------NEKO DATA

--angle for which neko moves towards
nekoDirectionToCursor = vec2.new(0.0, 0.0)

--neko's current activity or direction
nekoState = "still"

--nekos default movement speed
nekoPace = 5.0
--neko's current moement speed for temporary speed changes

--neko's current position
nekoPos = vec2.new(200.0, 120.0)

--the direction neko is heading
movementVector = vec2.new(0.0, 0.0)

--neko's speed
nekoPrevPos = vec2.new(0.0, 0.0)
nekoSpeed = vec2.new(0.0, 0.0)

--delays for neko's idle state
stillCountdown = 3.0
scratchCountdown = 6.0
washCountdown = 6.0
itchCountdown = 4.0
yawnCountdown = 2.0
alertCountdown = 2.0

--used for flipping the sprites
flipper = 0.0
flipperTimer = 1.0

-----------------------------IS NEKO STILL OR MOVABLE?

function nekoIsStill()
    if nekoSpeed:magnitude() == 0.0 then
        return true
    end
end

function nekoIsScratching()
    if nekoState == "scratchUp" or nekoState == "scratchDown" or nekoState == "scratchLeft" or nekoState == "scratchRight"
    then
        return true
    end
end

function nekoIsMovable()
    if nekoState ~= "alert" and nekoState ~= "still" and nekoState ~= "wash" and nekoState ~= "itch" and nekoState ~= "yawn" and nekoState ~= "sleep" and not nekoIsScratching()
    then
        return true
    end
end
