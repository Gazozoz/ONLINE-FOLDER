function onCreatePost()
	setGlobalFromScript("scripts/neocam", "position_locked", true)
end

function onBeatHit()
	if curBeat == 3 then
		setGlobalFromScript("scripts/neocam", "position_locked", false)
	end
end

-- crash prevention
function onUpdate() end
function onUpdatePost() end
