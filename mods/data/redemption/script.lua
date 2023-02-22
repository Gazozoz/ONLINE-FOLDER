function onCreate()
    makeAnimatedLuaSprite('overlayFX', 'pulse', 0, 0);
    addAnimationByPrefix('overlayFX', 'play', 'pulse', 24, false)
    setScrollFactor('overlayFX', 0, 0)
    setProperty('overlayFX.alpha',0)
    setBlendMode('overlayFX', 'addS')
    addLuaSprite('overlayFX', false);
    scaleObject('overlayFX', 1.01, 1)

    makeLuaSprite('blackbg', 'howdoyoumakegraphics', -700, -500);
    setScrollFactor('blackbg', 0, 0)
    addLuaSprite('blackbg', false);

    setObjectCamera('blackbg', 'other')
    setObjectCamera('overlayFX', 'other')
end

function onBeatHit()
	objectPlayAnimation('overlayFX', 'play', true)
end

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]()
    end
end

stepHitFuncs = {
    [1] = function()
        doTweenAlpha("blackFade", "blackbg", 0, 10, "linear")
    end
}