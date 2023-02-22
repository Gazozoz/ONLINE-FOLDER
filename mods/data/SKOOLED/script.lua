function onCreatePost()
	
	
	addHaxeLibrary('Paths')
	addHaxeLibrary('OverlayShader')
	addHaxeLibrary('ColorSwap')
	addHaxeLibrary('WiggleEffectType', 'WiggleEffect')
	addHaxeLibrary('BGSprite')
	addHaxeLibrary('Conductor')
	addHaxeLibrary('BlendMode', 'openfl.display')
	
	runHaxeCode([[
	coolors = new ColorSwap();
	if (!ClientPrefs.lowQuality) {
		game.getLuaObject('stage front1').shader = coolors.shader;
		game.getLuaObject('sky').shader = coolors.shader;
		game.getLuaObject('bgcity').shader = coolors.shader;
		game.getLuaObject('bridge').shader = coolors.shader;
		game.getLuaObject('traffic signpost').shader = coolors.shader;
		game.getLuaObject('carback').shader = coolors.shader;
		game.getLuaObject('carback2').shader = coolors.shader;
		game.getLuaObject('traffic lights').shader = coolors.shader;
		game.getLuaObject('lightpost').shader = coolors.shader;
		game.getLuaObject('fog1').shader = coolors.shader;
		game.getLuaObject('fog2').shader = coolors.shader;
		game.getLuaObject('lightpost lightcast').shader = coolors.shader;
	} else {
		game.boyfriend.shader = coolors.shader;
		game.dad.shader = coolors.shader;
		game.gf.shader = coolors.shader;
		game.iconP1.shader = coolors.shader;
		game.iconP2.shader = coolors.shader;
		game.healthBar.shader = coolors.shader;
	}
				]])
	setProperty('scoreTxt.x', getProperty('healthBar.x') * 0.6)
end



function onRecalculateRating()
	setProperty('scoreTxt.text', 'Score:'..getProperty('songScore'))
end

function onMoveCamera(focus)
	if focus == 'gf' then
		doTweenZoom('kevins iconic coolzoom', 'camGame', getProperty('defaultCamZoom') * 0.8, (stepCrochet / 1000) * 16, 'SineOut')
		doTweenX('kevins iconic coolzoomX', 'camGame.target', getProperty('camGame.target.x') * 0.6, (stepCrochet / 1000) * 16, 'quadOut')
		setProperty('cameraSpeed', 0.9)
	end
end

local woot = true
local wavy = false
local bump = true
function onBeatHit()
	if curBeat % 2 == 0 and bump then
		if woot then
		runHaxeCode([[
		coolors.hue += 0.1;
		
					]])
		end
		woot = not woot
	end
end

local funnysteps = {246, 248, 250, 252, 254, 294, 295, 358, 359, 421, 422, 486, 487, 1014, 1016, 1017, 1020, 1022, 1062, 1063, 1126, 1127, 1190, 1191, 1524, 1525}
function onStepHit()
	for i = 0, #funnysteps do
		if curStep == funnysteps[i] then
			runHaxeCode([[
			FlxTween.tween(coolors, {saturation: coolors.saturation + 0.1}, 0.2);
					]])
			triggerEvent("Add Camera Zoom", 0.015 / 2, 0.03 / 2)
		end
	end
end

function onEvent(n, v1, v2)
	if n == 'bump' then
		runHaxeCode([[
		coolors.hue += ]]..v1 * getRandomFloat(1, 1.1)..[[;
		
		FlxTween.tween(coolors, {saturation: 0}, 0.1);
					]])
	elseif n == 'wavy' then
		wavy = true
		runHaxeCode([[
		wiggleShit = new WiggleEffect();
		wiggleShit.waveAmplitude = 0.0095;
		wiggleShit.waveFrequency = 0;
		wiggleShit.waveSpeed = 25;
		
		if (!ClientPrefs.lowQuality) {
			game.gf.shader = wiggleShit.shader;
		} else {
		
			game.getLuaObject('sky').shader = wiggleShit.shader;
			game.getLuaObject('bgcity').shader = wiggleShit.shader;
			game.getLuaObject('bridge').shader = wiggleShit.shader;
			game.getLuaObject('traffic signpost').shader = wiggleShit.shader;
			game.getLuaObject('carback').shader = wiggleShit.shader;
			game.getLuaObject('carback2').shader = wiggleShit.shader;
			game.getLuaObject('traffic lights').shader = wiggleShit.shader;
			game.getLuaObject('lightpost').shader = wiggleShit.shader;
			game.getLuaObject('fog1').shader = wiggleShit.shader;
			game.getLuaObject('fog2').shader = wiggleShit.shader;
			game.getLuaObject('lightpost lightcast').shader = wiggleShit.shader;
			game.getLuaObject('stage front1').shader = wiggleShit.shader;
			
		}
		
		FlxTween.tween(coolors, {saturation: 0}, 0.1);
				]])
	elseif n == 'wave' then
		runHaxeCode([[
       
		wiggleShit.waveFrequency += 500;
		if (ClientPrefs.lowQuality) wiggleShit.waveFrequency += 500;
					]])
	elseif n == 'initiate' then
		wavy = false
		bump = not bump
		setProperty('cameraSpeed', 1)
		if v1 ~= '2' then
			if not luaSpriteExists('videoSprite') then
				addLuaScript('videoSprite')
				runHaxeCode([[
				game.boyfriend.shader = coolors.shader;
				game.dad.shader = coolors.shader;
				game.gf.shader = coolors.shader;
				game.iconP1.shader = coolors.shader;
				game.iconP2.shader = coolors.shader;
				game.healthBar.shader = coolors.shader;
				coolors.brightness += 3;
							]])
			else
				runHaxeCode([[
				if (!ClientPrefs.lowQuality) game.getLuaObject(']]..sprs..[[').shader = coolors.shader;
						]])
			end
			if lowQuality then
				for i,sprs in pairs({'stage front1', 'sky', 'bgcity', 'bridge', 'traffic signpost', 'carback', 'carback2', 'traffic lights', 'lightpost', 'fog1', 'fog2', 'lightpost lightcast'}) do
					runHaxeCode([[
					game.getLuaObject(']]..sprs..[[').shader = null;
								]])
				end
			end
		else
			bump = false
			if not luaSpriteExists('videoSprite') then
				addLuaScript('videoSprite2')
				runHaxeCode([[
				coolors.saturation += 3;
							]])
			else
				runHaxeCode([[
				coolors.saturation -= 3;
							]])
			end
			if lowQuality then
				for i,sprs in pairs({'stage front1', 'sky', 'bgcity', 'bridge', 'traffic signpost', 'carback', 'carback2', 'traffic lights', 'lightpost', 'fog1', 'fog2', 'lightpost lightcast'}) do
				runHaxeCode([[
				game.getLuaObject(']]..sprs..[[').shader = null;
							]])
				end
			end
		end
	end
end

function onUpdatePost(el)
	runHaxeCode([[
			
	if (coolors.hue > 0) coolors.hue -= 0.01;

	wiggleShit.update(]]..el..[[);
	
	if (wiggleShit.waveFrequency > 0) {
		wiggleShit.waveFrequency -= 70;
		if (!ClientPrefs.lowQuality) wiggleShit.waveAmplitude = 0.00055; else wiggleShit.waveAmplitude = 0.001;
	}
	
	if (wiggleShit.waveFrequency <= 0) {
		wiggleShit.waveFrequency = 0;
		wiggleShit.waveAmplitude = 0;
	}
	
				]])
end