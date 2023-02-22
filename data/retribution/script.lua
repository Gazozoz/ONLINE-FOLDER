function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]()
    end
end

function onCreate()
    makeLuaSprite('overlayFX', 'overlay', -700, -500);
    setScrollFactor('overlayFX', 0, 0)
    setProperty('overlayFX.alpha',0)
    setBlendMode('overlayFX', 'normal')
    addLuaSprite('overlayFX', false);

    makeLuaSprite('blackbg', 'howdoyoumakegraphics', -700, -500);
    setScrollFactor('blackbg', 0, 0)
    addLuaSprite('blackbg', false);
    setProperty('blackbg.alpha',0)

    setObjectCamera('overlayFX', 'hud')
    setObjectCamera('blackbg', 'other')
end

stepHitFuncs = {
    [124] = function()
        setProperty('defaultCamZoom',0.43)
    end,
    [128] = function()
        setProperty('defaultCamZoom',0.5)
    end,
    [380] = function()
        setProperty('defaultCamZoom',0.43)
    end,
    [384] = function()
        setProperty('defaultCamZoom',0.5)
    end,
    [764] = function()
        setProperty('defaultCamZoom',0.43)
    end,
    [768] = function()
        setProperty('defaultCamZoom',0.5)
    end,
    [1024] = function()
        doTweenAlpha("blackFade", "blackbg", 1, 10, "linear")
    end
}