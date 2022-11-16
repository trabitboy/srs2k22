

lineToHoriLine= function (x1,y1,x2,y2,yl)
  --TODO limit problems (parallel lines)
  -- if parallel lines we return nil(no intersect)
  
  -- find a coefficient in ax+b
  a= (x2-x1)/(y2-y1)
  b = y2-a*x2
  
  -- we nid to find the x where intersection occurs
  -- a*xcoll=yl
  xcoll=yl/a
  ycoll=xcoll*a+b
  
  return {x=xcoll,y=ycoll}
  
end