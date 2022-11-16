cockpit=love.graphics.newImage("assets/cockpit.png")
cockpit:setFilter("linear", "nearest")

screenDamage=love.graphics.newImage("assets/screendamage.png")
screenDamage:setFilter("linear", "nearest")

evilDrill=g3d.newModel(
      "assets/evildrill.obj"
    , "assets/evildrill_tex.png"
      , {0,0,5
        }, 
      nil,
      --{0,0,math.pi}, rot, model doesnt have correct orientation 
      {3,3,3})



earth = g3d.newModel("assets/sphere.obj", "assets/earth.png", {4,0,0})
moon = g3d.newModel("assets/sphere.obj", "assets/moon.png", {4,5,0}, nil, 10)
starfieldbg = g3d.newModel("assets/sphere.obj", "assets/starfield.png", nil, nil, 500)
blueskybg= g3d.newModel("assets/sphere.obj", "assets/bluebluesky.png", nil, nil, 500)

tree=g3d.newModel("assets/treetest.obj","assets/treetest_tex.png", {4,5,0}, 
  {
--    math.pi/2,
    math.pi,
    0,
    0},
  1)

bgrass=g3d.newModel("assets/bgrass.obj","assets/bgrass_tex.png", {4,5,0}, {math.pi/2,0,0}, 4)

wcrate=g3d.newModel("assets/wcrate.obj","assets/wcrate_tex.png", {4,5,0}, {math.pi/2,0,0}, 6.5)

gift=g3d.newModel("assets/gift.obj","assets/gift_tex.png", {4,5,0}, {math.pi/2,0,0}, 2)


dfltTile= g3d.newModel(
            "assets/tarmac/tritarmac1.obj"
            ,"assets/tarmac/tarmac1_tex.png"
      , {5,5,0}, {math.pi/2,0,0}, {4,4,4})
    



tarmac= g3d.newModel(
            "assets/tarmac/tritarmac1.obj"
            ,"assets/tarmac/tarmac1_tex.png"
      , {5,5,0}, {math.pi/2,0,0}, {4,4,4})
    
    
    
billboardtest= g3d.newModel(
            "assets/tarmac/tritarmac1.obj"
            ,"assets/tarmac/tarmac1_tex.png"
      , {60,60,10}, {0,0,1.1}, {4,4,4})

tgtbill= g3d.newModel(
            "assets/tgtbill.obj"
            ,"assets/tgtbill_tex.png"
      , {60,60,10}, {0,math.pi,0}, {4,4,4})

reticle= g3d.newModel(
            "assets/tgt.obj"
            ,"assets/tgt_tex.png"
      , {60,60,10}, {0,math.pi,0}, {4,4,4})


energybill= g3d.newModel(
            "assets/energybill.obj"
            ,"assets/energybill_tex.png"
      , {60,60,10}, {0,math.pi,0}, {4,4,4})



starbad= g3d.newModel(
            "assets/starbad.obj"
            ,"assets/starbad_tex.png"
      , {60,60,10}, {0,math.pi,0}, {4,4,4})



    
dropzone= g3d.newModel(
            "assets/droptmp.obj"
            ,"assets/droptmp_tex.png"
      , {5,5,0}, {math.pi/2,0,0}, {4,4,4})
    
    
skyscraper=g3d.newModel(
      "assets/skyscraper/trisstex1.obj"
    , "assets/skyscraper/sstex1_tex.png"
      , {0,0,0}, {math.pi/2,0,0}, {8,8,8})
    --not working
--    tile = g3d.newModel(
--            "assets/floortile.obj"
--            ,"assets/floortile_tex.png"
--      , {5,5,0}, {100,0,0}, {0.5,0.5,0.5})

  testMech=g3d.newModel(
      "assets/votoms/trimechatex2.obj"
    , "assets/votoms/mymecha_tex.png"
      , {0,0,5}, 
      nil,
      --{0,0,math.pi}, rot, model doesnt have correct orientation 
      {3,3,3})
