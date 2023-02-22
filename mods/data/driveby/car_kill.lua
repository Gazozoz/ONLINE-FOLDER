if not lowQuality then
	local event = false
	local killed = false
	local ended = false
	
	function onCreatePost()
		makeAnimatedLuaSprite("victims", "driveby/victims", -760, 1120)
		addAnimationByPrefix("victims", "bop", "bop", 24, false)
		scaleObject("victims", 0.7, 0.7)
		setScrollFactor("victims", 1.5, 1.5)
		addLuaSprite("victims", true)
		playAnim("victims", "bop", true)
		
		for i1, victim in pairs({"vep", "kevin", "banbuds", "mash"}) do
			for i2 = 1, 3 do
				local sprite = victim .. i2
				makeLuaSprite(sprite, "driveby/limbs/" .. victim .. "_" .. i2, -830 + 540 * (i1), 1250 + i2 * 150)
				scaleObject(sprite, 0.8, 0.8)
				setScrollFactor(sprite, 1.5, 1.5)
				setProperty(sprite .. ".alpha", 0.001)
				addLuaSprite(sprite, true)
			end
		end
		
		makeLuaSprite("car", "driveby/car", 4000, 1250)
		scaleObject("car", 2, 2)
		setScrollFactor("car", 1.5, 1.5)
		setProperty("car.alpha", 0.0001)
		addLuaSprite("car", true)
	end
	
	local timer_stuff = {
		car_pass = function()
			setProperty("car.alpha", 1)
			doTweenX("car_pass", "car", -5000, 0.153, "linear")
			
			playSound("driveby/car_hit")
			runTimer("car_hit", 0.06)
		end,
		
		car_hit = function()
			killed = true
			
			removeLuaSprite("victims")
			
			for _, victim in pairs({"vep", "kevin", "banbuds", "mash"}) do
				for i = 1, 3 do
					local sprite = victim .. i
					setProperty(sprite .. ".alpha", 1)
					setProperty(sprite .. ".acceleration.y", 3000)
					setProperty(sprite .. ".velocity.y", getRandomInt(-3000, -2000))
					setProperty(sprite .. ".velocity.x", getRandomInt(-500, 500))
				end
			end
			
			callScript("scripts/neocam", "focus", {"center", 1, "cubeout", true})
			callScript("scripts/neocam", "zoom", {"game", 0.6, 0})
			setGlobalFromScript("scripts/neocam", "zoom_speed", 3)
			
			cameraShake("game", 0.015, 0.2)
			cameraShake("hud", 0.005, 0.2)
			
			runTimer("cleanup", 2.5)
		end,
		
		cleanup = function()
			ended = true
			
			removeLuaSprite("car")
			for _, victim in pairs({"banbuds", "kevin", "mash", "vep"}) do
				for i = 1, 3 do
					removeLuaSprite(victim .. i)
				end
			end
			
			setGlobalFromScript("scripts/neocam", "position_locked", false)
			
			callScript("scripts/neocam", "zoom", {"game", 0.8, 4, "cubeinout"})
			setGlobalFromScript("scripts/neocam", "zoom_speed", 2)
		end
	}
	function onTimerCompleted(name) if timer_stuff[name] then timer_stuff[name]() end end
	
	function onCountdownTick(tick)
		if tick % 2 == 0 and not killed then 
			playAnim("victims", "bop", true)
		end
	end

	function onBeatHit()
		if curBeat % 2 == 0 and not killed then
			playAnim("victims", "bop", true)
		end
	end
	
	function onBeatHit()
		if curBeat % 2 == 0 and not killed then
			playAnim("victims", "bop", true)
		end
	end
	
	local floor = math.floor
	function onUpdatePost()
		local song_pos = getSongPosition()
		
		if song_pos >= 68800 and not event then -- event didnt work...
			event = true
			
			playSound("driveby/car_pass")
			runTimer("car_pass", 1.287)
		end
		
		if killed and not ended then
			for _, victim in pairs({"vep", "kevin", "banbuds", "mash"}) do
				for i = 1, 3 do
					local sprite = victim .. i
					setProperty(sprite .. ".angle", floor(song_pos / 125) * 45 * i)
				end
			end
		end
	end
end

-- crash prevention
function onUpdate() end
if lowQuality then function onUpdatePost() end end
