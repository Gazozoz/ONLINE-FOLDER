function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'scott_ded'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'scott_death_sfx'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'well_shit'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'rythis_confirm'); --put in mods/music/
end