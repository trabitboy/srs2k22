
--game state

xzSpd=0.5

shipBaseSpeed=-0.05
tstBillRot=0
stdCoolDown=20

bulletCoolDown=stdCoolDown

function startGame(numLvl,lview)
  
  game={
    --initLvl
  --    px=curLvl.px*8,
  --    py=curLvl.py*8,
      numLvl=numLvl,
      victory=false,
      defeat=false,
      nrj=100,
      pz=10,
      gos={},
      blts={},
      view=lview,
      mouseTgt={x=160,y=120} --NOT USED YET
      
    }
  initLvl(numLvl)
--  cameraBehindPlayer()

  curLvl.music:setVolume(0.3)

  curLvl.music:play()

    g3d.camera.position[1]=game.px
    g3d.camera.position[2]=game.py+16
    g3d.camera.position[3]=0
    g3d.camera.target={g3d.camera.position[1],g3d.camera.position[2]-5,g3d.camera.position[3]}
--    g3d.camera.target[1]=game.px
--    g3d.camera.target[2]=0
--    g3d.camera.target[3]=0
    g3d.camera.updateViewMatrix()


  
end

missileInhib=0

function updateGame()
  
  if not curLvl.music:isPlaying( ) then
		love.audio.play( curLvl.music)
	end
  
  if game.nrj<0 then 
    game.defeat=true
    table.insert(game.gos,createHalo(game.px,game.py,game.pz,0,0))
  end
  
  
  if game.py<0 and game.defeat==false then
    
    if game.numLvl<#levels then
      startGame(game.numLvl+1,"TAIL")
    else
      game.victory = true
    end
  end
  
  tickMsg()
  tstBillRot=tstBillRot+0.1
  
  
  if missileInhib>0 then
    missileInhib=missileInhib-1
  end
  
  if bulletCoolDown>0 then
    bulletCoolDown=bulletCoolDown-1
  end

  
  bank=0
  
--  game.py=game.py-0.01
  ty=shipBaseSpeed
  if (love.keyboard.isDown('s') or love.keyboard.isDown('lshift')) then
    ty=ty+shipBaseSpeed*10
  end
  
  tx=0
  tz=0
    
--  if love.keyboard.isDown('r') then
--    game.view="TAIL"
--  end
    
--  if love.keyboard.isDown('t') then
--    --NOT WORKING
--    game.view="TOP"
--    addMsg('top')
--  end
  
  if love.keyboard.isDown('right') then
--    game.px=game.px-0.1
    tx=-xzSpd
    bank=-math.pi/4
  end
  if love.keyboard.isDown('left') then
--    game.px=game.px+0.1
    tx=xzSpd
    bank=math.pi/4
  end
  if love.keyboard.isDown('down') then
--    game.pz=game.pz-0.1
    tz=-xzSpd
  end
  if love.keyboard.isDown('up') then
--    game.pz=game.pz+0.1
    tz=xzSpd
  end
  
  if (love.keyboard.isDown('return') or love.keyboard.isDown('lctrl') )
      and bulletCoolDown==0 then
    addMsg("blt")
    bulletCoolDown=stdCoolDown
    spawnBullet(game.px,game.py,game.pz)
    
  end
  
  --WIP multi 3 lock
  if #currentLocks<maxLock then
    goLock = missileLock(game.px,game.pz)
    if goLock ~=nil then
      playSD(sLock)
      table.insert(currentLocks,goLock)
    addMsg('lock '..#currentLocks)
    end
  end
  
--  if goLock~=nil then
--    addMsg('lock')
--  end
--  if love.keyboard.isDown('rshift') and goLock~=nil then
  if missileInhib==0 and love.keyboard.isDown('space') and #currentLocks>0 then
    addMsg("msl")
    playSD(sMissile)
    for i,go in ipairs(currentLocks)
    do
      spawnMissile(game.px,game.py,game.pz,go)
    end
    currentLocks={}
    missileInhib=30
  end
  
  
  game.py=game.py+ty
  game.px=game.px+tx
  game.pz=game.pz+tz
--  addMsg('ply '..game.px..' '..game.py..' '..game.pz)
  
  
  updBullets()
  updateGos()
  
  
  if game.view=="TAIL" then
  
    g3d.camera.position[2]=g3d.camera.position[2]+ty
    g3d.camera.target[2]=g3d.camera.target[2]+ty
    g3d.camera.position[1]=g3d.camera.position[1]+tx
    g3d.camera.target[1]=g3d.camera.target[1]+tx
    g3d.camera.position[3]=g3d.camera.position[3]+tz
    g3d.camera.target[3]=g3d.camera.target[3]+tz
    g3d.camera.updateViewMatrix()
  elseif game.view=="TOP" then
    --TODO not working
--    g3d.camera.position[2]=g3d.camera.position[2]+ty
    
--    g3d.camera.target[1]=g3d.camera.position[1]
--    g3d.camera.target[2]=g3d.camera.position[2]
--    g3d.camera.target[3]=g3d.camera.position[3]+10
    g3d.camera.target[1]=game.px
    g3d.camera.target[2]=game.py
--    g3d.camera.target[1]=0
--    g3d.camera.target[2]=0
    g3d.camera.target[3]=0
    g3d.camera.updateViewMatrix()
  
  end
--  cameraBehindPlayer()
--  moveCameraAndTarget(game.px,game.py+8,0)
end


function drawGame()
  
    
  
  --dbg
    grnd=dropzone
    
    
  
  --   tx=5
    ty=-20
--    tz=0
    for j=1,curLvl.mh
    do
      for i=1,curLvl.mw
      do
--        tnum=curLvl[8*j+i]
        --TODO map is 16 wide, display incorrect

        tnum=curLvl.map[curLvl.mw*(j-1)+i]
        if tnum==0 then
          dfltTile:setTranslation(i*8,j*8,ty)
          dfltTile:draw()
        elseif tnum==1 then
          grnd:setTranslation(i*8,j*8,ty)
          grnd:draw()
        elseif tnum==2 then
          grnd:setTranslation(i*8,j*8,ty)
          grnd:draw()
--          wll:setTranslation(i*8,j*8,ty+2)
--          wll:draw()
        elseif tnum==3 then
          dropzone:setTranslation(i*8,j*8,ty)
          dropzone:draw()
--          tgtbill:setTranslation(i*8,j*8,10)
--          tgtbill:draw()
        elseif tnum==4 then
          skyscraper:setTranslation(i*8,j*8,ty)
          skyscraper:draw()
--          tgtbill:setTranslation(i*8,j*8,10)
--          tgtbill:draw()
          
        end
      
        
      end
    end  
  
    renderGos()
  
    if(goLock~=nil) then
      reticle:setTranslation(goLock.x,goLock.y,goLock.z)
      reticle:draw()
    end
  
    renderBullets()
  
    testMech:setTranslation(game.px,game.py,game.pz)
    testMech:setRotation(0,bank,0)
    testMech:draw()
    
    --tgt could just be transparent box?
    -- or 2 interlocked circles that spin?
--    tgtbill:setTranslation(game.px,game.py-10,game.pz)
--    tgtbill:draw()
    
    reticle:setTranslation(game.px,game.py-10,game.pz)
    reticle:draw()
  
    
  
    love.graphics.setColor(0,1,0,1)
    love.graphics.rectangle('fill',0,220,320*game.nrj/100,20)
    
    love.graphics.setColor(1,1,1,1)
  
  
    msgToCvs()
    
    if game.victory == true then
      love.graphics.print("YOU WIN ^^",60,100)
    end
    
    if game.defeat == true then
      love.graphics.print("YOU LOSE O_o",60,100)
      
    end
    
end