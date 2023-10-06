sprites = {}

-----------------------------ADDS THE SPRITE

function spriteAdd(name, directoryString)
    if sprites[name] == nil
    then
        -- print("Sprite added: " .. name)

        --pushes the sprite offscreen if no value is set
        if x == nil then x = -500 end
        if y == nil then y = -500 end

        --the sprite data
        local sprite = {}
        sprite.name = name
        sprite.image = img.new(directoryString)
        assert(sprite.image)
        sprite.sprite = spr.new(sprite.image)
        sprite.sprite:moveTo(-500, -500)
        sprite.sprite:add()

        --places the sprite into the table with the index as the name, allowing quick acces (thankes, Naelstrof!!)
        sprites[name] = sprite
    end
end

--background
spriteAdd("edges", "images/edges")
sprites["edges"].sprite:setOpaque(true)
sprites["edges"].sprite:moveTo(200, 120)

--neko's sprite set
function nekoSprites()
    for i in pairs(sprites)
    do
        if sprites[i].name ~= "edges"
        then
            sprites[i].sprite:remove()
            sprites[i].image = nil
            sprites[i] = nil
        end
    end
    --
    spriteAdd("cursor", "images/sprites/mouse")
    spriteAdd("alert", "images/sprites/neko/alert")
    spriteAdd("itch_1", "images/sprites/neko/itch_1")
    spriteAdd("itch_2", "images/sprites/neko/itch_2")
    spriteAdd("run_down_1", "images/sprites/neko/run_down_1")
    spriteAdd("run_down_2", "images/sprites/neko/run_down_2")
    spriteAdd("run_up_1", "images/sprites/neko/run_up_1")
    spriteAdd("run_up_2", "images/sprites/neko/run_up_2")
    spriteAdd("run_down_angle_1", "images/sprites/neko/run_down_angle_1")
    spriteAdd("run_down_angle_2", "images/sprites/neko/run_down_angle_2")
    spriteAdd("run_up_angle_1", "images/sprites/neko/run_up_angle_1")
    spriteAdd("run_up_angle_2", "images/sprites/neko/run_up_angle_2")
    spriteAdd("run_hori_1", "images/sprites/neko/run_hori_1")
    spriteAdd("run_hori_2", "images/sprites/neko/run_hori_2")
    spriteAdd("scratch_down_1", "images/sprites/neko/scratch_down_1")
    spriteAdd("scratch_down_2", "images/sprites/neko/scratch_down_2")
    spriteAdd("scratch_up_1", "images/sprites/neko/scratch_up_1")
    spriteAdd("scratch_up_2", "images/sprites/neko/scratch_up_2")
    spriteAdd("scratch_hori_1", "images/sprites/neko/scratch_hori_1")
    spriteAdd("scratch_hori_2", "images/sprites/neko/scratch_hori_2")
    spriteAdd("scratch_up_1", "images/sprites/neko/scratch_up_1")
    spriteAdd("scratch_up_2", "images/sprites/neko/scratch_up_2")
    spriteAdd("scratch_down_1", "images/sprites/neko/scratch_down_1")
    spriteAdd("scratch_down_2", "images/sprites/neko/scratch_down_2")
    spriteAdd("sleep_1", "images/sprites/neko/sleep_1")
    spriteAdd("sleep_2", "images/sprites/neko/sleep_2")
    spriteAdd("still", "images/sprites/neko/still")
    spriteAdd("wash", "images/sprites/neko/wash")
    spriteAdd("yawn", "images/sprites/neko/yawn")
end

--inu's sprite set
function inuSprites()
    for i in pairs(sprites)
    do
        if sprites[i].name ~= "edges"
        then
            sprites[i].sprite:remove()
            sprites[i].image = nil
            sprites[i] = nil
        end
    end

    spriteAdd("cursor", "images/sprites/bird")
    spriteAdd("alert", "images/sprites/inu/alert")
    spriteAdd("itch_1", "images/sprites/inu/itch_1")
    spriteAdd("itch_2", "images/sprites/inu/itch_2")
    spriteAdd("run_down_1", "images/sprites/inu/run_down_1")
    spriteAdd("run_down_2", "images/sprites/inu/run_down_2")
    spriteAdd("run_up_1", "images/sprites/inu/run_up_1")
    spriteAdd("run_up_2", "images/sprites/inu/run_up_2")
    spriteAdd("run_down_angle_1", "images/sprites/inu/run_down_angle_1")
    spriteAdd("run_down_angle_2", "images/sprites/inu/run_down_angle_2")
    spriteAdd("run_up_angle_1", "images/sprites/inu/run_up_angle_1")
    spriteAdd("run_up_angle_2", "images/sprites/inu/run_up_angle_2")
    spriteAdd("run_hori_1", "images/sprites/inu/run_hori_1")
    spriteAdd("run_hori_2", "images/sprites/inu/run_hori_2")
    spriteAdd("scratch_down_1", "images/sprites/inu/scratch_down_1")
    spriteAdd("scratch_down_2", "images/sprites/inu/scratch_down_2")
    spriteAdd("scratch_up_1", "images/sprites/inu/scratch_up_1")
    spriteAdd("scratch_up_2", "images/sprites/inu/scratch_up_2")
    spriteAdd("scratch_hori_1", "images/sprites/inu/scratch_hori_1")
    spriteAdd("scratch_hori_2", "images/sprites/inu/scratch_hori_2")
    spriteAdd("scratch_up_1", "images/sprites/inu/scratch_up_1")
    spriteAdd("scratch_up_2", "images/sprites/inu/scratch_up_2")
    spriteAdd("scratch_down_1", "images/sprites/inu/scratch_down_1")
    spriteAdd("scratch_down_2", "images/sprites/inu/scratch_down_2")
    spriteAdd("sleep_1", "images/sprites/inu/sleep_1")
    spriteAdd("sleep_2", "images/sprites/inu/sleep_2")
    spriteAdd("still", "images/sprites/inu/still")
    spriteAdd("wash", "images/sprites/inu/wash")
    spriteAdd("yawn", "images/sprites/inu/yawn")
end
