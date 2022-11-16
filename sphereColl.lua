--check collision of 2 shperes in 3d space

--TODO WIP NOT DONE we need to do collission on all 3 planes
--, not real sphere but good enough for proto

cylColl=function(a1,b1,a2,b2,r)
  
  --calculating hypotenus
  sqa=(a2-a1)*(a2-a1)
  sqb=(b2-b1)*(b2-b1)
  
  hyp2=sqa+sqb
  
  if r*r >hyp2 then 
    return true
  end
  
  --if here no coll
  return false
end


--TODO
--simplest least optimized 3d coll
spCylColl=function(x1,y1,z1,x2,y2,z2)
  
  
  
end

