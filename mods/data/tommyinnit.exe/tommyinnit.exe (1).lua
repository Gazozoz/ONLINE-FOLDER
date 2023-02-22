--Annoying mf

function onUpdate()

    if curBeat == 24 then
		makeLuaSprite('watermark00', 'watermark00', 930, 600);
        scaleObject('watermark00', 0.3, 0.3);
		setObjectCamera('watermark00', 'other', true);
		addLuaSprite('watermark00', false);
	end

	if curBeat == 32 then
		makeLuaSprite('watermark01', 'watermark01', 100, -50);
		setObjectCamera('watermark01', 'other', true);
        setProperty('watermark01.alpha', 0.5);
		addLuaSprite('watermark01', false);
	end

    if curBeat == 48 then
		makeLuaSprite('watermark02', 'watermark02', 1100, 50);
        scaleObject('watermark02', 0.2, 0.2);
        setProperty('watermark02.alpha', 0.5);
		setObjectCamera('watermark02', 'other', true);
		addLuaSprite('watermark02', false);
	end

    if curBeat == 64 then
		makeLuaSprite('watermark03', 'watermark03', 200, 50);
        scaleObject('watermark03', 1, 1);
        setProperty('watermark03.alpha', 0.8);
		setObjectCamera('watermark03', 'other', true);
		addLuaSprite('watermark03', false);
	end

    if curBeat == 100 then
		makeLuaSprite('watermark04', 'watermark04', 80, 300);
        scaleObject('watermark04', 1.3, 1.3);
        setProperty('watermark04.alpha', 0.7);
		setObjectCamera('watermark04', 'other', true);
		addLuaSprite('watermark04', false);
	end

    if curBeat == 160 then
		makeLuaSprite('watermark06', 'watermark06', 0, 0);
        scaleObject('watermark06', 0.5, 0.7);
		setObjectCamera('watermark06', 'other', true);
		addLuaSprite('watermark06', false);
	end

    if curBeat == 208 then
		makeLuaSprite('watermark05', 'watermark05', 0, 500);
        scaleObject('watermark05', 1, 1);
        setProperty('watermark05.alpha', 0.7);
		setObjectCamera('watermark05', 'other', true);
		addLuaSprite('watermark05', false);
	end

end

