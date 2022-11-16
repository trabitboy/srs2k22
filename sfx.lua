sExplode=love.sound.newSoundData("sounds/explode.wav")
sMissile=love.sound.newSoundData("sounds/missile.wav")
sLock=love.sound.newSoundData("sounds/lock.wav")

track1=love.audio.newSource('sounds/track1.wav','static')
track2=love.audio.newSource('sounds/track2.wav','static')
track3=love.audio.newSource('sounds/track3.wav','static')

function playSD(sd)
  love.audio.play(love.audio.newSource(sd))
end