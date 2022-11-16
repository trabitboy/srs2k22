


function createLvl1Gos()
  ret={}
  table.insert(ret,createBaddie(2*8,17*8,3,-1,0))
  table.insert(ret,createBaddie(8*8,17*8,3,1,0))
  table.insert(ret,createBaddie(4*8,13*8,3,-1,0))
  table.insert(ret,createBaddie(7*8,13*8,3,1,0))
  table.insert(ret,createBaddie(2*8,10*8,3,-1,0))
  table.insert(ret,createBaddie(9*8,10*8,3,1,0))
  
--  table.insert(ret,createBaddie(10,10,0,1))
  
--  addMsg("ret table "..tbllngth(ret))
--  pprint(ret)
  return ret
end

lvl1=
  {
    music=track1,
    px=5,
    py=27,
    gosFac=createLvl1Gos
    ,
    mw=10,
    mh=25,
--    skybox=starfieldbg,
--    skybox=blueskybg,
--    ground=tarmac,
--    ground=bgrass,
--    wall=skyscraper,
--    wall=tree,
    map={
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,9,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,3,0,0,0,0,0,0,3,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,2,0,0,2,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,1,0,4,0,0,4,0,1,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,4,
              
        }
  } 

function createLvl2Gos()
  ret={}
  table.insert(ret,createStarBad(5*8,17*8,3,-1,0))
  table.insert(ret,createStarBad(15*8,13*8,3,1,0))
  table.insert(ret,createStarBad(5*8,9*8,3,-1,0))
  table.insert(ret,createStarBad(15*8,5*8,3,1,0))
--  table.insert(ret,createBaddie(5*8,17*8,3,-1,0))
--  table.insert(ret,createBaddie(15*8,17*8,3,1,0))
  
--  table.insert(ret,createBaddie(4*8,13*8,3,-1,0))
--  table.insert(ret,createBaddie(7*8,13*8,3,1,0))
--  table.insert(ret,createBaddie(2*8,10*8,3,-1,0))
--  table.insert(ret,createBaddie(9*8,10*8,3,1,0))
  
  return ret
end

lvl2=
  {
    music=track2,
    px=9,
    py=27,
    gosFac=createLvl2Gos
    ,
    mw=18,
    mh=25,
--    skybox=starfieldbg,
--    skybox=blueskybg,
--    ground=tarmac,
--    ground=bgrass,
--    wall=skyscraper,
--    wall=tree,
    map={
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,3,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,2,0,0,2,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,4,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
              
        }
  } 


function createLvl3Gos()
  ret={}
  table.insert(ret,createStarBad(8.5*8,17*8,0,-1,0))
  table.insert(ret,createStarBad(10.5*8,14*8,2*8,-1,0))
  table.insert(ret,createStarBad(8.5*8,11*8,4*8,-1,0))
  table.insert(ret,createStarBad(6.5*8,8*8,2*8,-1,0))


  table.insert(ret,createStarBad(8.5*8-3*8,17*8,0,-1,0))
  table.insert(ret,createStarBad(10.5*8-3*8,14*8,2*8,-1,0))
  table.insert(ret,createStarBad(8.5*8-3*8,11*8,4*8,-1,0))
  table.insert(ret,createStarBad(6.5*8-3*8,8*8,2*8,-1,0))


  table.insert(ret,createStarBad(8.5*8+3*8,17*8,0,-1,0))
  table.insert(ret,createStarBad(10.5*8+3*8,14*8,2*8,-1,0))
  table.insert(ret,createStarBad(8.5*8+3*8,11*8,4*8,-1,0))
  table.insert(ret,createStarBad(6.5*8+3*8,8*8,2*8,-1,0))


--  table.insert(ret,createStarBad(15*8,13*8,3,1,0))
--  table.insert(ret,createBaddie(8*8,17*8,3,1,0))
--  table.insert(ret,createStarBad(5*8,9*8,3,-1,0))
--  table.insert(ret,createBaddie(4*8,13*8,3,-1,0))
--  table.insert(ret,createStarBad(15*8,5*8,3,1,0))
--  table.insert(ret,createBaddie(7*8,13*8,3,1,0))
  
  return ret
end

lvl3=
  {
    music=track3,
    px=9,
    py=27,
    gosFac=createLvl3Gos
    ,
    mw=18,
    mh=25,
--    skybox=starfieldbg,
--    skybox=blueskybg,
--    ground=tarmac,
--    ground=bgrass,
--    wall=skyscraper,
--    wall=tree,
    map={
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,9,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,3,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,2,0,0,2,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,4,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
      4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,
              
        }
  } 


levels={
    lvl1,lvl2,lvl3
  
  }

function initLvl(num)
  numLvl=num
  curLvl=levels[numLvl]
  game.gos=curLvl.gosFac()
  game.px=curLvl.px*8
  game.py=curLvl.py*8

end

