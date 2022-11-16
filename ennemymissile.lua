enDmg=5
enSqMslHomingSpd=4


--missiles goes left then right then left .....
--then homes in on go and maeks it blink
--(moon explode)

enNumNextWP=1
enMslWP={
  --offset to current px py pz
      {x=-20,y=-20,z=20},
      {x=20,y=-20,z=-20},
      {x=20,y=-20,z=0},
      {x=-20,y=-20,z=0},
      {x=0,y=-20,z=20},
      {x=0,y=-20,z=-20}
  
  }



--exact x y 
function enSpawnMissile(x,y,z)
  msl={}
  msl.x=x
  msl.y=y
  msl.z=z
  msl.lockable=true
  msl.rdr=enRdrMissile
  msl.dmgBhv=enMslDmg
--  msl.bhv=updMissile
  enInitMslWP(msl)

  table.insert(game.gos,msl)
end

function enInitMslWP(s)
  
  enNumNextWP=enNumNextWP+1
  if enNumNextWP>#enMslWP then
    enNumNextWP=1
  end
  
  s.bhv=enMslWPgo
  s.wp={
    x=enMslWP[enNumNextWP].x+s.x,
    y=enMslWP[enNumNextWP].y+s.y,
    z=enMslWP[enNumNextWP].z+s.z
    }
  --dx dy dz to arrive to waypoint
  -- we go there in 40 cycles
  s.dx=enMslWP[enNumNextWP].x/40
  s.dy=enMslWP[enNumNextWP].y/40
  s.dz=enMslWP[enNumNextWP].z/40
  
  
  
  
end


function enMslDmg(s)
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


--goes to waypoint ( below certain dist isok,
-- radial coll)
function enMslWPgo(s)
  
  s.x=s.x+s.dx
  s.y=s.y+s.dy
  s.z=s.z+s.dz
  
  --TODO test if arrived at waypoint
  
  if cylColl(s.x,s.y,s.wp.x,s.wp.y,10) then
    addMsg('en WP reached')
    s.dx=0
    s.dy=0
    s.dz=0
    --works so far
    
    enInitMslHome(s)
    return
  end
  
end

function enInitMslHome(s)
  s.bhv=enMslHome
  

end

--homes in on ennemy then radial explosion
function enMslHome(s,i)
  
  --calculate dx dy dz
  godx=game.px-s.x
  gody=game.py-s.y
  godz=game.pz-s.z
  --calculate sq hypotenuse length
--not exac in 3d , dunno care
  sqhyp=godx*godx+gody*gody+godz*godz

  --calculate percentage of hyp
  pcent= enSqMslHomingSpd/sqhyp
  
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

  if cylColl(s.x,s.y,game.px,game.py,10) then
    
    addMsg("ply hit")
    table.remove(game.gos,i)
    
    game.nrj=game.nrj-enDmg
    --TODO ply damage and halo
--    if s.go~=nil then
--      s.go:dmgBhv()
--    end
    
  end

end



function enRdrMissile(s)
  
  testMech:setTranslation(s.x,s.y,s.z)
  testMech:draw()
end




