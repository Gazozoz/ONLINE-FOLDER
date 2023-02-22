function onCreate()

    makeLuaSprite('bartop','',0,0)
    makeGraphic('bartop',1280,60,'000000')
    addLuaSprite('bartop',false)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,659)
    makeGraphic('barbot',1280,61,'000000')
    addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')

end