playdate.display.setRefreshRate(10)
playdate.setCrankSoundsDisabled(true)
--
gfx = playdate.graphics
spr = playdate.graphics.sprite
img = playdate.graphics.image
vec2 = playdate.geometry.vector2D
buttonUp = playdate.kButtonUp
buttonDown = playdate.kButtonDown
buttonLeft = playdate.kButtonLeft
buttonRight = playdate.kButtonRight

-----------------------------CLAMP FUNC

function clamp(variable, min, max)
    --
    if variable < min then
        variable = min
    else
        if variable > max then
            variable = max
        end
    end
    --
    return variable
end

-----------------------------MENU ITEMS

menu = playdate.getSystemMenu()

--MENU SELECTIONS
petType = "neko"
local function petTypeFunc()
    if petType == "neko"
    then
        petType = "inu"
        inuSprites()
    else
        petType = "neko"
        nekoSprites()
    end
end
--
local function paceFunc(value)
    if value == "slow" then nekoPace = 2.5 end
    if value == "medium" then nekoPace = 5.0 end
    if value == "fast" then nekoPace = 7.5 end
end
--
behaviourType = "roam"
local function behaviourTypeFunc(value)
    if value == "roam"
    then
        behaviourType = "roam"
        playdate.setAutoLockDisabled(true)
    end
    if value == "follow"
    then
        behaviourType = "follow"
        playdate.setAutoLockDisabled(false)
    end
end
--
menu:addOptionsMenuItem("pet", { "neko", "inu" }, "neko", petTypeFunc)
menu:addOptionsMenuItem("pace", { "slow", "medium", "fast" }, "medium", paceFunc)
menu:addOptionsMenuItem("action", { "roam", "follow" }, "roam", behaviourTypeFunc)

--MENU IMAGE
local menuImg = playdate.graphics.image.new("images/menu")
assert(menuImg)
playdate.setMenuImage(menuImg)

-----------------------------INTRO ANIM

local introAnim = img.new("images/launchImage")
assert(introAnim)

local introAnimTime = 1.5
function intoAnimFunc()
    if introAnimTime > 0.0 then
        introAnimTime -= 0.25
        introAnim:drawFaded(0, 0, introAnimTime, img.kDitherTypeBayer8x8)
    end
end
