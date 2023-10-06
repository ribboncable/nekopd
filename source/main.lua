import "CoreLibs/graphics"
import "CoreLibs/sprites"
--
import "utility&Functions"
import "sprites"
import "dataStuff"
import "cursorLogic"
import "nekoLogic"
import "nekoVisuals"

--🏳️‍⚧️💕

--loads neko's sprites on startup
nekoSprites()

function playdate.update()
    spr.update()
    flipperFunc()
    --
    --moves the sprites off screen when not visible
    for i in pairs(sprites)
    do
        if sprites[i].name ~= "edges"
        then
            sprites[i].sprite:moveTo(-500, -500)
        end
    end
    --
    cursorLogic()
    nekoLogic()
    nekoVisuals()
    --
    intoAnimFunc()
end

--🐱
