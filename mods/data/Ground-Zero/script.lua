function onCreate()
    makeLuaSprite('black', '', 0, 0);
		 makeGraphic('black',1280,720,'000000')
		  addLuaSprite('black', false);
		  setObjectCamera('black','hud')
		  setLuaSpriteScrollFactor('black',0,0)
	      setProperty('black.scale.x',2)
	      setProperty('black.scale.y',2)
	      setProperty('black.alpha',1)
end

function onStepHit()
	if curStep == 16 then
		doTweenZoom('camgamezoom', 'camGame', 1.3, 10, 'quadInOut')
		cameraShake('camGame', 0.003, 10)
		setProperty('black.alpha',0)
	end
	if curStep == 128 then
	    setProperty('black.alpha',1)
	end
	if curStep == 144 then
	    setProperty('black.alpha',0)
	end
	if curStep == 911 then
	    cameraSetTarget('girlfriend')
	end
end