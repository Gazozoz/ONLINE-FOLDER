function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == "GF Sing" then
			setPropertyFromGroup('unspawnNotes', i, 'visible', false)
		end
	end
end