-----------------------------FLIPPER FUNC


function flipperFunc()
    --slows down sprite flipper for sleep animation
    if nekoState == "sleep" then flipperTimer += 0.5 else flipperTimer += 1.0 end
    --
    flipper = math.sin(flipperTimer)
end

--lessens the amount of duplicated code needed
function nekoSpriteFlipper(sprite1, sprite2, flip)
    if flipper < 0.0
    then
        sprites[sprite1].sprite:moveTo(nekoPos.x, nekoPos.y)
        sprites[sprite1].sprite:setImageFlip(flip)
    else
        sprites[sprite2].sprite:moveTo(nekoPos.x, nekoPos.y)
        sprites[sprite2].sprite:setImageFlip(flip)
    end
end

-----------------------------NEKO VISUALS

--movenent visuals
function nekoVisuals()
    --
    --MOVEMENT
    if nekoState == "right" then
        nekoSpriteFlipper("run_hori_1", "run_hori_2", 0)
    end
    --
    if nekoState == "left" then
        nekoSpriteFlipper("run_hori_1", "run_hori_2", 1)
    end
    --
    if nekoState == "up" then
        nekoSpriteFlipper("run_up_1", "run_up_2", 0)
    end
    --
    if nekoState == "down" then
        nekoSpriteFlipper("run_down_1", "run_down_2", 0)
    end
    --
    if nekoState == "upRight" then
        nekoSpriteFlipper("run_up_angle_1", "run_up_angle_2", 0)
    end
    --
    if nekoState == "upLeft" then
        nekoSpriteFlipper("run_up_angle_1", "run_up_angle_2", 1)
    end
    --
    if nekoState == "downRight" then
        nekoSpriteFlipper("run_down_angle_1", "run_down_angle_2", 0)
    end
    --
    if nekoState == "downLeft" then
        nekoSpriteFlipper("run_down_angle_1", "run_down_angle_2", 1)
    end
    --
    --SCRATCHING
    if nekoState == "scratchUp" then
        nekoSpriteFlipper("scratch_up_1", "scratch_up_2", 0)
    end
    --
    if nekoState == "scratchDown" then
        nekoSpriteFlipper("scratch_down_1", "scratch_down_2", 0)
    end
    --
    if nekoState == "scratchRight" then
        nekoSpriteFlipper("scratch_hori_1", "scratch_hori_2", 0)
    end
    --
    if nekoState == "scratchLeft" then
        nekoSpriteFlipper("scratch_hori_1", "scratch_hori_2", 1)
    end
    --
    --IDLE
    if nekoState == "still" then
        sprites["still"].sprite:moveTo(nekoPos.x, nekoPos.y)
    end
    --
    if nekoState == "wash" then
        nekoSpriteFlipper("still", "wash", 0)
    end
    --
    if nekoState == "itch" then
        nekoSpriteFlipper("itch_1", "itch_2", 0)
    end
    --
    if nekoState == "yawn" then
        sprites["yawn"].sprite:moveTo(nekoPos.x, nekoPos.y)
    end
    --
    if nekoState == "sleep" then
        nekoSpriteFlipper("sleep_1", "sleep_2", 0)
    end
    --
    if nekoState == "alert" then
        sprites["alert"].sprite:moveTo(nekoPos.x, nekoPos.y)
    end
    --
end
