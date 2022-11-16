
--exact x y 
function spawnBullet(x,y,z)
  blt={}
  blt.x=x
  blt.y=y
  blt.z=z
  blt.rdr=rdrBullet
  blt.bhv=updBullet
  
  table.insert(game.blts,blt)
end


function updBullet(s)
  s.y=s.y-0.5
  
  for j,go in ipairs(game.gos)
  do
    if go.damage==true and cylColl(go.x,go.y,s.x,s.y,8) then
      addMsg('hit')
      go:dmgBhv()
      
      
    end
    
  end
  
end


function rdrBullet(s)
  
  tree:setTranslation(s.x,s.y,s.z)
  tree:draw()
end


function updBullets()
  for i,go in ipairs(game.blts)
  do 
    go:bhv(i)
  end
end

--rdr gos (will it be ok with z order ?)
function renderBullets()
--  addMsg('rdr gos '..tbllngth(gos))
  for n,v in ipairs(game.blts)
  do
--    addMsg('rdr go')
    v:rdr()
    
  end
end

