
  halo=
    moon;
  
  haloScale=15
  
  haloUnZoom=0.05
  
--  g3d.newModel(
    
    
--      "assets/votoms/trimechatex2.obj"
--    , "assets/votoms/mymecha_tex.png"
--      , {0,0,5}, 
----      nil,
--      {math.pi/2,0,math.pi}, 
----      rot, model doesnt have correct orientation 
--      {1,1,1}
      
      
--      )


rdrhalo=function(b)
  --TODO place holder
--  addMsg('rdr halo')
  halo:setTranslation(b.x,b.y,b.z)
--  if b.vx==1 then 
--    halo:setRotation(math.pi/2,0+tstBillRot,-math.pi/2)
--  elseif b.vx==-1 then 
--    halo:setRotation(math.pi/2,0+tstBillRot,math.pi/2)
--  elseif b.vy==1 then 
--    halo:setRotation(math.pi/2,0+tstBillRot,0)
--  elseif b.vy==-1 then 
--    halo:setRotation(math.pi/2,0+tstBillRot,math.pi)
  halo:setScale(haloScale*b.zoom,haloScale*b.zoom,haloScale*b.zoom)
  
  
--  end
  halo:draw()

  --DBG
--  zerocube:setTanslation()

end  

bhalo=0.05

bhvhalo=function(b,i)
  
  b.zoom=b.zoom-haloUnZoom
  if b.zoom<0.01 then 
    table.remove(game.gos,i)
    addMsg("halo over")
    return
  end
  
  --twitch, 2 frames animation
  
--  --basic halo does back and forth
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
--    b.x=b.x+b.vx*bhalo
--    b.y=b.y+b.vy*bhalo
----    addMsg('bd MOVING '..b.x..' '..b.y)
--    if between(b.x,b.dx-bhalo,b.dx+bhalo) 
--      and between(b.y,b.dy-bhalo,b.dy+bhalo) then
--      b.x=b.dx
--      b.y=b.dy
--      b.state='WAITING'
--    end
--  end
end  

--tracks player to stun and damage his mech,
--cant go through crate and walls
createHalo= function(x,y,z,vx,vy)
  b={}
  b.x=x
  b.y=y
  b.z=z
  b.lockable=false
  b.vx=vx
  b.vy=vy
  b.zoom=1.
  b.bhv=bhvhalo
  b.rdr=rdrhalo
  return b
end