
love.window.setTitle('srs2k22')

ww=800
wh=600

cvsw=320
cvsh=240

--love.window.setMode(ww,wh)

cvs=love.graphics.newCanvas(cvsw,cvsh)

zw=ww/cvsw
zh=wh/cvsh



function lookMinY()
    g3d.camera.target={g3d.camera.position[1],g3d.camera.position[2]-5,g3d.camera.position[3]}
    
     g3d.camera.updateViewMatrix()
end

function moveCameraAndTarget(dx,dy,dz)
    g3d.camera.position={g3d.camera.position[1]+dx,g3d.camera.position[2]+dy,g3d.camera.position[3]+dz}
    g3d.camera.target={g3d.camera.target[1]+dx,g3d.camera.target[2]+dy,g3d.camera.target[3]+dz}
    
     g3d.camera.updateViewMatrix()
end


-- written by groverbuger for g3d
-- september 2021
-- MIT license

-- space to fire missiles
-- shift for cannon


-- display galaxy at end of segment
-- big top ennergy bar
--level chaining, game over ,victory restart


--multi lock a la pd / rez with 1 2 3
-- suspicion of lock on explosion object
-- levels with ennemies htat activate and turn, then shoot
-- their shots are conical, turn, and you can lock them (need to)
-- you can lock them 3 times then fire
-- geometrick butterfly / star ennemies
-- BUG reticle shown when no lock
-- TODO 3 different lock icons (rots ? cycle when generating lock?)




-- rez / pd target
-- move reticle more than ply
-- rotate plane in camera axis 
-- draw line on xz and use sphere coll to see intersection( 

-- real triview with 4 render to tex for debug from the start
-- for dbg
-- only one displayed in the end



--collidable walls
--second level with ennemies firing at you, that you dodge
-- while trying to target
-- weaker guns, stronger missiles

-- BROKEN debug view on k shortcut : ortho from top ortho from back
-- with coords rendered?

-- level display and scroll, dragon move with arrows
-- 1 lvl scroll and display
-- 2 dragon display and move
-- 3 auto guns and colls with ennemies


-- model dragoon based on sketch
-- animate wings , tilt of body, legs

-- test collisions (lock not working yet)

-- load ply model
-- animate it (moving wings, body up down)
-- icon for mouse move
-- movement in level
-- selectable ennemies
-- cone object and test collision between cone object and model,
-- or invisible boxes moved at place of model

-- backup idea> jumping flash


 g3d = require "g3d"
require('models')
require('axis')
require('baddie')
require('maingameloop')
require('sfx')
require('levels')
require('gos')
require('bullet')
require('missile')
require('msg')
require('tblutil')
require('sphereColl')
require('halo')
require('starbad')
require('ennemymissile')

function cameraBehindPlayer()
  lookMinY()
  moveCameraAndTarget(game.px,game.py+16,0)
  
  
end
--initLvl(1)
startGame(1,"TAIL")




local tstcube= g3d.newModel("assets/testcube.obj", "assets/testcube_tex.png", {4,0,0})
--local earth = g3d.newModel("assets/sphere.obj", "assets/earth.png", {4,0,0})
local moon = g3d.newModel("assets/sphere.obj", "assets/moon.png", {4,5,0}, nil, 0.5)
local background = g3d.newModel("assets/sphere.obj", "assets/starfield.png", nil, nil, 500)
local timer = 0
--local reticle= love.graphics.newImage("assets/)


-- strange result
--camera.updateOrthographicMatrix()

--cameraBehindPlayer()



function love.update(dt)
--    timer = timer + dt
--    moon:setTranslation(math.cos(timer)*5 + 4, math.sin(timer)*5, 0)
--    moon:setRotation(0, 0, timer - math.pi/2)
--    g3d.camera.firstPersonMovement(dt)
    if love.keyboard.isDown "escape" then
        love.event.push "quit"
    end
    
    updateGame()

    
    
end

function love.draw()
    love.graphics.setCanvas({cvs,depth=true})
    love.graphics.clear()
--    earth:draw()
  
    drawGame()


--    moon:draw()
    background:draw()
--    bg:draw()
--    nt:draw()
    drawAxis()
    
    
    --TODO half working look collision (offset)
    --collision seems to work when camera is moving,
    -- but not just when looking around
    -- >look vector seems to not be updated
    --look
--    lvx,lvy,lvz=camera.getLookVector()
    
--    ret=g3d.collisions.rayIntersection(
--      tstcube.verts, 
--      tstcube.matrix, 
--    camera.position[1],
--    camera.position[2],
--    camera.position[3],
--    lvx,
--    lvy,
--    lvz
--    )

----    love.graphics.print("params")
--    if ret~=nil then
--      love.graphics.print('coll',0,20)
--      tstcube:draw()
--    else
--      tstcube:draw()
--    end
    
    love.graphics.setCanvas()
    cvs:setFilter("nearest", "nearest")
    love.graphics.draw(cvs,0,0,0,zw,zh)
    
    
    
    
end

function love.mousemoved(x,y, dx,dy)
  
  
  
--    g3d.camera.firstPersonLook(dx,dy)
end
