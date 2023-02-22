local ffi = require("ffi")  -- Load FFI module (instance)

local user32 = ffi.load("user32")   -- Load User32 DLL handle

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
    MB_ICONINFORMATION = 0x00000040L
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
]]) -- Define C -> Lua interpretation


function onEndSong()
	user32.MessageBoxA(nil, 'The file "PsychEngine/mods/DREAM SMP/data/tommyinnit.exe/tommyinnit.exe.json" does not exist. If you encountered this file within the game, it is highly advised you delete it immediately.', 'SECURITY ERROR: tommyinnit.exe', ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)   -- Call C function 'MessageBoxA' from User32
    os.exit()
end

function onGameOverStart(retry)

    user32.MessageBoxA(nil, 'Just killed an idiot, feelin good', 'tommyinnit.exe', ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)   -- Call C function 'MessageBoxA' from User32

end

function onPause()
    user32.MessageBoxA(nil, 'No timeouts. Come back here.', 'tommyinnit.exe', ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)   -- Call C function 'MessageBoxA' from User32
return Function_Stop;
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
    user32.MessageBoxA(nil, 'cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheatercheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater  cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater ', 'cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater cheater ', ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)   -- Call C function 'MessageBoxA' from User32[]
    end
end


function onUpdate()

	if botPlay then
        user32.MessageBoxA(nil, 'NO CHEATING     NO CHEATING      NO CHEATING      NO CHEATING', 'Tommyinnit.exe', ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)   -- Call C function 'MessageBoxA' from User32
        os.exit()
	end

end