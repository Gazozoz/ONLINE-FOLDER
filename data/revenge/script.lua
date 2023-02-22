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

    makeAnimatedLuaSprite('text', 'Song', 100, 225);
    addAnimationByPrefix('text', 'play', 'text', 24, false)
    objectPlayAnimation('text', 'play', true)
    setScrollFactor('text', 0, 0)
    scaleObject('text', 2, 2)
    addLuaSprite('text', false);

    setObjectCamera('overlayFX', 'hud')
    setObjectCamera('blackbg', 'other')
    setObjectCamera('text', 'other')
end

stepHitFuncs = {
    [136] = function()
        setProperty('defaultCamZoom',0.54)
    end,
    [159] = function()
        setProperty('defaultCamZoom',0.58)
    end,
    [191] = function()
        setProperty('defaultCamZoom',0.62)
    end,
    [223] = function()
        setProperty('defaultCamZoom',0.64)
    end,
    [256] = function()
        setProperty('defaultCamZoom',0.48)
    end,
    [264] = function()
        setProperty('defaultCamZoom',0.5)
    end,
    [352] = function()
        setProperty('defaultCamZoom',0.48)
    end,
    [360] = function()
        setProperty('defaultCamZoom',0.5)
    end,
    [512] = function()
        setProperty('defaultCamZoom',0.64)
        doTweenAlpha("overlayTween", "overlayFX", 0.5, 1, "linear")
    end,
    [767] = function()
        setProperty('defaultCamZoom',0.58)
        doTweenAlpha("overlayTween", "overlayFX", 0, 0.4, "linear")
    end,
    [1023] = function()
        doTweenAlpha("blackFade", "blackbg", 1, 2.5, "linear")
    end
}

doingCountdownEvent = true;
function onStartCountdown()
    if doingCountdownEvent then
        doingCountdownEvent = false
        runTimer('gruntDeath', 1)
        return Function_Stop;
    else
        return Function_Continue;
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startEvent' then
        doTweenAlpha("blackTween", "blackbg", 0, 1, "linear")
        doTweenAlpha("textTween", "text", 0, 1, "linear")
        startCountdown()
    end

    if tag == 'gruntDeath' then
        playSound('gruntDeath')
        doTweenColor('textTweenColor', 'text', 'FF0000', 0.001, "linear")
        doTweenZoom('camzoomtween', 'game', 0.6, 8, 'linear')
        runTimer('startEvent', 1)
    end
end