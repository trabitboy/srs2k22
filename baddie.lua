
  baddie=
    evilDrill;
  
  
--  g3d.newModel(
    
    
--      "assets/votoms/trimechatex2.obj"
--    , "assets/votoms/mymecha_tex.png"
--      , {0,0,5}, 
----      nil,
--      {math.pi/2,0,math.pi}, 
----      rot, model doesnt have correct orientation 
--      {1,1,1}
      
--      )


rdrBad=function(b)
  --TODO place holder
--  addMsg('rdr bad')
  baddie:setTranslation(b.x,b.y,b.z)
--  if b.vx==1 then 
--    baddie:setRotation(math.pi/2,0+tstBillRot,-math.pi/2)
--  elseif b.vx==-1 then 
--    baddie:setRotation(math.pi/2,0+tstBillRot,math.pi/2)
--  elseif b.vy==1 then 
--    baddie:setRotation(math.pi/2,0+tstBillRot,0)
--  elseif b.vy==-1 then 
--    baddie:setRotation(math.pi/2,0+tstBillRot,math.pi)
  
  
  
--  end
  baddie:draw()

  --DBG
--  zerocube:setTanslation()

end  

bspeed=-0.01

bhvBad=function(b)
  
  
  b.z=b.z+bspeed
  
  --twitch, 2 frames animation
  
  --basic baddie does back and forth
--  if b.state=='WAITING' then
--    b.wait=b.wait+1
--    if b.wait > 60 then
--      b.wait =0
--      b.state='THINKING'
--    end
--  elseif b.state=='THINKING' then
--    tx=b.x+b.vx
--    ty=b.y+b.vy
    
--    if tx==ply.x and ty==ply.y then
      
--      --damage player
--      playSD(sdStep)
--      damagePlayer()
--      b.state='WAITING'
--      return
--    end
    
--    if checkMoveBoundaries(tx,ty) and walkability(tx,ty)==true and getGo(tx,ty)==nil then
--      --we can go there !
----      addMsg('moving to '..tx..' '..ty)
--      b.dx=tx
--      b.dy=ty
--      b.state='MOVING'
--      return
--    else
----      addMsg('cant move this way')
--      b.vx=-b.vx 
--      b.vy=-b.vy
--    end
--  elseif b.state=='MOVING' then
--    b.x=b.x+b.vx*bspeed
--    b.y=b.y+b.vy*bspeed
----    addMsg('bd MOVING '..b.x..' '..b.y)
--    if between(b.x,b.dx-bspeed,b.dx+bspeed) 
--      and between(b.y,b.dy-bspeed,b.dy+bspeed) then
--      b.x=b.dx
--      b.y=b.dy
--      b.state='WAITING'
--    end
--  end
end  

function badDmg(s)
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
createBaddie= function(x,y,z,vx,vy)
  b={}
  b.x=x
  b.y=y
  b.z=z
  b.hp=3
  b.lockable=true
  b.vx=vx
  b.vy=vy
  b.bhv=bhvBad
  b.rdr=rdrBad
  b.dmgBhv=badDmg
  b.state='THINKING'
  b.wait=0
  return b
end