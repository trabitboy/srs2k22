
maxLock=3

mslLockDist=8

mslHomingSpd=15
sqMslHomingSpd=mslHomingSpd*mslHomingSpd


--gos in there,until max lock reached
currentLocks={}

--missiles goes left then right then left .....
--then homes in on go and maeks it blink
--(moon explode)

numNextWP=1
mslWP={
  --offset to current px py pz
      {x=-20,y=-20,z=20},
      {x=20,y=-20,z=-20},
      {x=20,y=-20,z=0},
      {x=-20,y=-20,z=0},
      {x=0,y=-20,z=20},
      {x=0,y=-20,z=-20}
  
  }


--we search if we can get lock from missile
--due to way camera works,
--we check only on xz
function missileLock(xt,zt)
  for i,go in ipairs(game.gos)
  do 
    if go.lockable ==true and go.y < game.py and cylColl(xt,zt,go.x,go.z,mslLockDist) then
      return go
    end
  end
  
  return nil
end

--exact x y 
function spawnMissile(x,y,z,go)
  msl={}
  msl.x=x
  msl.y=y
  msl.z=z
  msl.rdr=rdrMissile
--  msl.bhv=updMissile
  initMslWP(msl)

  msl.go=go
  table.insert(game.blts,msl)
end

function initMslWP(s)
  
  numNextWP=numNextWP+1
  if numNextWP>#mslWP then
    numNextWP=1
  end
  
  s.bhv=mslWPgo
  s.wp={
    x=mslWP[numNextWP].x+s.x,
    y=mslWP[numNextWP].y+s.y,
    z=mslWP[numNextWP].z+s.z
    }
  --dx dy dz to arrive to waypoint
  -- we go there in 40 cycles
  s.dx=mslWP[numNextWP].x/40
  s.dy=mslWP[numNextWP].y/40
  s.dz=mslWP[numNextWP].z/40
  
  
  
  
end

--goes to waypoint ( below certain dist isok,
-- radial coll)
function mslWPgo(s)
  
  s.x=s.x+s.dx
  s.y=s.y+s.dy
  s.z=s.z+s.dz
  
  --TODO test if arrived at waypoint
  
  if cylColl(s.x,s.y,s.wp.x,s.wp.y,10) then
    addMsg('WP reached')
    s.dx=0
    s.dy=0
    s.dz=0
    --works so far
    
    initMslHome(s)
    return
  end
  
end

function initMslHome(s)
  s.bhv=mslHome
  

end

--homes in on ennemy then radial explosion
function mslHome(s,i)
  
  --calculate dx dy dz
  godx=s.go.x-s.x
  gody=s.go.y-s.y
  godz=s.go.z-s.z
  --calculate sq hypotenuse length
--not exac in 3d , dunno care
  sqhyp=godx*godx+gody*gody+godz*godz

  --calculate percentage of hyp
  pcent=sqMslHomingSpd/sqhyp
  
  --report to dx and apply dx
  godx=godx*pcent
  gody=gody*pcent
  godz=godz*pcent

  s.x=s.x+godx
  s.y=s.y+gody
  s.z=s.z+godz  
  
--  if pcent>0.9 then 
--    addMsg("hit")
--  end

  if cylColl(s.x,s.y,s.go.x,s.go.y,10) then
    
    addMsg("hit")
    table.remove(game.blts,i)
    
    noMsl=nil
    
    if s.go~=nil then
      s.go:dmgBhv()
    end
    
  end

end

--DBG
function updMissile(s)
  s.y=s.y-0.5
  
end


function rdrMissile(s)
  
  testMech:setTranslation(s.x,s.y,s.z)
  testMech:draw()
end




