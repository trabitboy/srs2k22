starBadDist=64
sbrotspd=0.01
sbfirerate=60  
  
--  g3d.newModel(
    
    
--      "assets/votoms/trimechatex2.obj"
--    , "assets/votoms/mymecha_tex.png"
--      , {0,0,5}, 
----      nil,
--      {math.pi/2,0,math.pi}, 
----      rot, model doesnt have correct orientation 
--      {1,1,1}
      
      
--      )


rdrStarBad=function(b)
  --TODO place holder
--  addMsg('rdr bad')
  starbad:setTranslation(b.x,b.y,b.z)
  
  starbad:setRotation(b.rot/2,0,b.rot)
--  if b.vx==1 then 
--    baddie:setRotation(math.pi/2,0+tstBillRot,-math.pi/2)
--  elseif b.vx==-1 then 
--    baddie:setRotation(math.pi/2,0+tstBillRot,math.pi/2)
--  elseif b.vy==1 then 
--    baddie:setRotation(math.pi/2,0+tstBillRot,0)
--  elseif b.vy==-1 then 
--    baddie:setRotation(math.pi/2,0+tstBillRot,math.pi)
  
  
  
--  end
  starbad:draw()

  --DBG
--  zerocube:setTanslation()

end  


bhvStarBad=function(b)
  
  --if ply to close we turn
  
  if cylColl(game.px,game.py,b.x,b.y,starBadDist) then
    addMsg('star bad activate')
    initSBRot(b)
    
  end
  
  
end  

function initSBRot(s)
  s.bhv=bhvSBRot
end

function initSBFire(s)
  s.bhv=bhvSBFire
end

function bhvSBFire(b)
  b.timer=b.timer +1
  if b.timer>sbfirerate then
    b.timer =0
    addMsg('sb fire')
    enSpawnMissile(b.x,b.y,b.z)
  end
end

function bhvSBRot(s)
  
  if s.rot<math.pi/2 then
    s.rot=s.rot+sbrotspd
  else
    addMsg('init fire state')
    initSBFire(s)
  end
end


function starBadDmg(s)
    playSD(sExplode)
  
    --spawn explosion
    table.insert(game.gos,createHalo(
--        s.go.x,s.go.y+60,s.go.z,
        s.x,s.y,
--        8*2,8*17,
        s.z,
--        -15,
        0,
        0
        ))
  
  
  
  s.hp=s.hp-1
  if s.hp<=0 then
    for i,go in ipairs(game.gos)
    do
    --remove in go without index
      if go==s then
        table.remove(game.gos,i)
        addMsg('remove go')
        return
      end
    end
  end
end

--tracks player to stun and damage his mech,
--cant go through crate and walls
createStarBad= function(x,y,z,vx,vy)
  b={}
  b.x=x
  b.y=y
  b.z=z
  b.rot=0
  b.timer=0
  b.hp=3
  b.lockable=true
  b.vx=vx
  b.vy=vy
  b.bhv=bhvStarBad
  b.rdr=rdrStarBad
  b.dmgBhv=starBadDmg
--  b.state='THINKING'
--  b.wait=0
  return b
end