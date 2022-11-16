



axiszbase=0
axisxbase=5
axisybase=-2

cubescale=1

xaxis={10+axisxbase,axisybase,axiszbase}
yaxis={axisxbase,10+axisybase,axiszbase}
zaxis={axisxbase,axisybase,10+axiszbase}

  xcube=  g3d.newModel(
            "assets/xcube.obj"
            ,"assets/debugtex.png"
      , xaxis,
      nil,
      {cubescale,cubescale,cubescale}
      )
  
  zerocube=  g3d.newModel(
            "assets/tri0cube.obj"
            ,"assets/debugtex.png"
      , {axisxbase,axisybase,axiszbase},
      nil,
      {cubescale,cubescale,cubescale}
      )
  
  ycube= g3d.newModel(
            "assets/triycube.obj"
            ,"assets/debugtex.png"
      , yaxis,
      nil,
      {cubescale,cubescale,cubescale}
      )
  
   zcube=g3d.newModel(
            "assets/trizcube.obj"
            ,"assets/debugtex.png"
      , zaxis,
      nil,
      {cubescale,cubescale,cubescale}
      )

drawAxis=function()
    --xcube 
    xcube:draw()
    ycube:draw()
    zcube:draw()
    --0cube
    zerocube:draw()
    
end
